// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogStore {

 String get id; String get name; String get category; String? get tagline; String? get logoUrl; int get productCount; String get status; DateTime? get createdAt;
/// Create a copy of CatalogStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogStoreCopyWith<CatalogStore> get copyWith => _$CatalogStoreCopyWithImpl<CatalogStore>(this as CatalogStore, _$identity);

  /// Serializes this CatalogStore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogStore&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,tagline,logoUrl,productCount,status,createdAt);

@override
String toString() {
  return 'CatalogStore(id: $id, name: $name, category: $category, tagline: $tagline, logoUrl: $logoUrl, productCount: $productCount, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CatalogStoreCopyWith<$Res>  {
  factory $CatalogStoreCopyWith(CatalogStore value, $Res Function(CatalogStore) _then) = _$CatalogStoreCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String? tagline, String? logoUrl, int productCount, String status, DateTime? createdAt
});




}
/// @nodoc
class _$CatalogStoreCopyWithImpl<$Res>
    implements $CatalogStoreCopyWith<$Res> {
  _$CatalogStoreCopyWithImpl(this._self, this._then);

  final CatalogStore _self;
  final $Res Function(CatalogStore) _then;

/// Create a copy of CatalogStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? tagline = freezed,Object? logoUrl = freezed,Object? productCount = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogStore].
extension CatalogStorePatterns on CatalogStore {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogStore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogStore() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogStore value)  $default,){
final _that = this;
switch (_that) {
case _CatalogStore():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogStore value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogStore() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  int productCount,  String status,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogStore() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.productCount,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  int productCount,  String status,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CatalogStore():
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.productCount,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  int productCount,  String status,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CatalogStore() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.productCount,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogStore implements CatalogStore {
  const _CatalogStore({required this.id, required this.name, required this.category, this.tagline, this.logoUrl, this.productCount = 0, this.status = 'ACTIVE', this.createdAt});
  factory _CatalogStore.fromJson(Map<String, dynamic> json) => _$CatalogStoreFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String? tagline;
@override final  String? logoUrl;
@override@JsonKey() final  int productCount;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;

/// Create a copy of CatalogStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogStoreCopyWith<_CatalogStore> get copyWith => __$CatalogStoreCopyWithImpl<_CatalogStore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogStoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogStore&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,tagline,logoUrl,productCount,status,createdAt);

@override
String toString() {
  return 'CatalogStore(id: $id, name: $name, category: $category, tagline: $tagline, logoUrl: $logoUrl, productCount: $productCount, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CatalogStoreCopyWith<$Res> implements $CatalogStoreCopyWith<$Res> {
  factory _$CatalogStoreCopyWith(_CatalogStore value, $Res Function(_CatalogStore) _then) = __$CatalogStoreCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String? tagline, String? logoUrl, int productCount, String status, DateTime? createdAt
});




}
/// @nodoc
class __$CatalogStoreCopyWithImpl<$Res>
    implements _$CatalogStoreCopyWith<$Res> {
  __$CatalogStoreCopyWithImpl(this._self, this._then);

  final _CatalogStore _self;
  final $Res Function(_CatalogStore) _then;

/// Create a copy of CatalogStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? tagline = freezed,Object? logoUrl = freezed,Object? productCount = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_CatalogStore(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Product {

 String get id; String get name; String? get description; double? get price; String get currency; String get availability; String? get sku; String get status; List<String> get imageUrls; List<String> get collectionIds; DateTime? get createdAt;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.collectionIds, collectionIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,availability,sku,status,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(collectionIds),createdAt);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, price: $price, currency: $currency, availability: $availability, sku: $sku, status: $status, imageUrls: $imageUrls, collectionIds: $collectionIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, double? price, String currency, String availability, String? sku, String status, List<String> imageUrls, List<String> collectionIds, DateTime? createdAt
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = null,Object? availability = null,Object? sku = freezed,Object? status = null,Object? imageUrls = null,Object? collectionIds = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,collectionIds: null == collectionIds ? _self.collectionIds : collectionIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  String? sku,  String status,  List<String> imageUrls,  List<String> collectionIds,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.sku,_that.status,_that.imageUrls,_that.collectionIds,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  String? sku,  String status,  List<String> imageUrls,  List<String> collectionIds,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.sku,_that.status,_that.imageUrls,_that.collectionIds,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  String? sku,  String status,  List<String> imageUrls,  List<String> collectionIds,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.sku,_that.status,_that.imageUrls,_that.collectionIds,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.name, this.description, this.price, this.currency = 'INR', this.availability = 'IN_STOCK', this.sku, this.status = 'ACTIVE', final  List<String> imageUrls = const <String>[], final  List<String> collectionIds = const <String>[], this.createdAt}): _imageUrls = imageUrls,_collectionIds = collectionIds;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  double? price;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String availability;
@override final  String? sku;
@override@JsonKey() final  String status;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<String> _collectionIds;
@override@JsonKey() List<String> get collectionIds {
  if (_collectionIds is EqualUnmodifiableListView) return _collectionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collectionIds);
}

@override final  DateTime? createdAt;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._collectionIds, _collectionIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,availability,sku,status,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_collectionIds),createdAt);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, price: $price, currency: $currency, availability: $availability, sku: $sku, status: $status, imageUrls: $imageUrls, collectionIds: $collectionIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, double? price, String currency, String availability, String? sku, String status, List<String> imageUrls, List<String> collectionIds, DateTime? createdAt
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = null,Object? availability = null,Object? sku = freezed,Object? status = null,Object? imageUrls = null,Object? collectionIds = null,Object? createdAt = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,collectionIds: null == collectionIds ? _self._collectionIds : collectionIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Collection {

 String get id; String get name; String? get coverUrl; int get sortOrder; int get productCount;
/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionCopyWith<Collection> get copyWith => _$CollectionCopyWithImpl<Collection>(this as Collection, _$identity);

  /// Serializes this Collection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Collection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,sortOrder,productCount);

@override
String toString() {
  return 'Collection(id: $id, name: $name, coverUrl: $coverUrl, sortOrder: $sortOrder, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class $CollectionCopyWith<$Res>  {
  factory $CollectionCopyWith(Collection value, $Res Function(Collection) _then) = _$CollectionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? coverUrl, int sortOrder, int productCount
});




}
/// @nodoc
class _$CollectionCopyWithImpl<$Res>
    implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._self, this._then);

  final Collection _self;
  final $Res Function(Collection) _then;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,Object? sortOrder = null,Object? productCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Collection].
extension CollectionPatterns on Collection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Collection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Collection value)  $default,){
final _that = this;
switch (_that) {
case _Collection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Collection value)?  $default,){
final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? coverUrl,  int sortOrder,  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.sortOrder,_that.productCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? coverUrl,  int sortOrder,  int productCount)  $default,) {final _that = this;
switch (_that) {
case _Collection():
return $default(_that.id,_that.name,_that.coverUrl,_that.sortOrder,_that.productCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? coverUrl,  int sortOrder,  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _Collection() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.sortOrder,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Collection implements Collection {
  const _Collection({required this.id, required this.name, this.coverUrl, this.sortOrder = 0, this.productCount = 0});
  factory _Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? coverUrl;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  int productCount;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionCopyWith<_Collection> get copyWith => __$CollectionCopyWithImpl<_Collection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Collection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,sortOrder,productCount);

@override
String toString() {
  return 'Collection(id: $id, name: $name, coverUrl: $coverUrl, sortOrder: $sortOrder, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$CollectionCopyWith<$Res> implements $CollectionCopyWith<$Res> {
  factory _$CollectionCopyWith(_Collection value, $Res Function(_Collection) _then) = __$CollectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? coverUrl, int sortOrder, int productCount
});




}
/// @nodoc
class __$CollectionCopyWithImpl<$Res>
    implements _$CollectionCopyWith<$Res> {
  __$CollectionCopyWithImpl(this._self, this._then);

  final _Collection _self;
  final $Res Function(_Collection) _then;

/// Create a copy of Collection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,Object? sortOrder = null,Object? productCount = null,}) {
  return _then(_Collection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PublicCollection {

 String get id; String get name; String? get coverUrl; int get productCount;
/// Create a copy of PublicCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicCollectionCopyWith<PublicCollection> get copyWith => _$PublicCollectionCopyWithImpl<PublicCollection>(this as PublicCollection, _$identity);

  /// Serializes this PublicCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,productCount);

@override
String toString() {
  return 'PublicCollection(id: $id, name: $name, coverUrl: $coverUrl, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class $PublicCollectionCopyWith<$Res>  {
  factory $PublicCollectionCopyWith(PublicCollection value, $Res Function(PublicCollection) _then) = _$PublicCollectionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? coverUrl, int productCount
});




}
/// @nodoc
class _$PublicCollectionCopyWithImpl<$Res>
    implements $PublicCollectionCopyWith<$Res> {
  _$PublicCollectionCopyWithImpl(this._self, this._then);

  final PublicCollection _self;
  final $Res Function(PublicCollection) _then;

/// Create a copy of PublicCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,Object? productCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicCollection].
extension PublicCollectionPatterns on PublicCollection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicCollection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicCollection value)  $default,){
final _that = this;
switch (_that) {
case _PublicCollection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicCollection value)?  $default,){
final _that = this;
switch (_that) {
case _PublicCollection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? coverUrl,  int productCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicCollection() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.productCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? coverUrl,  int productCount)  $default,) {final _that = this;
switch (_that) {
case _PublicCollection():
return $default(_that.id,_that.name,_that.coverUrl,_that.productCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? coverUrl,  int productCount)?  $default,) {final _that = this;
switch (_that) {
case _PublicCollection() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.productCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicCollection implements PublicCollection {
  const _PublicCollection({required this.id, required this.name, this.coverUrl, this.productCount = 0});
  factory _PublicCollection.fromJson(Map<String, dynamic> json) => _$PublicCollectionFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? coverUrl;
@override@JsonKey() final  int productCount;

/// Create a copy of PublicCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicCollectionCopyWith<_PublicCollection> get copyWith => __$PublicCollectionCopyWithImpl<_PublicCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,productCount);

@override
String toString() {
  return 'PublicCollection(id: $id, name: $name, coverUrl: $coverUrl, productCount: $productCount)';
}


}

/// @nodoc
abstract mixin class _$PublicCollectionCopyWith<$Res> implements $PublicCollectionCopyWith<$Res> {
  factory _$PublicCollectionCopyWith(_PublicCollection value, $Res Function(_PublicCollection) _then) = __$PublicCollectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? coverUrl, int productCount
});




}
/// @nodoc
class __$PublicCollectionCopyWithImpl<$Res>
    implements _$PublicCollectionCopyWith<$Res> {
  __$PublicCollectionCopyWithImpl(this._self, this._then);

  final _PublicCollection _self;
  final $Res Function(_PublicCollection) _then;

/// Create a copy of PublicCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,Object? productCount = null,}) {
  return _then(_PublicCollection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductPage {

 List<Product> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of ProductPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPageCopyWith<ProductPage> get copyWith => _$ProductPageCopyWithImpl<ProductPage>(this as ProductPage, _$identity);

  /// Serializes this ProductPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'ProductPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ProductPageCopyWith<$Res>  {
  factory $ProductPageCopyWith(ProductPage value, $Res Function(ProductPage) _then) = _$ProductPageCopyWithImpl;
@useResult
$Res call({
 List<Product> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$ProductPageCopyWithImpl<$Res>
    implements $ProductPageCopyWith<$Res> {
  _$ProductPageCopyWithImpl(this._self, this._then);

  final ProductPage _self;
  final $Res Function(ProductPage) _then;

/// Create a copy of ProductPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<Product>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPage].
extension ProductPagePatterns on ProductPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPage value)  $default,){
final _that = this;
switch (_that) {
case _ProductPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPage value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _ProductPage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ProductPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductPage implements ProductPage {
  const _ProductPage({final  List<Product> content = const <Product>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _ProductPage.fromJson(Map<String, dynamic> json) => _$ProductPageFromJson(json);

 final  List<Product> _content;
@override@JsonKey() List<Product> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of ProductPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPageCopyWith<_ProductPage> get copyWith => __$ProductPageCopyWithImpl<_ProductPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'ProductPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ProductPageCopyWith<$Res> implements $ProductPageCopyWith<$Res> {
  factory _$ProductPageCopyWith(_ProductPage value, $Res Function(_ProductPage) _then) = __$ProductPageCopyWithImpl;
@override @useResult
$Res call({
 List<Product> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$ProductPageCopyWithImpl<$Res>
    implements _$ProductPageCopyWith<$Res> {
  __$ProductPageCopyWithImpl(this._self, this._then);

  final _ProductPage _self;
  final $Res Function(_ProductPage) _then;

/// Create a copy of ProductPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_ProductPage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<Product>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PublicStore {

 String get id; String get name; String get category; String? get tagline; String? get logoUrl; String? get coverImageUrl; int get productCount; String get ownerUserId; String? get ownerName;
/// Create a copy of PublicStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicStoreCopyWith<PublicStore> get copyWith => _$PublicStoreCopyWithImpl<PublicStore>(this as PublicStore, _$identity);

  /// Serializes this PublicStore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicStore&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,tagline,logoUrl,coverImageUrl,productCount,ownerUserId,ownerName);

@override
String toString() {
  return 'PublicStore(id: $id, name: $name, category: $category, tagline: $tagline, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, productCount: $productCount, ownerUserId: $ownerUserId, ownerName: $ownerName)';
}


}

/// @nodoc
abstract mixin class $PublicStoreCopyWith<$Res>  {
  factory $PublicStoreCopyWith(PublicStore value, $Res Function(PublicStore) _then) = _$PublicStoreCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String? tagline, String? logoUrl, String? coverImageUrl, int productCount, String ownerUserId, String? ownerName
});




}
/// @nodoc
class _$PublicStoreCopyWithImpl<$Res>
    implements $PublicStoreCopyWith<$Res> {
  _$PublicStoreCopyWithImpl(this._self, this._then);

  final PublicStore _self;
  final $Res Function(PublicStore) _then;

/// Create a copy of PublicStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? tagline = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? productCount = null,Object? ownerUserId = null,Object? ownerName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicStore].
extension PublicStorePatterns on PublicStore {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicStore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicStore() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicStore value)  $default,){
final _that = this;
switch (_that) {
case _PublicStore():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicStore value)?  $default,){
final _that = this;
switch (_that) {
case _PublicStore() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  String? coverImageUrl,  int productCount,  String ownerUserId,  String? ownerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicStore() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.coverImageUrl,_that.productCount,_that.ownerUserId,_that.ownerName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  String? coverImageUrl,  int productCount,  String ownerUserId,  String? ownerName)  $default,) {final _that = this;
switch (_that) {
case _PublicStore():
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.coverImageUrl,_that.productCount,_that.ownerUserId,_that.ownerName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String? tagline,  String? logoUrl,  String? coverImageUrl,  int productCount,  String ownerUserId,  String? ownerName)?  $default,) {final _that = this;
switch (_that) {
case _PublicStore() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.tagline,_that.logoUrl,_that.coverImageUrl,_that.productCount,_that.ownerUserId,_that.ownerName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicStore implements PublicStore {
  const _PublicStore({required this.id, required this.name, required this.category, this.tagline, this.logoUrl, this.coverImageUrl, this.productCount = 0, required this.ownerUserId, this.ownerName});
  factory _PublicStore.fromJson(Map<String, dynamic> json) => _$PublicStoreFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String? tagline;
@override final  String? logoUrl;
@override final  String? coverImageUrl;
@override@JsonKey() final  int productCount;
@override final  String ownerUserId;
@override final  String? ownerName;

/// Create a copy of PublicStore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicStoreCopyWith<_PublicStore> get copyWith => __$PublicStoreCopyWithImpl<_PublicStore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicStoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicStore&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,tagline,logoUrl,coverImageUrl,productCount,ownerUserId,ownerName);

@override
String toString() {
  return 'PublicStore(id: $id, name: $name, category: $category, tagline: $tagline, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, productCount: $productCount, ownerUserId: $ownerUserId, ownerName: $ownerName)';
}


}

/// @nodoc
abstract mixin class _$PublicStoreCopyWith<$Res> implements $PublicStoreCopyWith<$Res> {
  factory _$PublicStoreCopyWith(_PublicStore value, $Res Function(_PublicStore) _then) = __$PublicStoreCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String? tagline, String? logoUrl, String? coverImageUrl, int productCount, String ownerUserId, String? ownerName
});




}
/// @nodoc
class __$PublicStoreCopyWithImpl<$Res>
    implements _$PublicStoreCopyWith<$Res> {
  __$PublicStoreCopyWithImpl(this._self, this._then);

  final _PublicStore _self;
  final $Res Function(_PublicStore) _then;

/// Create a copy of PublicStore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? tagline = freezed,Object? logoUrl = freezed,Object? coverImageUrl = freezed,Object? productCount = null,Object? ownerUserId = null,Object? ownerName = freezed,}) {
  return _then(_PublicStore(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PublicStorePage {

 List<PublicStore> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of PublicStorePage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicStorePageCopyWith<PublicStorePage> get copyWith => _$PublicStorePageCopyWithImpl<PublicStorePage>(this as PublicStorePage, _$identity);

  /// Serializes this PublicStorePage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicStorePage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'PublicStorePage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $PublicStorePageCopyWith<$Res>  {
  factory $PublicStorePageCopyWith(PublicStorePage value, $Res Function(PublicStorePage) _then) = _$PublicStorePageCopyWithImpl;
@useResult
$Res call({
 List<PublicStore> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$PublicStorePageCopyWithImpl<$Res>
    implements $PublicStorePageCopyWith<$Res> {
  _$PublicStorePageCopyWithImpl(this._self, this._then);

  final PublicStorePage _self;
  final $Res Function(PublicStorePage) _then;

/// Create a copy of PublicStorePage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<PublicStore>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicStorePage].
extension PublicStorePagePatterns on PublicStorePage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicStorePage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicStorePage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicStorePage value)  $default,){
final _that = this;
switch (_that) {
case _PublicStorePage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicStorePage value)?  $default,){
final _that = this;
switch (_that) {
case _PublicStorePage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PublicStore> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicStorePage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PublicStore> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _PublicStorePage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PublicStore> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _PublicStorePage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicStorePage implements PublicStorePage {
  const _PublicStorePage({final  List<PublicStore> content = const <PublicStore>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _PublicStorePage.fromJson(Map<String, dynamic> json) => _$PublicStorePageFromJson(json);

 final  List<PublicStore> _content;
@override@JsonKey() List<PublicStore> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of PublicStorePage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicStorePageCopyWith<_PublicStorePage> get copyWith => __$PublicStorePageCopyWithImpl<_PublicStorePage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicStorePageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicStorePage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'PublicStorePage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$PublicStorePageCopyWith<$Res> implements $PublicStorePageCopyWith<$Res> {
  factory _$PublicStorePageCopyWith(_PublicStorePage value, $Res Function(_PublicStorePage) _then) = __$PublicStorePageCopyWithImpl;
@override @useResult
$Res call({
 List<PublicStore> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$PublicStorePageCopyWithImpl<$Res>
    implements _$PublicStorePageCopyWith<$Res> {
  __$PublicStorePageCopyWithImpl(this._self, this._then);

  final _PublicStorePage _self;
  final $Res Function(_PublicStorePage) _then;

/// Create a copy of PublicStorePage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_PublicStorePage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<PublicStore>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PublicProduct {

 String get id; String get name; String? get description; double? get price; String get currency; String get availability; List<String> get imageUrls; String get catalogId; String? get storeName; String get ownerUserId; DateTime? get createdAt;
/// Create a copy of PublicProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicProductCopyWith<PublicProduct> get copyWith => _$PublicProductCopyWithImpl<PublicProduct>(this as PublicProduct, _$identity);

  /// Serializes this PublicProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.availability, availability) || other.availability == availability)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.catalogId, catalogId) || other.catalogId == catalogId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,availability,const DeepCollectionEquality().hash(imageUrls),catalogId,storeName,ownerUserId,createdAt);

@override
String toString() {
  return 'PublicProduct(id: $id, name: $name, description: $description, price: $price, currency: $currency, availability: $availability, imageUrls: $imageUrls, catalogId: $catalogId, storeName: $storeName, ownerUserId: $ownerUserId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PublicProductCopyWith<$Res>  {
  factory $PublicProductCopyWith(PublicProduct value, $Res Function(PublicProduct) _then) = _$PublicProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, double? price, String currency, String availability, List<String> imageUrls, String catalogId, String? storeName, String ownerUserId, DateTime? createdAt
});




}
/// @nodoc
class _$PublicProductCopyWithImpl<$Res>
    implements $PublicProductCopyWith<$Res> {
  _$PublicProductCopyWithImpl(this._self, this._then);

  final PublicProduct _self;
  final $Res Function(PublicProduct) _then;

/// Create a copy of PublicProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = null,Object? availability = null,Object? imageUrls = null,Object? catalogId = null,Object? storeName = freezed,Object? ownerUserId = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,catalogId: null == catalogId ? _self.catalogId : catalogId // ignore: cast_nullable_to_non_nullable
as String,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicProduct].
extension PublicProductPatterns on PublicProduct {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicProduct() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicProduct value)  $default,){
final _that = this;
switch (_that) {
case _PublicProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicProduct value)?  $default,){
final _that = this;
switch (_that) {
case _PublicProduct() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  List<String> imageUrls,  String catalogId,  String? storeName,  String ownerUserId,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.imageUrls,_that.catalogId,_that.storeName,_that.ownerUserId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  List<String> imageUrls,  String catalogId,  String? storeName,  String ownerUserId,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PublicProduct():
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.imageUrls,_that.catalogId,_that.storeName,_that.ownerUserId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  double? price,  String currency,  String availability,  List<String> imageUrls,  String catalogId,  String? storeName,  String ownerUserId,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PublicProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.availability,_that.imageUrls,_that.catalogId,_that.storeName,_that.ownerUserId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicProduct implements PublicProduct {
  const _PublicProduct({required this.id, required this.name, this.description, this.price, this.currency = 'INR', this.availability = 'IN_STOCK', final  List<String> imageUrls = const <String>[], required this.catalogId, this.storeName, required this.ownerUserId, this.createdAt}): _imageUrls = imageUrls;
  factory _PublicProduct.fromJson(Map<String, dynamic> json) => _$PublicProductFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  double? price;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String availability;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  String catalogId;
@override final  String? storeName;
@override final  String ownerUserId;
@override final  DateTime? createdAt;

/// Create a copy of PublicProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicProductCopyWith<_PublicProduct> get copyWith => __$PublicProductCopyWithImpl<_PublicProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.availability, availability) || other.availability == availability)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.catalogId, catalogId) || other.catalogId == catalogId)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,availability,const DeepCollectionEquality().hash(_imageUrls),catalogId,storeName,ownerUserId,createdAt);

@override
String toString() {
  return 'PublicProduct(id: $id, name: $name, description: $description, price: $price, currency: $currency, availability: $availability, imageUrls: $imageUrls, catalogId: $catalogId, storeName: $storeName, ownerUserId: $ownerUserId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PublicProductCopyWith<$Res> implements $PublicProductCopyWith<$Res> {
  factory _$PublicProductCopyWith(_PublicProduct value, $Res Function(_PublicProduct) _then) = __$PublicProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, double? price, String currency, String availability, List<String> imageUrls, String catalogId, String? storeName, String ownerUserId, DateTime? createdAt
});




}
/// @nodoc
class __$PublicProductCopyWithImpl<$Res>
    implements _$PublicProductCopyWith<$Res> {
  __$PublicProductCopyWithImpl(this._self, this._then);

  final _PublicProduct _self;
  final $Res Function(_PublicProduct) _then;

/// Create a copy of PublicProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = null,Object? availability = null,Object? imageUrls = null,Object? catalogId = null,Object? storeName = freezed,Object? ownerUserId = null,Object? createdAt = freezed,}) {
  return _then(_PublicProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,catalogId: null == catalogId ? _self.catalogId : catalogId // ignore: cast_nullable_to_non_nullable
as String,storeName: freezed == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String?,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PublicProductPage {

 List<PublicProduct> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of PublicProductPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicProductPageCopyWith<PublicProductPage> get copyWith => _$PublicProductPageCopyWithImpl<PublicProductPage>(this as PublicProductPage, _$identity);

  /// Serializes this PublicProductPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicProductPage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'PublicProductPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $PublicProductPageCopyWith<$Res>  {
  factory $PublicProductPageCopyWith(PublicProductPage value, $Res Function(PublicProductPage) _then) = _$PublicProductPageCopyWithImpl;
@useResult
$Res call({
 List<PublicProduct> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$PublicProductPageCopyWithImpl<$Res>
    implements $PublicProductPageCopyWith<$Res> {
  _$PublicProductPageCopyWithImpl(this._self, this._then);

  final PublicProductPage _self;
  final $Res Function(PublicProductPage) _then;

/// Create a copy of PublicProductPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<PublicProduct>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicProductPage].
extension PublicProductPagePatterns on PublicProductPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicProductPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicProductPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicProductPage value)  $default,){
final _that = this;
switch (_that) {
case _PublicProductPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicProductPage value)?  $default,){
final _that = this;
switch (_that) {
case _PublicProductPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PublicProduct> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicProductPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PublicProduct> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _PublicProductPage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PublicProduct> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _PublicProductPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicProductPage implements PublicProductPage {
  const _PublicProductPage({final  List<PublicProduct> content = const <PublicProduct>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _PublicProductPage.fromJson(Map<String, dynamic> json) => _$PublicProductPageFromJson(json);

 final  List<PublicProduct> _content;
@override@JsonKey() List<PublicProduct> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of PublicProductPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicProductPageCopyWith<_PublicProductPage> get copyWith => __$PublicProductPageCopyWithImpl<_PublicProductPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicProductPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicProductPage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'PublicProductPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$PublicProductPageCopyWith<$Res> implements $PublicProductPageCopyWith<$Res> {
  factory _$PublicProductPageCopyWith(_PublicProductPage value, $Res Function(_PublicProductPage) _then) = __$PublicProductPageCopyWithImpl;
@override @useResult
$Res call({
 List<PublicProduct> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$PublicProductPageCopyWithImpl<$Res>
    implements _$PublicProductPageCopyWith<$Res> {
  __$PublicProductPageCopyWithImpl(this._self, this._then);

  final _PublicProductPage _self;
  final $Res Function(_PublicProductPage) _then;

/// Create a copy of PublicProductPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_PublicProductPage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<PublicProduct>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
