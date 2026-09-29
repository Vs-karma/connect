import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/catalog/presentation/manage_collections_screen.dart';
import 'package:connect/module/catalog/presentation/price_format.dart';
import 'package:connect/module/catalog/presentation/product_edit_screen.dart';
import 'package:connect/module/catalog/presentation/product_share_picker.dart';
import 'package:connect/module/catalog/presentation/store_setup_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The seller's store manager: header + collection filter + products, with add/edit/hide/delete/share.
class MyStoreScreen extends ConsumerStatefulWidget {
  const MyStoreScreen({super.key});

  @override
  ConsumerState<MyStoreScreen> createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends ConsumerState<MyStoreScreen> {
  String? _collection; // null = All, "none" = Others, else collectionId

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final storeAsync = ref.watch(myStoreProvider);

    return storeAsync.when(
      loading: () => Scaffold(
        appBar: CommonAppBar(title: l10n.myStore),
        body: SafeArea(
          top: false,
          child: Column(
            children: const [
              StoreHeaderSkeleton(),
              SizedBox(height: 14),
              Expanded(child: ProductListSkeleton()),
            ],
          ),
        ),
      ),
      error: (_, __) => Scaffold(
        appBar: CommonAppBar(title: l10n.myStore),
        body: Center(
          child: Text(l10n.couldNotLoadStore,
              style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
        ),
      ),
      data: (store) => store == null ? _onboarding(context, ref, l10n) : _store(context, ref, store, l10n),
    );
  }

  // ---- No store yet ----
  Widget _onboarding(BuildContext context, WidgetRef ref, l10n) {
    return Scaffold(
      appBar: CommonAppBar(title: l10n.myStore),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storefront, size: 96.sp, color: AppColors.border),
              SizedBox(height: 16.h),
              Text(l10n.setUpYourStore,
                  style: AppTextStyles.style18px.w700.copyWith(color: AppColors.textPrimary)),
              SizedBox(height: 28.h),
              AppButton(
                label: l10n.createStore,
                icon: Icons.add,
                width: 220.w,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const StoreSetupScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Store + products ----
  Widget _store(BuildContext context, WidgetRef ref, CatalogStore store, l10n) {
    final productsAsync = ref.watch(myProductsProvider);
    return Scaffold(
      appBar: CommonAppBar(
        title: l10n.myStore,
        actions: [
          IconButton(
            tooltip: l10n.collections,
            icon: Icon(Icons.collections_bookmark_outlined, color: AppColors.textPrimary, size: 22.sp),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ManageCollectionsScreen()),
            ),
          ),
          IconButton(
            tooltip: l10n.editStore,
            icon: Icon(Icons.edit_outlined, color: AppColors.textPrimary, size: 22.sp),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => StoreSetupScreen(existing: store)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const ProductEditScreen()),
        ),
        icon: const Icon(Icons.add, color: AppColors.onPrimary),
        label: Text(l10n.addProduct,
            style: AppTextStyles.style14px.w700.copyWith(color: AppColors.onPrimary)),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _header(context, store, l10n),
            Divider(height: 1, color: AppColors.divider),
            SizedBox(height: 14.h),
            _filterBar(l10n),
            Expanded(
              child: productsAsync.when(
                loading: () => const ProductListSkeleton(),
                error: (_, __) => Center(
                  child: Text(l10n.couldNotLoadProducts,
                      style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
                ),
                data: (products) {
                  if (products.isEmpty) return _emptyProducts(l10n);
                  final filtered = _applyFilter(products);
                  if (filtered.isEmpty) {
                    return Center(
                      child: Text(l10n.noProductsYet,
                          style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () => ref.read(myProductsProvider.notifier).reload(),
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 90.h),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (_, i) => _productRow(context, ref, filtered[i], l10n),
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

  List<Product> _applyFilter(List<Product> products) {
    if (_collection == null) return products;
    if (_collection == 'none') return products.where((p) => p.collectionIds.isEmpty).toList();
    return products.where((p) => p.collectionIds.contains(_collection)).toList();
  }

  /// Collection filter chips (All · collections · Others). Hidden if there are no collections.
  Widget _filterBar(l10n) {
    final async = ref.watch(myCollectionsProvider);
    final collections = async.value ?? const <Collection>[];
    if (collections.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          _filterChip(l10n.allFilter, _collection == null, () => setState(() => _collection = null)),
          for (final c in collections)
            _filterChip(c.name, _collection == c.id, () => setState(() => _collection = c.id)),
          _filterChip(l10n.othersFilter, _collection == 'none', () => setState(() => _collection = 'none')),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool selected, VoidCallback onTap) {
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

  Widget _header(BuildContext context, CatalogStore store, l10n) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
      child: Row(
        children: [
          _logo(store),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(store.name,
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
                      child: Text(localizedCategory(context.l10n, store.category),
                          style: AppTextStyles.style11px.w600.copyWith(color: AppColors.primary)),
                    ),
                    SizedBox(width: 8.w),
                    Text(context.l10n.productsCount(store.productCount),
                        style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
                if (store.tagline != null && store.tagline!.isNotEmpty) ...[
                  SizedBox(height: 6.h),
                  Text(store.tagline!,
                      style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logo(CatalogStore store) {
    final size = 60.w;
    if (store.logoUrl != null && store.logoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: EndPoints.mediaUrl(store.logoUrl!),
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
        child: Icon(Icons.storefront, color: AppColors.primary, size: 28.sp),
      );

  Widget _emptyProducts(l10n) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined, size: 84.sp, color: AppColors.border),
            SizedBox(height: 14.h),
            Text(l10n.noProductsYet,
                style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
            SizedBox(height: 6.h),
            Text(l10n.addFirstProduct,
                style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );

  Widget _productRow(BuildContext context, WidgetRef ref, Product p, l10n) {
    final outOfStock = p.availability == 'OUT_OF_STOCK';
    final hidden = p.status == 'HIDDEN';
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProductEditScreen(existing: p)),
      ),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: p.imageUrls.isEmpty
                  ? Container(
                      width: 56.w,
                      height: 56.w,
                      color: AppColors.card,
                      alignment: Alignment.center,
                      child: Icon(Icons.image_outlined, color: AppColors.border, size: 24.sp))
                  : CachedNetworkImage(
                      imageUrl: EndPoints.mediaUrl(p.imageUrls.first),
                      width: 56.w,
                      height: 56.w,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Container(width: 56.w, height: 56.w, color: AppColors.card),
                    ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style14px.w700.copyWith(color: AppColors.textPrimary)),
                  SizedBox(height: 3.h),
                  Text(
                    p.price != null ? formatPrice(p.price, p.currency) : l10n.dmForPrice,
                    style: AppTextStyles.style13px.w700.copyWith(color: AppColors.primary),
                  ),
                  if (outOfStock || hidden) ...[
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        if (outOfStock) _tag(l10n.outOfStock, AppColors.danger),
                        if (outOfStock && hidden) SizedBox(width: 6.w),
                        if (hidden) _tag(l10n.hiddenLabel, AppColors.textSecondary),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            _menu(context, ref, p, l10n, outOfStock, hidden),
          ],
        ),
      ),
    );
  }

  Widget _tag(String text, Color color) => Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(6.r)),
        child: Text(text, style: AppTextStyles.style10px.w600.copyWith(color: color)),
      );

  Widget _menu(BuildContext context, WidgetRef ref, Product p, l10n, bool outOfStock, bool hidden) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: AppColors.textSecondary, size: 20.sp),
      color: AppColors.card,
      onSelected: (v) => _onAction(context, ref, p, v, l10n),
      itemBuilder: (_) => [
        PopupMenuItem(value: 'edit', child: Text(l10n.editProduct, style: AppTextStyles.style14px.w600)),
        PopupMenuItem(
            value: 'stock',
            child: Text(outOfStock ? l10n.inStock : l10n.outOfStock, style: AppTextStyles.style14px.w600)),
        PopupMenuItem(
            value: 'visibility',
            child: Text(hidden ? l10n.unhide : l10n.hide, style: AppTextStyles.style14px.w600)),
        PopupMenuItem(value: 'share', child: Text(l10n.shareToChat, style: AppTextStyles.style14px.w600)),
        PopupMenuItem(
          value: 'delete',
          child: Text(l10n.delete, style: AppTextStyles.style14px.w600.copyWith(color: AppColors.danger)),
        ),
      ],
    );
  }

  Future<void> _onAction(BuildContext context, WidgetRef ref, Product p, String action, l10n) async {
    final repo = ref.read(catalogRepositoryProvider);
    switch (action) {
      case 'edit':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductEditScreen(existing: p)));
        break;
      case 'stock':
        await _guard(context, ref, () => repo.updateProduct(p.id,
            availability: p.availability == 'OUT_OF_STOCK' ? 'IN_STOCK' : 'OUT_OF_STOCK'));
        break;
      case 'visibility':
        await _guard(context, ref,
            () => repo.updateProduct(p.id, status: p.status == 'HIDDEN' ? 'ACTIVE' : 'HIDDEN'));
        break;
      case 'share':
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductSharePicker(productId: p.id)));
        break;
      case 'delete':
        await _confirmDelete(context, ref, p, l10n);
        break;
    }
  }

  Future<void> _guard(BuildContext context, WidgetRef ref, Future<void> Function() op) async {
    try {
      await op();
      ref.read(myProductsProvider.notifier).reload();
      ref.invalidate(myStoreProvider);
    } catch (_) {
      if (context.mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotSaveProduct);
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Product p, l10n) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.delete, style: AppTextStyles.style16px.w700),
        content: Text(l10n.deleteProductConfirm(p.name),
            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.danger)),
          ),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await ref.read(catalogRepositoryProvider).deleteProduct(p.id);
      ref.read(myProductsProvider.notifier).reload();
      ref.invalidate(myStoreProvider);
      if (context.mounted) ScaffoldToast.showSuccessBottom(context, context.l10n.productDeleted);
    } catch (_) {
      if (context.mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotDeleteProduct);
    }
  }
}
