import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The app's bottom navigation: Home, Broadcast, Settings.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int homeBadge;

  const AppBottomNav({super.key, required this.currentIndex, required this.onTap, this.homeBadge = 0});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _item(0, PhosphorIconsFill.house, PhosphorIconsRegular.house, l10n.home, badge: homeBadge),
            _item(1, PhosphorIconsFill.storefront, PhosphorIconsRegular.storefront, l10n.storesTab),
            _item(2, PhosphorIconsFill.broadcast, PhosphorIconsRegular.broadcast, l10n.broadcast),
            _item(3, PhosphorIconsFill.gearSix, PhosphorIconsRegular.gearSix, l10n.settings),
          ],
        ),
      ),
    );
  }

  Widget _item(int index, IconData active, IconData inactive, String label, {int badge = 0}) {
    final selected = currentIndex == index;
    final color = selected ? AppColors.textPrimary : AppColors.textSecondary;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(selected ? active : inactive, color: color, size: 24.sp),
                if (badge > 0)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      constraints: BoxConstraints(minWidth: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        badge > 99 ? '99+' : '$badge',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.style11px.w700.copyWith(color: AppColors.onPrimary),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: (selected ? AppTextStyles.style12px.w700 : AppTextStyles.style12px.w500)
                  .copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
