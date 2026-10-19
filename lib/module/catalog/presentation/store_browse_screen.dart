import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/app/app_nav.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/catalog/presentation/my_store_screen.dart';
import 'package:connect/module/catalog/presentation/store_view_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:connect/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Marketplace: search + browse all stores. Borderless, image-forward feed with
/// category filter tiles. A header action opens the user's own shop (My Store).
class StoreBrowseScreen extends ConsumerStatefulWidget {
  const StoreBrowseScreen({super.key});

  @override
  ConsumerState<StoreBrowseScreen> createState() => _StoreBrowseScreenState();
}

class _StoreBrowseScreenState extends ConsumerState<StoreBrowseScreen> {
  String _query = '';
  String? _category; // null = All; else a category code from kCatalogCategories
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

  List<PublicStore> _filter(List<PublicStore> stores) {
    if (_category == null) return stores;
    return stores.where((s) => s.category == _category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(storeBrowseProvider(_query));
    final hasShop = ref.watch(myStoreProvider).value != null;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(l10n, hasShop),
            _categoryTiles(l10n),
            Expanded(
              child: async.when(
                loading: () => const StoreFeedSkeleton(),
                error: (_, __) => _message(l10n.couldNotLoadStores),
                data: (page) {
                  final stores = _filter(page.content);
                  if (stores.isEmpty) return _empty(l10n);
                  return RefreshIndicator(
                    onRefresh: () async => ref.invalidate(storeBrowseProvider(_query)),
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 20.h),
                      itemCount: stores.length,
                      itemBuilder: (_, i) => _storeItem(context, stores[i], l10n),
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

  // ---- Header: search + shop action ----

  Widget _header(l10n, bool hasShop) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      child: Row(
        children: [
          Expanded(child: AppSearchField(hintText: l10n.searchStores, onChanged: _onSearch)),
          SizedBox(width: 10.w),
          _shopButton(hasShop),
        ],
      ),
    );
  }

  Widget _shopButton(bool hasShop) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const MyStoreScreen()),
      ),
      child: Container(
        width: 46.w,
        height: 46.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.storefront, color: AppColors.primary, size: 24.sp),
            Positioned(
              right: -8,
              bottom: -8,
              child: Container(
                width: 18.w,
                height: 18.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.scaffold, width: 2),
                ),
                child: Icon(hasShop ? Icons.edit : Icons.add,
                    color: AppColors.onPrimary, size: 11.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Category filter tiles ----

  Widget _categoryTiles(l10n) {
    return SizedBox(
      height: 78.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          _catTile(null, l10n.allFilter, const _CatStyle(Color(0xFFEAF5F0), Color(0xFF2E8B6F), Icons.apps)),
          for (final code in kCatalogCategories)
            _catTile(code, localizedCategory(l10n, code), _catStyle(code)),
        ],
      ),
    );
  }

  Widget _catTile(String? code, String label, _CatStyle style) {
    final selected = _category == code;
    return GestureDetector(
      onTap: () => setState(() => _category = code),
      child: Container(
        width: 62.w,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: style.bg,
                borderRadius: BorderRadius.circular(16.r),
                border: selected ? Border.all(color: style.fg, width: 2) : null,
              ),
              child: Icon(style.icon, color: style.fg, size: 22.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: (selected ? AppTextStyles.style10px.w700 : AppTextStyles.style10px.w500)
                  .copyWith(color: selected ? AppColors.textPrimary : AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Store feed item (borderless) ----

  Widget _storeItem(BuildContext context, PublicStore s, l10n) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: InkWell(
        onTap: () => revealOrPush(
          context,
          storeRouteName(s.id),
          (_) => StoreViewScreen(catalogId: s.id),
        ),
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cover(s),
            SizedBox(height: 11.h),
            Row(
              children: [
                _logo(s),
                SizedBox(width: 11.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textPrimary)),
                      SizedBox(height: 2.h),
                      Text(
                        '${localizedCategory(l10n, s.category)}  ·  ${l10n.productsCount(s.productCount)}',
                        style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20.sp),
              ],
            ),
            if (s.tagline != null && s.tagline!.isNotEmpty) ...[
              SizedBox(height: 7.h),
              Text(s.tagline!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textHint, height: 1.4)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _cover(PublicStore s) {
    final url = (s.coverImageUrl != null && s.coverImageUrl!.isNotEmpty)
        ? s.coverImageUrl!
        : (s.logoUrl != null && s.logoUrl!.isNotEmpty ? s.logoUrl! : null);
    final height = 158.h;
    final radius = BorderRadius.circular(16.r);
    if (url == null) {
      return ClipRRect(borderRadius: radius, child: _coverFallback(height));
    }
    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: EndPoints.mediaUrl(url),
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        placeholder: (_, __) =>
            Container(height: height, color: AppColors.primary.withValues(alpha: 0.06)),
        errorWidget: (_, __, ___) => _coverFallback(height),
      ),
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
    final size = 38.w;
    if (s.logoUrl != null && s.logoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(11.r),
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
            color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(11.r)),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 19.sp),
      );

  // ---- States ----

  Widget _message(String text) => Center(
        child: Text(text,
            style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
      );

  Widget _empty(l10n) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront_outlined, size: 96.sp, color: AppColors.border),
            SizedBox(height: 16.h),
            Text(_query.isEmpty && _category == null ? l10n.noStoresYet : l10n.noStoresFound,
                textAlign: TextAlign.center,
                style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );
}

/// Fixed category accent: a soft tint, a stronger foreground, and an icon.
class _CatStyle {
  final Color bg;
  final Color fg;
  final IconData icon;
  const _CatStyle(this.bg, this.fg, this.icon);
}

_CatStyle _catStyle(String code) {
  switch (code) {
    case 'Fashion':
      return const _CatStyle(Color(0xFFFBEAF0), Color(0xFF993556), Icons.checkroom);
    case 'Grocery':
      return const _CatStyle(Color(0xFFE6F1FB), Color(0xFF185FA5), Icons.shopping_cart_outlined);
    case 'Electronics':
      return const _CatStyle(Color(0xFFFAEEDA), Color(0xFF854F0B), Icons.devices_other);
    case 'Food':
      return const _CatStyle(Color(0xFFE1F5EE), Color(0xFF0F6E56), Icons.restaurant);
    case 'Home':
      return const _CatStyle(Color(0xFFEEEDFE), Color(0xFF534AB7), Icons.chair_outlined);
    case 'Beauty':
      return const _CatStyle(Color(0xFFFDEBF2), Color(0xFFC2356B), Icons.brush);
    case 'Services':
      return const _CatStyle(Color(0xFFFDF0E7), Color(0xFFB5521F), Icons.handyman);
    default:
      return const _CatStyle(Color(0xFFF1EFE8), Color(0xFF5F5E5A), Icons.category_outlined);
  }
}
