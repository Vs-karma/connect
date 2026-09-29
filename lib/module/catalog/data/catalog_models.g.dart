// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogStore _$CatalogStoreFromJson(Map<String, dynamic> json) =>
    _CatalogStore(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      tagline: json['tagline'] as String?,
      logoUrl: json['logoUrl'] as String?,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'ACTIVE',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CatalogStoreToJson(_CatalogStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'tagline': instance.tagline,
      'logoUrl': instance.logoUrl,
      'productCount': instance.productCount,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  currency: json['currency'] as String? ?? 'INR',
  availability: json['availability'] as String? ?? 'IN_STOCK',
  sku: json['sku'] as String?,
  status: json['status'] as String? ?? 'ACTIVE',
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  collectionIds:
      (json['collectionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'currency': instance.currency,
  'availability': instance.availability,
  'sku': instance.sku,
  'status': instance.status,
  'imageUrls': instance.imageUrls,
  'collectionIds': instance.collectionIds,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_Collection _$CollectionFromJson(Map<String, dynamic> json) => _Collection(
  id: json['id'] as String,
  name: json['name'] as String,
  coverUrl: json['coverUrl'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CollectionToJson(_Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'sortOrder': instance.sortOrder,
      'productCount': instance.productCount,
    };

_PublicCollection _$PublicCollectionFromJson(Map<String, dynamic> json) =>
    _PublicCollection(
      id: json['id'] as String,
      name: json['name'] as String,
      coverUrl: json['coverUrl'] as String?,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PublicCollectionToJson(_PublicCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'productCount': instance.productCount,
    };

_ProductPage _$ProductPageFromJson(Map<String, dynamic> json) => _ProductPage(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Product>[],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductPageToJson(_ProductPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_PublicStore _$PublicStoreFromJson(Map<String, dynamic> json) => _PublicStore(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  tagline: json['tagline'] as String?,
  logoUrl: json['logoUrl'] as String?,
  coverImageUrl: json['coverImageUrl'] as String?,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
  ownerUserId: json['ownerUserId'] as String,
  ownerName: json['ownerName'] as String?,
);

Map<String, dynamic> _$PublicStoreToJson(_PublicStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'tagline': instance.tagline,
      'logoUrl': instance.logoUrl,
      'coverImageUrl': instance.coverImageUrl,
      'productCount': instance.productCount,
      'ownerUserId': instance.ownerUserId,
      'ownerName': instance.ownerName,
    };

_PublicStorePage _$PublicStorePageFromJson(Map<String, dynamic> json) =>
    _PublicStorePage(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => PublicStore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PublicStore>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PublicStorePageToJson(_PublicStorePage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_PublicProduct _$PublicProductFromJson(Map<String, dynamic> json) =>
    _PublicProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'INR',
      availability: json['availability'] as String? ?? 'IN_STOCK',
      imageUrls:
          (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      catalogId: json['catalogId'] as String,
      storeName: json['storeName'] as String?,
      ownerUserId: json['ownerUserId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PublicProductToJson(_PublicProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'availability': instance.availability,
      'imageUrls': instance.imageUrls,
      'catalogId': instance.catalogId,
      'storeName': instance.storeName,
      'ownerUserId': instance.ownerUserId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_PublicProductPage _$PublicProductPageFromJson(Map<String, dynamic> json) =>
    _PublicProductPage(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => PublicProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PublicProduct>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PublicProductPageToJson(_PublicProductPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
