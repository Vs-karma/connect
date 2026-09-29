import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/collection_edit_screen.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Create, rename, reorder and delete the seller's collections.
class ManageCollectionsScreen extends ConsumerWidget {
  const ManageCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(myCollectionsProvider);

    return Scaffold(
      appBar: CommonAppBar(title: l10n.collections, showBack: true),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CollectionEditScreen()),
        ),
        icon: const Icon(Icons.add, color: AppColors.onPrimary),
        label: Text(l10n.newCollection,
            style: AppTextStyles.style14px.w700.copyWith(color: AppColors.onPrimary)),
      ),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(l10n.couldNotLoadCollections,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (list) {
            if (list.isEmpty) return _empty(l10n);
            return ReorderableListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 90.h),
              itemCount: list.length,
              onReorder: (oldIndex, newIndex) => _reorder(ref, list, oldIndex, newIndex),
              itemBuilder: (_, i) => _tile(context, ref, list[i], l10n),
            );
          },
        ),
      ),
    );
  }

  Widget _empty(l10n) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.collections_bookmark_outlined, size: 84.sp, color: AppColors.border),
            SizedBox(height: 14.h),
            Text(l10n.noCollectionsYet,
                style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
            SizedBox(height: 6.h),
            Text(l10n.addFirstCollection,
                textAlign: TextAlign.center,
                style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );

  Widget _tile(BuildContext context, WidgetRef ref, Collection c, l10n) {
    return Container(
      key: ValueKey(c.id),
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
      child: Row(
        children: [
          Icon(Icons.drag_indicator, color: AppColors.textHint, size: 20.sp),
          SizedBox(width: 8.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: (c.coverUrl != null && c.coverUrl!.isNotEmpty)
                ? CachedNetworkImage(
                    imageUrl: EndPoints.mediaUrl(c.coverUrl!),
                    width: 48.w,
                    height: 48.w,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => _coverFallback(),
                  )
                : _coverFallback(),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style14px.w700.copyWith(color: AppColors.textPrimary)),
                SizedBox(height: 2.h),
                Text(context.l10n.productsCount(c.productCount),
                    style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.textSecondary, size: 20.sp),
            color: AppColors.card,
            onSelected: (v) {
              if (v == 'rename') {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => CollectionEditScreen(existing: c)));
              }
              if (v == 'delete') _confirmDelete(context, ref, c, l10n);
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'rename', child: Text(l10n.renameCollection, style: AppTextStyles.style14px.w600)),
              PopupMenuItem(
                value: 'delete',
                child: Text(l10n.delete, style: AppTextStyles.style14px.w600.copyWith(color: AppColors.danger)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _reorder(WidgetRef ref, List<Collection> list, int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) newIndex -= 1;
    final reordered = [...list];
    final moved = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, moved);
    final repo = ref.read(catalogRepositoryProvider);
    try {
      for (int i = 0; i < reordered.length; i++) {
        if (reordered[i].sortOrder != i) {
          await repo.updateCollection(reordered[i].id, sortOrder: i);
        }
      }
    } finally {
      ref.read(myCollectionsProvider.notifier).reload();
    }
  }

  Widget _coverFallback() => Container(
        width: 48.w,
        height: 48.w,
        color: AppColors.card,
        alignment: Alignment.center,
        child: Icon(Icons.collections_bookmark_outlined, color: AppColors.border, size: 22.sp),
      );

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Collection c, l10n) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.delete, style: AppTextStyles.style16px.w700),
        content: Text(l10n.deleteCollectionConfirm(c.name),
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
      await ref.read(catalogRepositoryProvider).deleteCollection(c.id);
      ref.read(myCollectionsProvider.notifier).reload();
    } catch (_) {
      if (context.mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotDeleteCollection);
    }
  }
}
