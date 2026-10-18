import 'package:connect/app/app_nav.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/catalog/presentation/store_view_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The other person's profile: their info + their store (if they have one).
class PeerProfileScreen extends ConsumerWidget {
  final String userId;
  final String name;
  final String? avatarUrl;
  final String? phone;

  const PeerProfileScreen({
    super.key,
    required this.userId,
    required this.name,
    this.avatarUrl,
    this.phone,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final storeAsync = ref.watch(storeByUserProvider(userId));

    return Scaffold(
      appBar: CommonAppBar(title: name),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          children: [
            Center(
              child: Column(
                children: [
                  UserAvatar(name: name, imageUrl: avatarUrl, size: 96),
                  SizedBox(height: 14.h),
                  Text(name,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style20px.w700.copyWith(color: AppColors.textPrimary)),
                  if (phone != null && phone!.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(phone!,
                        style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
                  ],
                ],
              ),
            ),
            SizedBox(height: 28.h),
            storeAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (store) => store == null ? const SizedBox.shrink() : _storeCard(context, store, l10n),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storeCard(BuildContext context, PublicStore store, l10n) {
    return GestureDetector(
      onTap: () => revealOrPush(
        context,
        storeRouteName(store.id),
        (_) => StoreViewScreen(catalogId: store.id),
      ),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.border),
        ),
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
                      style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textPrimary)),
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
                  SizedBox(height: 6.h),
                  Text(l10n.viewStore,
                      style: AppTextStyles.style12px.w700.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 22.sp),
          ],
        ),
      ),
    );
  }

  Widget _logo(PublicStore store) {
    final size = 56.w;
    if (store.logoUrl != null && store.logoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
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
            color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14.r)),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 26.sp),
      );
}
