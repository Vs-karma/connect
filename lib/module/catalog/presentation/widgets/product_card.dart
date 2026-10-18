import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/app/app_nav.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/price_format.dart';
import 'package:connect/module/catalog/presentation/product_detail_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A compact product card rendered inside a chat bubble. Fetches the product by id.
class ProductChatCard extends ConsumerWidget {
  final String productId;
  final bool mine;

  const ProductChatCard({super.key, required this.productId, required this.mine});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(publicProductProvider(productId));
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => revealOrPush(
        context,
        productRouteName(productId),
        (_) => ProductDetailScreen(productId: productId),
      ),
      child: Container(
        width: 0.62.sw,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: async.when(
          loading: () => SizedBox(height: 180.h, child: const Center(child: CircularProgressIndicator())),
          error: (_, __) => Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(l10n.couldNotLoadProduct,
                style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
          ),
          data: (p) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _image(p),
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.style14px.w700.copyWith(color: AppColors.textPrimary)),
                    SizedBox(height: 4.h),
                    Text(
                      p.price != null ? formatPrice(p.price, p.currency) : l10n.dmForPrice,
                      style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.storefront, size: 13.sp, color: AppColors.textSecondary),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(p.storeName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.style11px.w500.copyWith(color: AppColors.textSecondary)),
                        ),
                        Text(l10n.viewStore,
                            style: AppTextStyles.style11px.w700.copyWith(color: AppColors.primary)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(PublicProduct p) {
    if (p.imageUrls.isEmpty) {
      return Container(
        height: 130.h,
        color: AppColors.surface,
        alignment: Alignment.center,
        child: Icon(Icons.image_outlined, size: 36.sp, color: AppColors.border),
      );
    }
    return CachedNetworkImage(
      imageUrl: EndPoints.mediaUrl(p.imageUrls.first),
      width: double.infinity,
      height: 130.h,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(height: 130.h, color: AppColors.surface),
      errorWidget: (_, __, ___) => Container(
        height: 130.h,
        color: AppColors.surface,
        alignment: Alignment.center,
        child: Icon(Icons.broken_image_outlined, size: 30.sp, color: AppColors.border),
      ),
    );
  }
}

/// A product tile used in the store grid (buyer browse).
class ProductGridTile extends StatelessWidget {
  final PublicProduct product;
  final VoidCallback onTap;

  const ProductGridTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final outOfStock = product.availability == 'OUT_OF_STOCK';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: product.imageUrls.isEmpty
                      ? Container(
                          color: AppColors.surface,
                          alignment: Alignment.center,
                          child: Icon(Icons.image_outlined, size: 34.sp, color: AppColors.border))
                      : CachedNetworkImage(
                          imageUrl: EndPoints.mediaUrl(product.imageUrls.first),
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(color: AppColors.surface),
                          errorWidget: (_, __, ___) => Container(
                              color: AppColors.surface,
                              alignment: Alignment.center,
                              child: Icon(Icons.broken_image_outlined, size: 28.sp, color: AppColors.border)),
                        ),
                ),
                if (outOfStock)
                  Positioned(
                    left: 6.w,
                    top: 6.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6.r)),
                      child: Text(l10n.outOfStock,
                          style: AppTextStyles.style10px.w600.copyWith(color: Colors.white)),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style13px.w600.copyWith(color: AppColors.textPrimary)),
                  SizedBox(height: 2.h),
                  Text(
                    product.price != null ? formatPrice(product.price, product.currency) : l10n.dmForPrice,
                    style: AppTextStyles.style13px.w700.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
