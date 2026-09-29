import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/media/media_repository.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/// Create or edit a collection: name + optional cover image.
class CollectionEditScreen extends ConsumerStatefulWidget {
  final Collection? existing;

  const CollectionEditScreen({super.key, this.existing});

  @override
  ConsumerState<CollectionEditScreen> createState() => _CollectionEditScreenState();
}

class _CollectionEditScreenState extends ConsumerState<CollectionEditScreen> {
  final _media = MediaRepository();
  late final TextEditingController _name;
  String? _coverUrl;
  XFile? _pendingCover;
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.existing?.name ?? '');
    _coverUrl = widget.existing?.coverUrl;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _pickCover() async {
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _pendingCover = file);
  }

  bool get _valid => _name.text.trim().isNotEmpty;

  Future<void> _save() async {
    if (!_valid || _saving) return;
    setState(() => _saving = true);
    try {
      String? coverUrl = _coverUrl;
      if (_pendingCover != null) coverUrl = await _media.uploadImage(_pendingCover!.path);
      final repo = ref.read(catalogRepositoryProvider);
      if (_isEdit) {
        await repo.updateCollection(widget.existing!.id, name: _name.text.trim(), coverUrl: coverUrl);
      } else {
        await repo.createCollection(_name.text.trim(), coverUrl: coverUrl);
      }
      await ref.read(myCollectionsProvider.notifier).reload();
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotSaveCollection);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CommonAppBar(title: _isEdit ? l10n.renameCollection : l10n.newCollection),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
                children: [
                  _coverPicker(l10n),
                  SizedBox(height: 20.h),
                  Text(l10n.collectionName,
                      style: AppTextStyles.style13px.w600.copyWith(color: AppColors.textSecondary)),
                  SizedBox(height: 8.h),
                  AppTextField(
                    controller: _name,
                    hintText: l10n.collectionNameHint,
                    maxLength: 80,
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
              child: AppButton(
                label: _isEdit ? l10n.saveChanges : l10n.createCollection,
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

  Widget _coverPicker(l10n) {
    Widget inner;
    if (_pendingCover != null) {
      inner = Image.file(File(_pendingCover!.path), fit: BoxFit.cover);
    } else if (_coverUrl != null && _coverUrl!.isNotEmpty) {
      inner = CachedNetworkImage(
        imageUrl: EndPoints.mediaUrl(_coverUrl!),
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) => _placeholder(l10n),
      );
    } else {
      inner = _placeholder(l10n);
    }
    return GestureDetector(
      onTap: _pickCover,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(height: 150.h, width: double.infinity, child: inner),
      ),
    );
  }

  Widget _placeholder(l10n) => Container(
        color: AppColors.surface,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_photo_alternate_outlined, size: 34.sp, color: AppColors.textSecondary),
            SizedBox(height: 6.h),
            Text('${l10n.photos} · ${l10n.optional}',
                style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );
}
