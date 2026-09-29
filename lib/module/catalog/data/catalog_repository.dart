import 'package:connect/exception/api_exception.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// Catalog API: the caller's store + products, and public browse.
class CatalogRepository {
  final ApiController _api = ApiController.instance;

  // ---- My store ----

  /// My store, or null if I haven't set one up yet (backend returns 404).
  Future<CatalogStore?> myStore() async {
    try {
      final res = await _api.get(EndPoints.CATALOG_ME);
      return CatalogStore.fromJson(res.data as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<CatalogStore> createStore({
    required String name,
    required String category,
    String? tagline,
    String? logoUrl,
  }) async {
    final res = await _api.post(EndPoints.CATALOG, body: {
      'name': name,
      'category': category,
      if (tagline != null && tagline.isNotEmpty) 'tagline': tagline,
      if (logoUrl != null && logoUrl.isNotEmpty) 'logoUrl': logoUrl,
    });
    return CatalogStore.fromJson(res.data as Map<String, dynamic>);
  }

  Future<CatalogStore> updateStore({
    String? name,
    String? category,
    String? tagline,
    String? logoUrl,
  }) async {
    final res = await _api.patch(EndPoints.CATALOG_ME, body: {
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (tagline != null) 'tagline': tagline,
      if (logoUrl != null) 'logoUrl': logoUrl,
    });
    return CatalogStore.fromJson(res.data as Map<String, dynamic>);
  }

  // ---- My products ----

  Future<ProductPage> myProducts({int page = 0, int size = 50}) async {
    final res = await _api.get(EndPoints.CATALOG_PRODUCTS, queryParameters: {'page': page, 'size': size});
    return ProductPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Product> productDetail(String id) async {
    final res = await _api.get(EndPoints.catalogProduct(id));
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Product> addProduct({
    required String name,
    String? description,
    double? price,
    String? currency,
    String availability = 'IN_STOCK',
    String? sku,
    List<String> imageUrls = const [],
    List<String> collectionIds = const [],
  }) async {
    final res = await _api.post(EndPoints.CATALOG_PRODUCTS, body: {
      'name': name,
      if (description != null && description.isNotEmpty) 'description': description,
      if (price != null) 'price': price,
      if (currency != null) 'currency': currency,
      'availability': availability,
      if (sku != null && sku.isNotEmpty) 'sku': sku,
      'imageUrls': imageUrls,
      'collectionIds': collectionIds,
    });
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  /// Edit a product. Only pass the fields you want to change; imageUrls/collectionIds (if non-null) replace all.
  Future<Product> updateProduct(
    String id, {
    String? name,
    String? description,
    double? price,
    String? availability,
    String? sku,
    String? status,
    List<String>? imageUrls,
    List<String>? collectionIds,
  }) async {
    final res = await _api.patch(EndPoints.catalogProduct(id), body: {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (availability != null) 'availability': availability,
      if (sku != null) 'sku': sku,
      if (status != null) 'status': status,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (collectionIds != null) 'collectionIds': collectionIds,
    });
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  // ---- Collections (seller) ----

  Future<List<Collection>> myCollections() async {
    final res = await _api.get(EndPoints.CATALOG_COLLECTIONS);
    return (res.data as List<dynamic>).map((e) => Collection.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Collection> createCollection(String name, {String? coverUrl}) async {
    final res = await _api.post(EndPoints.CATALOG_COLLECTIONS, body: {
      'name': name,
      if (coverUrl != null && coverUrl.isNotEmpty) 'coverUrl': coverUrl,
    });
    return Collection.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Collection> updateCollection(String id, {String? name, String? coverUrl, int? sortOrder}) async {
    final res = await _api.patch(EndPoints.catalogCollection(id), body: {
      if (name != null) 'name': name,
      if (coverUrl != null) 'coverUrl': coverUrl,
      if (sortOrder != null) 'sortOrder': sortOrder,
    });
    return Collection.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> deleteCollection(String id) async {
    await _api.delete(EndPoints.catalogCollection(id));
  }

  Future<List<PublicCollection>> publicCollections(String catalogId) async {
    final res = await _api.get(EndPoints.publicCatalogCollections(catalogId));
    return (res.data as List<dynamic>)
        .map((e) => PublicCollection.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> deleteProduct(String id) async {
    await _api.delete(EndPoints.catalogProduct(id));
  }

  // ---- Public browse ----

  /// Browse/search all stores (marketplace).
  Future<PublicStorePage> browseStores({String? q, int page = 0, int size = 20}) async {
    final res = await _api.get(EndPoints.STORES, queryParameters: {
      'page': page,
      'size': size,
      if (q != null && q.isNotEmpty) 'q': q,
    });
    return PublicStorePage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<PublicStore> publicStore(String catalogId) async {
    final res = await _api.get(EndPoints.publicCatalog(catalogId));
    return PublicStore.fromJson(res.data as Map<String, dynamic>);
  }

  /// A user's store, or null if they don't have one (backend returns 404).
  Future<PublicStore?> storeByUser(String userId) async {
    try {
      final res = await _api.get(EndPoints.userCatalog(userId));
      return PublicStore.fromJson(res.data as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<PublicProductPage> publicProducts(String catalogId,
      {String? collection, int page = 0, int size = 50}) async {
    final res = await _api.get(EndPoints.publicCatalogProducts(catalogId), queryParameters: {
      'page': page,
      'size': size,
      if (collection != null && collection.isNotEmpty) 'collection': collection,
    });
    return PublicProductPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<PublicProduct> publicProduct(String productId) async {
    final res = await _api.get(EndPoints.publicProduct(productId));
    return PublicProduct.fromJson(res.data as Map<String, dynamic>);
  }
}
