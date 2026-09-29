import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_models.freezed.dart';
part 'catalog_models.g.dart';

/// The caller's own store (mirrors backend CatalogResponse).
@freezed
abstract class CatalogStore with _$CatalogStore {
  const factory CatalogStore({
    required String id,
    required String name,
    required String category,
    String? tagline,
    String? logoUrl,
    @Default(0) int productCount,
    @Default('ACTIVE') String status,
    DateTime? createdAt,
  }) = _CatalogStore;

  factory CatalogStore.fromJson(Map<String, dynamic> json) => _$CatalogStoreFromJson(json);
}

/// A product in the caller's store (owner view — includes status/sku).
@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    String? description,
    double? price,
    @Default('INR') String currency,
    @Default('IN_STOCK') String availability,
    String? sku,
    @Default('ACTIVE') String status,
    @Default(<String>[]) List<String> imageUrls,
    @Default(<String>[]) List<String> collectionIds,
    DateTime? createdAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

/// A seller's collection (owner view).
@freezed
abstract class Collection with _$Collection {
  const factory Collection({
    required String id,
    required String name,
    String? coverUrl,
    @Default(0) int sortOrder,
    @Default(0) int productCount,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

/// A store's collection (buyer-facing, for filter chips).
@freezed
abstract class PublicCollection with _$PublicCollection {
  const factory PublicCollection({
    required String id,
    required String name,
    String? coverUrl,
    @Default(0) int productCount,
  }) = _PublicCollection;

  factory PublicCollection.fromJson(Map<String, dynamic> json) => _$PublicCollectionFromJson(json);
}

@freezed
abstract class ProductPage with _$ProductPage {
  const factory ProductPage({
    @Default(<Product>[]) List<Product> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _ProductPage;

  factory ProductPage.fromJson(Map<String, dynamic> json) => _$ProductPageFromJson(json);
}

/// Buyer-facing store header (mirrors backend PublicCatalogResponse).
@freezed
abstract class PublicStore with _$PublicStore {
  const factory PublicStore({
    required String id,
    required String name,
    required String category,
    String? tagline,
    String? logoUrl,
    String? coverImageUrl,
    @Default(0) int productCount,
    required String ownerUserId,
    String? ownerName,
  }) = _PublicStore;

  factory PublicStore.fromJson(Map<String, dynamic> json) => _$PublicStoreFromJson(json);
}

/// Paged list of stores (marketplace browse).
@freezed
abstract class PublicStorePage with _$PublicStorePage {
  const factory PublicStorePage({
    @Default(<PublicStore>[]) List<PublicStore> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _PublicStorePage;

  factory PublicStorePage.fromJson(Map<String, dynamic> json) => _$PublicStorePageFromJson(json);
}

/// Buyer-facing product (mirrors backend PublicProductResponse).
@freezed
abstract class PublicProduct with _$PublicProduct {
  const factory PublicProduct({
    required String id,
    required String name,
    String? description,
    double? price,
    @Default('INR') String currency,
    @Default('IN_STOCK') String availability,
    @Default(<String>[]) List<String> imageUrls,
    required String catalogId,
    String? storeName,
    required String ownerUserId,
    DateTime? createdAt,
  }) = _PublicProduct;

  factory PublicProduct.fromJson(Map<String, dynamic> json) => _$PublicProductFromJson(json);
}

@freezed
abstract class PublicProductPage with _$PublicProductPage {
  const factory PublicProductPage({
    @Default(<PublicProduct>[]) List<PublicProduct> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _PublicProductPage;

  factory PublicProductPage.fromJson(Map<String, dynamic> json) => _$PublicProductPageFromJson(json);
}
