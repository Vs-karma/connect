import 'package:flutter/foundation.dart';

class EndPoints {
  EndPoints._();

  static const String _devBaseUrl = 'http://192.168.1.5:8080';

  static const String _prodBaseUrl = 'https://api.connect-messenger.com';

  static String _baseUrl = kReleaseMode ? _prodBaseUrl : _devBaseUrl;

  static String get BASE_URL => _baseUrl;

  static set baseUrl(String value) {
    final v = value.trim();
    if (v.isNotEmpty) _baseUrl = v;
  }

  static String mediaUrl(String url) => url.startsWith('http') ? url : BASE_URL + url;

  static String get _api => '$BASE_URL/api/v1';

  static String get OTP_REQUEST => '$_api/auth/otp/request';
  static String get OTP_VERIFY => '$_api/auth/otp/verify';
  static String get REFRESH_TOKEN => '$_api/auth/token/refresh';
  static String get LOGOUT => '$_api/auth/logout';
  static String get LOGOUT_ALL => '$_api/auth/logout-all';
  static String get ME => '$_api/auth/me';

  // Account / profile (GET + PATCH on the same path)
  static String get USERS_ME => '$_api/users/me';
  static String get USER_AVATAR => '$_api/users/me/avatar';
  static String get PROFILE => USERS_ME;
  static String get PREFERENCES => '$_api/users/me/preferences';
  static String get DEVICES => '$_api/users/me/devices';
  static String get DELETE_ACCOUNT => USERS_ME;

  static String get PLANS => '$_api/subscription/plans';
  static String get SUBSCRIPTION => '$_api/subscription';
  static String get SUBSCRIBE => '$_api/subscription/subscribe';
  static String get SUBSCRIPTION_VERIFY => '$_api/subscription/verify';
  static String get SUBSCRIPTION_CANCEL => '$_api/subscription/cancel';
  static String get SUBSCRIPTION_DEV_ACTIVATE => '$_api/subscription/dev/activate';

  static String get SHOP => '$_api/shop';
  static String publicShop(String code) => '$_api/shops/$code';

  static String get SHOP_CUSTOMERS => '$_api/shop/customers';
  static String get SHOP_CUSTOMERS_COUNT => '$_api/shop/customers/count';
  static String shopCustomer(String memberId) => '$_api/shop/customers/$memberId';

  static String get SEGMENTS => '$_api/shop/segments';
  static String segment(String id) => '$_api/shop/segments/$id';
  static String segmentMembers(String id) => '$_api/shop/segments/$id/members';
  static String segmentMembersByPhone(String id) => '$_api/shop/segments/$id/members/by-phone';

  static String get BROADCASTS => '$_api/broadcasts';
  static String broadcast(String id) => '$_api/broadcasts/$id';

  // WhatsApp-style broadcast lists (named groups)
  static String get BROADCAST_LISTS => '$_api/broadcast-lists';
  static String broadcastList(String id) => '$_api/broadcast-lists/$id';
  static String broadcastListMessages(String id) => '$_api/broadcast-lists/$id/messages';
  static String broadcastListMembers(String id) => '$_api/broadcast-lists/$id/members';

  // Catalog (store + products)
  static String get CATALOG => '$_api/catalog';
  static String get CATALOG_ME => '$_api/catalog/me';
  static String get CATALOG_PRODUCTS => '$_api/catalog/me/products';
  static String catalogProduct(String id) => '$_api/catalog/me/products/$id';
  static String publicCatalog(String id) => '$_api/catalogs/$id';
  static String publicCatalogProducts(String id) => '$_api/catalogs/$id/products';
  static String publicProduct(String id) => '$_api/products/$id';
  static String userCatalog(String userId) => '$_api/users/$userId/catalog';
  static String get STORES => '$_api/stores';
  static String get CATALOG_COLLECTIONS => '$_api/catalog/me/collections';
  static String catalogCollection(String id) => '$_api/catalog/me/collections/$id';
  static String publicCatalogCollections(String id) => '$_api/catalogs/$id/collections';

  // 1:1 chat (WhatsApp-style)
  static String get CONVERSATIONS => '$_api/conversations';
  static String get CONVERSATIONS_UNREAD => '$_api/conversations/unread-count';
  static String startChatWith(String userId) => '$_api/conversations/with/$userId/messages';
  static String conversationMessages(String cid) => '$_api/conversations/$cid/messages';
  static String conversationMessage(String cid, String mid) => '$_api/conversations/$cid/messages/$mid';
  static String conversationRead(String cid) => '$_api/conversations/$cid/read';
  static String conversationBlock(String cid) => '$_api/conversations/$cid/block';
  static String conversationUnblock(String cid) => '$_api/conversations/$cid/unblock';

  // Contacts: which phones already have a Mitra account (drives chat/broadcast + invite)
  static String get CONTACTS_LOOKUP => '$_api/shop/customers/lookup';

  static String get MY_SUBSCRIPTIONS => '$_api/lists';
  static String subscribe(String shopCode) => '$_api/lists/$shopCode/subscribe';
  static String unsubscribe(String shopCode) => '$_api/lists/$shopCode/unsubscribe';
  static String mute(String shopCode) => '$_api/lists/$shopCode/mute';
  static String unmute(String shopCode) => '$_api/lists/$shopCode/unmute';

  static String get MEDIA_UPLOAD => '$_api/media';

  static String get ANALYTICS_SUMMARY => '$_api/shop/analytics/summary';
}
