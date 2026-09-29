import 'dart:io';

import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/media/media_repository.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/// One image slot: either an already-uploaded URL or a not-yet-uploaded local file.
class _Img {
  final String? url;
  final XFile? file;
  const _Img.url(this.url) : file = null;
  const _Img.file(this.file) : url = null;
}

/// Add or edit a product in the caller's store.
class ProductEditScreen extends ConsumerStatefulWidget {
  final Product? existing;

  const ProductEditScreen({super.key, this.existing});

  @override
  ConsumerState<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends ConsumerState<ProductEditScreen> {
  static const int _maxImages = 6;
  final _media = MediaRepository();
  late final TextEditingController _name;
  late final TextEditingController _price;
  late final TextEditingController _description;
  bool _inStock = true;
  final List<_Img> _images = [];
  final Set<String> _selectedCollections = {};
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final p = widget.existing;
    _name = TextEditingController(text: p?.name ?? '');
    _price = TextEditingController(text: p?.price == null ? '' : _trimZeros(p!.price!));
    _description = TextEditingController(text: p?.description ?? '');
    _inStock = (p?.availability ?? 'IN_STOCK') == 'IN_STOCK';
    if (p != null) {
      _images.addAll(p.imageUrls.map((u) => _Img.url(u)));
      _selectedCollections.addAll(p.collectionIds);
    }
  }

  static String _trimZeros(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _addImage() async {
    if (_images.length >= _maxImages) return;
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _images.add(_Img.file(file)));
  }

  bool get _valid => _name.text.trim().isNotEmpty;

  Future<void> _save() async {
    if (!_valid || _saving) return;
    setState(() => _saving = true);
    try {
      // Upload any new local images, preserving order.
      final urls = <String>[];
      for (final img in _images) {
        if (img.url != null) {
          urls.add(img.url!);
        } else if (img.file != null) {
          urls.add(await _media.uploadImage(img.file!.path));
        }
      }
      final price = double.tryParse(_price.text.trim());
      final availability = _inStock ? 'IN_STOCK' : 'OUT_OF_STOCK';
      final repo = ref.read(catalogRepositoryProvider);
      if (_isEdit) {
        await repo.updateProduct(
          widget.existing!.id,
          name: _name.text.trim(),
          description: _description.text.trim(),
          price: price,
          availability: availability,
          imageUrls: urls,
          collectionIds: _selectedCollections.toList(),
        );
      } else {
        await repo.addProduct(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          price: price,
          availability: availability,
          imageUrls: urls,
          collectionIds: _selectedCollections.toList(),
        );
      }
      ref.read(myProductsProvider.notifier).reload();
      ref.invalidate(myStoreProvider);
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotSaveProduct);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CommonAppBar(title: _isEdit ? l10n.editProduct : l10n.addProduct),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
                children: [
                  _label(l10n.photos),
                  _photoStrip(),
                  SizedBox(height: 18.h),
                  _label(l10n.productName),
                  AppTextField(
                    controller: _name,
                    hintText: l10n.productNameHint,
                    maxLength: 140,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 18.h),
                  _label('${l10n.price} · ${l10n.optional}'),
                  AppTextField(
                    controller: _price,
                    hintText: '₹',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                  ),
                  SizedBox(height: 18.h),
                  _label(l10n.description),
                  AppTextField(
                    controller: _description,
                    hintText: l10n.descriptionHint,
                    maxLength: 4000,
                    maxLines: 4,
                  ),
                  SizedBox(height: 18.h),
                  _availabilityToggle(l10n),
                  SizedBox(height: 18.h),
                  _label(l10n.collectionsField),
                  _collectionsPicker(l10n),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
              child: AppButton(
                label: _isEdit ? l10n.saveChanges : l10n.addProduct,
                isLoading: _saving,
                enabled: _valid,
                onPressed: _save,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(text, style: AppTextStyles.style13px.w600.copyWith(color: AppColors.textSecondary)),
      );

  Widget _photoStrip() {
    return SizedBox(
      height: 84.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < _images.length; i++) _thumb(i),
          if (_images.length < _maxImages) _addTile(),
        ],
      ),
    );
  }

  Widget _thumb(int i) {
    final img = _images[i];
    final Widget child = img.file != null
        ? Image.file(File(img.file!.path), width: 84.w, height: 84.w, fit: BoxFit.cover)
        : Image.network(img.url!, width: 84.w, height: 84.w, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const ColoredBox(color: Colors.black12));
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Stack(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(12.r), child: child),
          Positioned(
            right: 2,
            top: 2,
            child: GestureDetector(
              onTap: () => setState(() => _images.removeAt(i)),
              child: Container(
                decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                padding: const EdgeInsets.all(2),
                child: const Icon(Icons.close, size: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addTile() {
    return GestureDetector(
      onTap: _addImage,
      child: Container(
        width: 84.w,
        height: 84.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(Icons.add_a_photo_outlined, color: AppColors.textSecondary, size: 24.sp),
      ),
    );
  }

  Widget _collectionsPicker(l10n) {
    final async = ref.watch(myCollectionsProvider);
    return async.when(
      loading: () => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SizedBox(width: 18.w, height: 18.w, child: const CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (_, __) => Text(l10n.couldNotLoadCollections,
          style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
      data: (cols) => Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: [
          ...cols.map((c) {
            final selected = _selectedCollections.contains(c.id);
            return GestureDetector(
              onTap: () => setState(() {
                selected ? _selectedCollections.remove(c.id) : _selectedCollections.add(c.id);
              }),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: selected ? AppColors.primary : AppColors.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (selected) ...[
                      Icon(Icons.check, size: 14.sp, color: AppColors.onPrimary),
                      SizedBox(width: 4.w),
                    ],
                    Text(c.name,
                        style: AppTextStyles.style13px.w600
                            .copyWith(color: selected ? AppColors.onPrimary : AppColors.textPrimary)),
                  ],
                ),
              ),
            );
          }),
          GestureDetector(
            onTap: _newCollection,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 15.sp, color: AppColors.primary),
                  SizedBox(width: 4.w),
                  Text(l10n.newCollection,
                      style: AppTextStyles.style13px.w700.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _newCollection() async {
    final l10n = context.l10n;
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.newCollection, style: AppTextStyles.style16px.w700),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 80,
          decoration: InputDecoration(hintText: l10n.collectionNameHint),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(l10n.createCollection,
                style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
    if (name == null || name.isEmpty) return;
    try {
      final created = await ref.read(catalogRepositoryProvider).createCollection(name);
      await ref.read(myCollectionsProvider.notifier).reload();
      if (mounted) setState(() => _selectedCollections.add(created.id));
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, l10n.couldNotSaveCollection);
    }
  }

  Widget _availabilityToggle(l10n) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(l10n.available,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textPrimary)),
          ),
          Switch(
            value: _inStock,
            activeColor: AppColors.primary,
            onChanged: (v) => setState(() => _inStock = v),
          ),
        ],
      ),
    );
  }
}
