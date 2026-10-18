import 'package:connect/module/broadcast/application/broadcast_providers.dart';
import 'package:connect/module/broadcastlist/application/broadcast_list_providers.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/chat/application/chat_providers.dart';
import 'package:connect/module/contact/application/contacts_controller.dart';
import 'package:connect/module/profile/application/profile_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Wipes every user-scoped provider's cache so no data from the previous
/// session leaks into the next login. Repository/`Provider` singletons are
/// stateless and are intentionally left alone. Invalidating a `.family`
/// provider (with no argument) clears all of its cached instances.
void clearUserScopedState(WidgetRef ref) {
  // Chat
  ref.invalidate(chatListProvider);
  ref.invalidate(unreadCountProvider);
  ref.invalidate(threadControllerProvider);

  // Contacts
  ref.invalidate(contactsControllerProvider);

  // Profile
  ref.invalidate(profileProvider);

  // Catalog / store / collections
  ref.invalidate(myStoreProvider);
  ref.invalidate(myProductsProvider);
  ref.invalidate(myCollectionsProvider);
  ref.invalidate(publicStoreProvider);
  ref.invalidate(publicProductsProvider);
  ref.invalidate(publicProductProvider);
  ref.invalidate(storeByUserProvider);
  ref.invalidate(storeBrowseProvider);
  ref.invalidate(publicCollectionsProvider);
  ref.invalidate(storeProductsProvider);

  // Broadcasts
  ref.invalidate(sentBroadcastsProvider);
  ref.invalidate(broadcastDetailProvider);
  ref.invalidate(broadcastListsProvider);
  ref.invalidate(broadcastListMessagesProvider);
  ref.invalidate(broadcastListDetailProvider);
}
