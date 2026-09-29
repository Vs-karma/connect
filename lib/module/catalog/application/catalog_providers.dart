import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/data/catalog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) => CatalogRepository());

/// The caller's store, or null if not set up yet (drives seller onboarding).
final myStoreProvider = FutureProvider<CatalogStore?>((ref) {
  return ref.read(catalogRepositoryProvider).myStore();
});

/// The caller's products (owner view, includes hidden).
final myProductsProvider =
    AsyncNotifierProvider<MyProductsController, List<Product>>(MyProductsController.new);

class MyProductsController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final page = await ref.read(catalogRepositoryProvider).myProducts(page: 0, size: 100);
    return page.content;
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async =>
        (await ref.read(catalogRepositoryProvider).myProducts(page: 0, size: 100)).content);
  }
}

/// A store's public header (by catalogId).
final publicStoreProvider =
    FutureProvider.family<PublicStore, String>((ref, catalogId) {
  return ref.read(catalogRepositoryProvider).publicStore(catalogId);
});

/// A store's visible products (by catalogId).
final publicProductsProvider =
    FutureProvider.family<PublicProductPage, String>((ref, catalogId) {
  return ref.read(catalogRepositoryProvider).publicProducts(catalogId);
});

/// A single public product (by productId) — used by the product card in chat and the detail screen.
final publicProductProvider =
    FutureProvider.family<PublicProduct, String>((ref, productId) {
  return ref.read(catalogRepositoryProvider).publicProduct(productId);
});

/// A user's store, or null if they don't sell — drives "View store" in a 1:1 chat.
final storeByUserProvider =
    FutureProvider.family<PublicStore?, String>((ref, userId) {
  return ref.read(catalogRepositoryProvider).storeByUser(userId);
});

/// The caller's collections (owner view).
final myCollectionsProvider =
    AsyncNotifierProvider<MyCollectionsController, List<Collection>>(MyCollectionsController.new);

class MyCollectionsController extends AsyncNotifier<List<Collection>> {
  @override
  Future<List<Collection>> build() => ref.read(catalogRepositoryProvider).myCollections();

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(catalogRepositoryProvider).myCollections());
  }
}

/// Marketplace browse/search of all stores (keyed by the search query; '' = all).
final storeBrowseProvider = FutureProvider.family<PublicStorePage, String>((ref, query) {
  return ref.read(catalogRepositoryProvider).browseStores(q: query.isEmpty ? null : query);
});

/// A store's public collections (filter chips).
final publicCollectionsProvider =
    FutureProvider.family<List<PublicCollection>, String>((ref, catalogId) {
  return ref.read(catalogRepositoryProvider).publicCollections(catalogId);
});

/// A store's products, optionally filtered by collection (id, or "none" for uncategorized).
final storeProductsProvider =
    FutureProvider.family<PublicProductPage, ({String catalogId, String? collection})>((ref, q) {
  return ref.read(catalogRepositoryProvider).publicProducts(q.catalogId, collection: q.collection);
});
