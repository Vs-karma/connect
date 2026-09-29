import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/catalog/presentation/product_detail_screen.dart';
import 'package:connect/module/catalog/presentation/widgets/product_card.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Buyer-facing store: header + collection filter chips + product grid.
class StoreViewScreen extends ConsumerStatefulWidget {
  final String catalogId;

  const StoreViewScreen({super.key, required this.catalogId});

  @override
  ConsumerState<StoreViewScreen> createState() => _StoreViewScreenState();
}

class _StoreViewScreenState extends ConsumerState<StoreViewScreen> {
  String? _collection; // null = All, "none" = Others, else collectionId

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final storeAsync = ref.watch(publicStoreProvider(widget.catalogId));
    final collectionsAsync = ref.watch(publicCollectionsProvider(widget.catalogId));
    final productsAsync =
        ref.watch(storeProductsProvider((catalogId: widget.catalogId, collection: _collection)));

    return Scaffold(
      appBar: CommonAppBar(title: storeAsync.value?.name ?? l10n.viewStore),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(publicStoreProvider(widget.catalogId));
          ref.invalidate(publicCollectionsProvider(widget.catalogId));
          ref.invalidate(storeProductsProvider((catalogId: widget.catalogId, collection: _collection)));
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _header(context, storeAsync, l10n)),
            SliverToBoxAdapter(child: _chips(collectionsAsync, l10n)),
            productsAsync.when(
              loading: () => const SliverToBoxAdapter(child: ProductGridSkeleton()),
              error: (_, __) => SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40.w),
                  child: Center(
                    child: Text(l10n.couldNotLoadProducts,
                        style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
                  ),
                ),
              ),
              data: (page) {
                if (page.content.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(40.w),
                      child: Center(
                        child: Text(l10n.storeHasNoProducts,
                            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
                      ),
                    ),
                  );
                }
                return SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.72,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (_, i) {
                        final p = page.content[i];
                        return ProductGridTile(
                          product: p,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: p.id)),
                          ),
                        );
                      },
                      childCount: page.content.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _chips(AsyncValue<List<PublicCollection>> collectionsAsync, l10n) {
    final collections = collectionsAsync.value ?? const <PublicCollection>[];
    if (collections.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          _chip(l10n.allFilter, _collection == null, () => setState(() => _collection = null)),
          for (final c in collections)
            _chip(c.name, _collection == c.id, () => setState(() => _collection = c.id)),
          _chip(l10n.othersFilter, _collection == 'none', () => setState(() => _collection = 'none')),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: selected ? AppColors.primary : AppColors.border),
          ),
          child: Text(label,
              style: AppTextStyles.style13px.w600
                  .copyWith(color: selected ? AppColors.onPrimary : AppColors.textPrimary)),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, AsyncValue<PublicStore> storeAsync, l10n) {
    return storeAsync.when(
      loading: () => const StoreHeaderSkeleton(),
      error: (_, __) => Padding(
        padding: EdgeInsets.all(20.w),
        child: Text(l10n.couldNotLoadStore,
            style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
      ),
      data: (s) => Padding(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
        child: Row(
          children: [
            _logo(s),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style18px.w700.copyWith(color: AppColors.textPrimary)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Text(localizedCategory(context.l10n, s.category),
                            style: AppTextStyles.style11px.w600.copyWith(color: AppColors.primary)),
                      ),
                      SizedBox(width: 8.w),
                      Text(context.l10n.productsCount(s.productCount),
                          style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                  if (s.tagline != null && s.tagline!.isNotEmpty) ...[
                    SizedBox(height: 6.h),
                    Text(s.tagline!,
                        style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo(PublicStore s) {
    final size = 64.w;
    if (s.logoUrl != null && s.logoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: EndPoints.mediaUrl(s.logoUrl!),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => _logoFallback(size),
        ),
      );
    }
    return _logoFallback(size);
  }

  Widget _logoFallback(double size) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(16.r)),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 30.sp),
      );
}
