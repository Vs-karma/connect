import 'package:connect/app/app_nav.dart';
import 'package:connect/module/chat/presentation/chat_thread_screen.dart';
import 'package:connect/module/contact/application/contacts_controller.dart';
import 'package:connect/module/contact/data/contact_api_repository.dart';
import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/module/contact/data/device_contacts_repository.dart';
import 'package:connect/module/contact/presentation/add_contact_screen.dart';
import 'package:connect/module/contact/presentation/widgets/contact_tile.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/utility/phone_util.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

/// Contacts picker. Two modes:
///  - chat (default): tap a contact → open chat if they're on Mitra, else share an invite.
///  - broadcast (forBroadcast): multi-select → returns the chosen contacts to the caller (which
///    then names + creates the broadcast list).
class ContactsScreen extends ConsumerStatefulWidget {
  final bool asFlow;
  final bool forBroadcast;

  const ContactsScreen({super.key, this.asFlow = false, this.forBroadcast = false});

  @override
  ConsumerState<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends ConsumerState<ContactsScreen> {
  final Set<String> _selected = {};
  final _contactApi = ContactApiRepository();
  String _query = '';
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final contactsAsync = ref.watch(contactsControllerProvider);

    return Scaffold(
      appBar: CommonAppBar(title: l10n.selectContacts, showBack: widget.asFlow),
      floatingActionButton: (widget.forBroadcast && _selected.isNotEmpty)
          ? FloatingActionButton(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              onPressed: () => Navigator.of(context).pop(_selectedContacts()),
              child: const Icon(Icons.arrow_forward, color: AppColors.onPrimary),
            )
          : null,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
                  child: AppSearchField(
                    hintText: l10n.searchByNameNumber,
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: _newContactButton(l10n),
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: contactsAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator(color: AppColors.primary)),
                    error: (e, _) => _permissionState(l10n, e),
                    data: (contacts) => _list(_filter(contacts)),
                  ),
                ),
              ],
            ),
            if (_busy && !widget.forBroadcast)
              const Positioned.fill(
                child: ColoredBox(color: Colors.black26, child: Center(child: CircularProgressIndicator())),
              ),
          ],
        ),
      ),
    );
  }

  List<ContactUi> _filter(List<ContactUi> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all.where((c) => c.name.toLowerCase().contains(q) || c.phone.contains(_query)).toList();
  }

  Widget _list(List<ContactUi> contacts) {
    if (contacts.isEmpty) {
      return Center(
        child: Text('No contacts found',
            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: contacts.length,
      itemBuilder: (_, i) {
        final c = contacts[i];
        return SelectableContactTile(
          contact: c,
          selected: widget.forBroadcast && _selected.contains(c.id),
          onTap: () {
            if (widget.forBroadcast) {
              setState(() => _selected.contains(c.id) ? _selected.remove(c.id) : _selected.add(c.id));
            } else {
              _openChat(c);
            }
          },
        );
      },
    );
  }

  /// Chat mode: resolve whether the contact is on Mitra; open the thread or offer an invite.
  Future<void> _openChat(ContactUi c) async {
    final phone = PhoneUtil.toE164(c.phone);
    setState(() => _busy = true);
    try {
      final results = await _contactApi.lookup([phone]);
      final status = results.isNotEmpty ? results.first : null;
      if (!mounted) return;
      if (status != null && status.hasApp && status.userId != null) {
        pushOrRevealChat(
          context,
          chatRouteName(status.userId!),
          (_) => ChatThreadScreen(peerUserId: status.userId, peerName: c.name),
        );
      } else {
        await _invite();
      }
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not check contact. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _invite() async {
    try {
      await SharePlus.instance.share(
        ShareParams(text: 'Chat with me on Mitra — install it here: https://mitra.app'),
      );
    } catch (_) {}
  }

  List<ContactUi> _selectedContacts() {
    final all = ref.read(contactsControllerProvider).value ?? const [];
    return all.where((c) => _selected.contains(c.id)).toList();
  }

  Widget _permissionState(l10n, Object error) {
    final denied = error is ContactsPermissionException;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.contacts_outlined, size: 64.sp, color: AppColors.border),
            SizedBox(height: 16.h),
            Text(
              denied ? l10n.contactPermissionDesc : l10n.somethingWentWrong,
              textAlign: TextAlign.center,
              style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 220.w,
              child: AppButton(
                label: l10n.contactPermission,
                onPressed: () async {
                  await openAppSettings();
                  await ref.read(contactsControllerProvider.notifier).reload();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _newContactButton(l10n) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AddContactScreen()),
      ),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Icon(Icons.person_add_alt_1, color: AppColors.onPrimary, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(l10n.newContact,
                  style: AppTextStyles.style16px.w700.copyWith(color: AppColors.onPrimary)),
            ),
            Icon(Icons.arrow_forward, color: AppColors.onPrimary, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
