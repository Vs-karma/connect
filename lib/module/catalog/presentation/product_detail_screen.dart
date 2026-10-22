import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/app/app_nav.dart';
import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/price_format.dart';
import 'package:connect/module/catalog/presentation/product_share_picker.dart';
import 'package:connect/module/catalog/presentation/store_view_screen.dart';
import 'package:connect/module/chat/presentation/chat_thread_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Buyer-facing product detail with Enquire (chat with the seller) + Share.
class ProductDetailScreen extends ConsumerWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(publicProductProvider(productId));
    final myId = ref.watch(sessionControllerProvider).value?.id;

    return Scaffold(
      appBar: CommonAppBar(title: l10n.details),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Text(l10n.couldNotLoadProduct,
              style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
        ),
        data: (p) {
          final isMine = myId != null && myId == p.ownerUserId;
          final outOfStock = p.availability == 'OUT_OF_STOCK';
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _ProductGallery(images: p.imageUrls),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.name, style: AppTextStyles.style20px.w700.copyWith(color: AppColors.textPrimary)),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                p.price != null ? formatPrice(p.price, p.currency) : l10n.dmForPrice,
                                style: AppTextStyles.style18px.w700.copyWith(color: AppColors.primary),
                              ),
                              SizedBox(width: 12.w),
                              _availabilityChip(l10n, outOfStock),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          _storeRow(context, p),
                          if (p.description != null && p.description!.isNotEmpty) ...[
                            SizedBox(height: 16.h),
                            Text(p.description!,
                                style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textPrimary, height: 1.4)),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMine) _bottomBar(context, ref, p, l10n),
            ],
          );
        },
      ),
    );
  }

  Widget _availabilityChip(l10n, bool outOfStock) {
    final color = outOfStock ? AppColors.danger : AppColors.success;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20.r)),
      child: Text(outOfStock ? l10n.outOfStock : l10n.inStock,
          style: AppTextStyles.style12px.w600.copyWith(color: color)),
    );
  }

  Widget _storeRow(BuildContext context, PublicProduct p) {
    return GestureDetector(
      onTap: () => revealOrPush(
        context,
        storeRouteName(p.catalogId),
        (_) => StoreViewScreen(catalogId: p.catalogId),
      ),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: Icon(Icons.storefront, color: AppColors.primary, size: 18.sp),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(p.storeName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style14px.w700.copyWith(color: AppColors.textPrimary)),
            ),
            Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context, WidgetRef ref, PublicProduct p, l10n) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 10.h),
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                label: l10n.enquire,
                icon: Icons.chat_bubble_outline,
                onPressed: () => openEnquiryChat(
                  context,
                  chatRouteName(p.ownerUserId),
                  (_) => ChatThreadScreen(
                    peerUserId: p.ownerUserId,
                    peerName: p.storeName ?? l10n.enquire,
                    initialShareProductId: p.id,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            AppButton(
              label: l10n.shareToChat,
              variant: AppButtonVariant.outline,
              width: 130.w,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ProductSharePicker(productId: p.id)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Swipeable product image gallery with page dots.
class _ProductGallery extends StatefulWidget {
  final List<String> images;
  const _ProductGallery({required this.images});

  @override
  State<_ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<_ProductGallery> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: 300.h,
        color: AppColors.surface,
        alignment: Alignment.center,
        child: Icon(Icons.image_outlined, size: 56.sp, color: AppColors.border),
      );
    }
    return SizedBox(
      height: 320.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _index = i),
            itemCount: widget.images.length,
            itemBuilder: (_, i) {
              final provider = CachedNetworkImageProvider(EndPoints.mediaUrl(widget.images[i]));
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => openImageViewer(context, provider),
                child: Image(image: provider, fit: BoxFit.cover, width: double.infinity),
              );
            },
          ),
          if (widget.images.length > 1)
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.images.length, (i) {
                  final active = i == _index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: active ? 18.w : 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      color: active ? AppColors.primary : Colors.white70,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
