import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/catalog/presentation/store_view_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:connect/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Marketplace: browse and search all stores.
class StoreBrowseScreen extends ConsumerStatefulWidget {
  const StoreBrowseScreen({super.key});

  @override
  ConsumerState<StoreBrowseScreen> createState() => _StoreBrowseScreenState();
}

class _StoreBrowseScreenState extends ConsumerState<StoreBrowseScreen> {
  String _query = '';
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (mounted) setState(() => _query = value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(storeBrowseProvider(_query));

    return Scaffold(
      appBar: CommonAppBar(title: l10n.storesTab, showBack: false),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
              child: AppSearchField(hintText: l10n.searchStores, onChanged: _onSearch),
            ),
            Expanded(
              child: async.when(
                loading: () => const StoreCardListSkeleton(),
                error: (_, __) => Center(
                  child: Text(l10n.couldNotLoadStores,
                      style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
                ),
                data: (page) {
                  if (page.content.isEmpty) {
                    return _empty(l10n);
                  }
                  return RefreshIndicator(
                    onRefresh: () async => ref.invalidate(storeBrowseProvider(_query)),
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 20.h),
                      itemCount: page.content.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (_, i) => _storeTile(context, page.content[i], l10n),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty(l10n) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront_outlined, size: 96.sp, color: AppColors.border),
            SizedBox(height: 16.h),
            Text(_query.isEmpty ? l10n.noStoresYet : l10n.noStoresFound,
                textAlign: TextAlign.center,
                style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );

  Widget _storeTile(BuildContext context, PublicStore s, l10n) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => StoreViewScreen(catalogId: s.id)),
      ),
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top: a product photo from this store.
            _cover(s),
            // Bottom: store details.
            Padding(
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 12.w, 14.h),
              child: Row(
                children: [
                  _logo(s),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textPrimary)),
                        SizedBox(height: 5.h),
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
                                style:
                                    AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
                          ],
                        ),
                        if (s.tagline != null && s.tagline!.isNotEmpty) ...[
                          SizedBox(height: 5.h),
                          Text(s.tagline!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
                        ],
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 22.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The store's preview product photo (falls back to logo, then an icon).
  Widget _cover(PublicStore s) {
    final url = (s.coverImageUrl != null && s.coverImageUrl!.isNotEmpty)
        ? s.coverImageUrl!
        : (s.logoUrl != null && s.logoUrl!.isNotEmpty ? s.logoUrl! : null);
    final height = 150.h;
    if (url == null) return _coverFallback(height);
    return CachedNetworkImage(
      imageUrl: EndPoints.mediaUrl(url),
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(
        height: height,
        color: AppColors.primary.withValues(alpha: 0.06),
      ),
      errorWidget: (_, __, ___) => _coverFallback(height),
    );
  }

  Widget _coverFallback(double height) => Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        color: AppColors.primary.withValues(alpha: 0.08),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 44.sp),
      );

  Widget _logo(PublicStore s) {
    final size = 44.w;
    if (s.logoUrl != null && s.logoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          imageUrl: EndPoints.mediaUrl(s.logoUrl!),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => _fallback(size),
        ),
      );
    }
    return _fallback(size);
  }

  Widget _fallback(double size) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12.r)),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 22.sp),
      );
}
