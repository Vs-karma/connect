import 'package:connect/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

/// A single shimmering block. Colours adapt to light/dark theme.
class SkeletonBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final BoxShape shape;

  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.radius = 8,
    this.margin,
    this.shape = BoxShape.rectangle,
  });

  const SkeletonBox.circle({super.key, required double size, this.margin})
      : width = size,
        height = size,
        radius = 0,
        shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.isDark ? const Color(0xFF2A2C30) : Colors.white,
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(radius.r),
      ),
    );
  }
}

/// Wraps skeleton placeholders in the shimmer sweep.
class Skeleton extends StatelessWidget {
  final Widget child;

  const Skeleton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final base = AppColors.isDark ? const Color(0xFF2A2C30) : const Color(0xFFE9EBEE);
    final highlight = AppColors.isDark ? const Color(0xFF3A3D42) : const Color(0xFFF6F7F9);
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: child,
    );
  }
}

/// Chat/conversation list placeholder (Home).
class ChatListSkeleton extends StatelessWidget {
  final int count;

  const ChatListSkeleton({super.key, this.count = 9});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        itemBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              SkeletonBox.circle(size: 52.w),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: 140.w, height: 14.h, radius: 6),
                    SizedBox(height: 8.h),
                    SkeletonBox(width: 220.w, height: 12.h, radius: 6),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              SkeletonBox(width: 34.w, height: 10.h, radius: 6),
            ],
          ),
        ),
      ),
    );
  }
}

/// Marketplace store-card placeholder (Store tab): image banner + details row.
class StoreCardListSkeleton extends StatelessWidget {
  final int count;

  const StoreCardListSkeleton({super.key, this.count = 4});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 20.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonBox(width: double.infinity, height: 150.h, radius: 18),
            SizedBox(height: 12.h),
            Row(
              children: [
                SkeletonBox(width: 44.w, height: 44.w, radius: 12),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: 130.w, height: 14.h, radius: 6),
                    SizedBox(height: 8.h),
                    SkeletonBox(width: 90.w, height: 11.h, radius: 6),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

/// Product list placeholder (My Store): thumbnail + two lines rows.
class ProductListSkeleton extends StatelessWidget {
  final int count;

  const ProductListSkeleton({super.key, this.count = 6});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 90.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (_, __) => Row(
          children: [
            SkeletonBox(width: 56.w, height: 56.w, radius: 10),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(width: 160.w, height: 13.h, radius: 6),
                  SizedBox(height: 8.h),
                  SkeletonBox(width: 70.w, height: 12.h, radius: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Product grid placeholder (Store view): 2-column cards.
class ProductGridSkeleton extends StatelessWidget {
  final int count;

  const ProductGridSkeleton({super.key, this.count = 6});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.72,
        ),
        itemCount: count,
        itemBuilder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SkeletonBox(width: double.infinity, radius: 14)),
            SizedBox(height: 8.h),
            SkeletonBox(width: 100.w, height: 12.h, radius: 6),
            SizedBox(height: 6.h),
            SkeletonBox(width: 60.w, height: 11.h, radius: 6),
          ],
        ),
      ),
    );
  }
}

/// Store header placeholder (Store view): logo + title lines.
class StoreHeaderSkeleton extends StatelessWidget {
  const StoreHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
        child: Row(
          children: [
            SkeletonBox(width: 64.w, height: 64.w, radius: 16),
            SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonBox(width: 150.w, height: 16.h, radius: 6),
                SizedBox(height: 8.h),
                SkeletonBox(width: 100.w, height: 12.h, radius: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
