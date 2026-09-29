// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Connect';

  @override
  String get tagline => 'Connect से जुड़ाव बनाएँ';

  @override
  String get connections => 'कनेक्शन';

  @override
  String get noConnectionsYet => 'अभी तक कोई कनेक्शन नहीं';

  @override
  String get couldNotLoadChats => 'चैट लोड नहीं हो सकीं';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get enterNumberToLogin => 'लॉगिन के लिए नंबर दर्ज करें';

  @override
  String get login => 'लॉगिन';

  @override
  String get invalidMobile => 'मान्य 10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get verifyOtpTitle => 'OTP सत्यापित करें';

  @override
  String otpSentTo(String phone) {
    return 'हमने $phone पर OTP भेजा है';
  }

  @override
  String get edit => 'बदलें';

  @override
  String get enterOtp => 'OTP दर्ज करें';

  @override
  String get resendOtp => 'OTP दोबारा भेजें';

  @override
  String resendOtpIn(String seconds) {
    return '$seconds में OTP दोबारा भेजें';
  }

  @override
  String get verify => 'सत्यापित करें';

  @override
  String get secureAndPrivate => 'सुरक्षित और निजी';

  @override
  String get otpConfidential =>
      'आपका OTP गोपनीय है। इसे किसी के साथ साझा न करें';

  @override
  String get secureCommunication => 'सुरक्षित संचार';

  @override
  String get builtForBusiness => 'व्यवसाय के लिए';

  @override
  String get yourDataProtected => 'आपका डेटा सुरक्षित है';

  @override
  String get byContinuing => 'जारी रखते हुए, आप हमारी';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get and => 'और';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get home => 'होम';

  @override
  String get broadcast => 'ब्रॉडकास्ट';

  @override
  String get selectContacts => 'संपर्क चुनें';

  @override
  String get searchByNameNumber => 'नाम या नंबर से खोजें';

  @override
  String get newContact => 'नया संपर्क';

  @override
  String get addNewContact => 'नया संपर्क जोड़ें';

  @override
  String get nameLabel => 'नाम';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get phoneNumberLabel => 'फ़ोन नंबर';

  @override
  String get phoneNumberHint => 'फ़ोन नंबर';

  @override
  String get add => 'जोड़ें';

  @override
  String get noBroadcastYet => 'अभी तक कोई ब्रॉडकास्ट शुरू नहीं हुआ';

  @override
  String get startBroadcast => 'ब्रॉडकास्ट शुरू करें';

  @override
  String get broadcastName => 'ब्रॉडकास्ट का नाम';

  @override
  String get broadcastListsLoadError => 'ब्रॉडकास्ट सूचियाँ लोड नहीं हो सकीं';

  @override
  String get noBroadcastListsYet => 'अभी तक कोई ब्रॉडकास्ट सूची नहीं';

  @override
  String get tapPlusToCreate => 'बनाने के लिए + दबाएँ';

  @override
  String recipientsCount(int count) {
    return '$count प्राप्तकर्ता';
  }

  @override
  String get nameThisList => 'इस सूची का नाम दें';

  @override
  String listNameHintExample(int count) {
    return 'जैसे नियमित ($count संपर्क)';
  }

  @override
  String get create => 'बनाएँ';

  @override
  String get couldNotCreateList => 'सूची नहीं बन सकी।';

  @override
  String get broadcastListSubtitle => 'ब्रॉडकास्ट सूची';

  @override
  String get manageRecipients => 'प्राप्तकर्ता प्रबंधित करें';

  @override
  String get renameList => 'सूची का नाम बदलें';

  @override
  String get deleteList => 'सूची हटाएँ';

  @override
  String get save => 'सहेजें';

  @override
  String get couldNotRenameList => 'नाम नहीं बदला जा सका।';

  @override
  String deleteListConfirm(String name) {
    return '\"$name\" हटाएँ? इससे सूची और उसका इतिहास हट जाएगा। पहले भेजे गए संदेश प्राप्तकर्ताओं के पास बने रहेंगे।';
  }

  @override
  String get couldNotDeleteList => 'सूची नहीं हटाई जा सकी।';

  @override
  String get couldNotLoadMessages => 'संदेश लोड नहीं हो सके';

  @override
  String get sendFirstBroadcast => 'अपना पहला ब्रॉडकास्ट भेजें';

  @override
  String get couldNotSendBroadcast => 'ब्रॉडकास्ट नहीं भेजा जा सका।';

  @override
  String get recipients => 'प्राप्तकर्ता';

  @override
  String get couldNotLoadRecipients => 'प्राप्तकर्ता लोड नहीं हो सके';

  @override
  String get noRecipientsYet => 'अभी तक कोई प्राप्तकर्ता नहीं';

  @override
  String get tapAddToInclude => 'संपर्क जोड़ने के लिए जोड़ें दबाएँ';

  @override
  String get notOnApp => 'ऐप पर नहीं';

  @override
  String get removeRecipient => 'प्राप्तकर्ता हटाएँ';

  @override
  String get remove => 'हटाएँ';

  @override
  String removeRecipientConfirm(String name) {
    return '$name को इस सूची से हटाएँ?';
  }

  @override
  String get couldNotAddRecipients => 'प्राप्तकर्ता नहीं जोड़े जा सके।';

  @override
  String get couldNotRemoveRecipient => 'प्राप्तकर्ता नहीं हटाया जा सका।';

  @override
  String get myStore => 'मेरी दुकान';

  @override
  String get setUpYourStore => 'अपनी दुकान सेट करें';

  @override
  String get storeName => 'दुकान का नाम';

  @override
  String get storeNameHint => 'जैसे शर्मा गारमेंट्स';

  @override
  String get category => 'श्रेणी';

  @override
  String get storeTagline => 'टैगलाइन';

  @override
  String get taglineHint => 'अपनी दुकान के बारे में एक लाइन (वैकल्पिक)';

  @override
  String get storeLogo => 'दुकान का लोगो';

  @override
  String get createStore => 'दुकान बनाएँ';

  @override
  String get saveChanges => 'बदलाव सहेजें';

  @override
  String get editStore => 'दुकान संपादित करें';

  @override
  String get couldNotSaveStore => 'दुकान सहेजी नहीं जा सकी। पुनः प्रयास करें।';

  @override
  String get couldNotLoadStore => 'दुकान लोड नहीं हो सकी।';

  @override
  String get catFashion => 'फ़ैशन';

  @override
  String get catGrocery => 'किराना';

  @override
  String get catElectronics => 'इलेक्ट्रॉनिक्स';

  @override
  String get catFood => 'खाना';

  @override
  String get catHome => 'घर';

  @override
  String get catBeauty => 'ब्यूटी';

  @override
  String get catServices => 'सेवाएँ';

  @override
  String get catOther => 'अन्य';

  @override
  String get addProduct => 'उत्पाद जोड़ें';

  @override
  String get editProduct => 'उत्पाद संपादित करें';

  @override
  String get productName => 'उत्पाद का नाम';

  @override
  String get productNameHint => 'जैसे कॉटन कुर्ता';

  @override
  String get price => 'कीमत';

  @override
  String get optional => 'वैकल्पिक';

  @override
  String get description => 'विवरण';

  @override
  String get descriptionHint => 'विवरण, साइज़, रंग… (वैकल्पिक)';

  @override
  String get photos => 'तस्वीरें';

  @override
  String get addPhoto => 'तस्वीर जोड़ें';

  @override
  String get inStock => 'स्टॉक में';

  @override
  String get outOfStock => 'स्टॉक ख़त्म';

  @override
  String get available => 'उपलब्ध';

  @override
  String get hide => 'छिपाएँ';

  @override
  String get unhide => 'दिखाएँ';

  @override
  String deleteProductConfirm(String name) {
    return '\"$name\" हटाएँ? यह वापस नहीं किया जा सकता।';
  }

  @override
  String get productDeleted => 'उत्पाद हटाया गया';

  @override
  String get couldNotSaveProduct =>
      'उत्पाद सहेजा नहीं जा सका। पुनः प्रयास करें।';

  @override
  String get couldNotDeleteProduct => 'उत्पाद नहीं हटाया जा सका।';

  @override
  String get noProductsYet => 'अभी तक कोई उत्पाद नहीं';

  @override
  String get addFirstProduct => 'अपना पहला उत्पाद जोड़ें';

  @override
  String get couldNotLoadProducts => 'उत्पाद लोड नहीं हो सके।';

  @override
  String productsCount(int count) {
    return '$count उत्पाद';
  }

  @override
  String get dmForPrice => 'कीमत पूछें';

  @override
  String get enquire => 'पूछताछ करें';

  @override
  String get shareToChat => 'चैट में साझा करें';

  @override
  String get viewStore => 'दुकान देखें';

  @override
  String get hiddenLabel => 'छिपा हुआ';

  @override
  String get couldNotLoadProduct => 'उत्पाद लोड नहीं हो सका।';

  @override
  String get storeHasNoProducts => 'इस दुकान में अभी कोई उत्पाद नहीं है।';

  @override
  String get sharedAProduct => 'एक उत्पाद साझा किया';

  @override
  String get collections => 'संग्रह';

  @override
  String get manageCollections => 'संग्रह प्रबंधित करें';

  @override
  String get newCollection => 'नया संग्रह';

  @override
  String get collectionName => 'संग्रह का नाम';

  @override
  String get collectionNameHint => 'जैसे नए आगमन';

  @override
  String get createCollection => 'संग्रह बनाएँ';

  @override
  String get renameCollection => 'संग्रह का नाम बदलें';

  @override
  String deleteCollectionConfirm(String name) {
    return '\"$name\" हटाएँ? उत्पाद बने रहेंगे, बस इस संग्रह से हट जाएँगे।';
  }

  @override
  String get noCollectionsYet => 'अभी तक कोई संग्रह नहीं';

  @override
  String get addFirstCollection => 'अपने उत्पादों को संग्रह में समूहित करें';

  @override
  String get couldNotSaveCollection => 'संग्रह सहेजा नहीं जा सका।';

  @override
  String get couldNotDeleteCollection => 'संग्रह नहीं हटाया जा सका।';

  @override
  String get couldNotLoadCollections => 'संग्रह लोड नहीं हो सके।';

  @override
  String get collectionsField => 'संग्रह';

  @override
  String get noneOption => 'कोई नहीं';

  @override
  String get allFilter => 'सभी';

  @override
  String get othersFilter => 'अन्य';

  @override
  String get storesTab => 'स्टोर';

  @override
  String get searchStores => 'स्टोर खोजें';

  @override
  String get noStoresYet => 'अभी तक कोई स्टोर नहीं';

  @override
  String get noStoresFound => 'आपकी खोज से कोई स्टोर मेल नहीं खाता';

  @override
  String get couldNotLoadStores => 'स्टोर लोड नहीं हो सके।';

  @override
  String get details => 'विवरण';

  @override
  String get contactPermission => 'संपर्क अनुमति';

  @override
  String get contactPermissionDesc =>
      'ब्रॉडकास्ट साझा करने के लिए संपर्क अनुमति';

  @override
  String get notificationPermission => 'सूचना अनुमति';

  @override
  String get notificationPermissionDesc =>
      'त्वरित अपडेट पाने के लिए सूचनाएँ चालू करें';

  @override
  String get appLock => 'ऐप लॉक';

  @override
  String get appLockDesc => 'अपने ऐप को सुरक्षित करने के लिए MFA का उपयोग करें';

  @override
  String get appLockUnavailable =>
      'इस डिवाइस पर कोई स्क्रीन लॉक या बायोमेट्रिक्स सेट नहीं है';

  @override
  String get permissionSettingsHint =>
      'आप यह अनुमति ऐप सेटिंग्स से बदल सकते हैं।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get darkTheme => 'डार्क थीम';

  @override
  String get helpFeedback => 'सहायता और फ़ीडबैक';

  @override
  String get shareInvite => 'साझा करें और आमंत्रित करें';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get sendMessage => 'संदेश भेजें';

  @override
  String get delete => 'हटाएं';

  @override
  String get editName => 'नाम बदलें';

  @override
  String get addMember => 'सदस्य जोड़ें';

  @override
  String get camera => 'कैमरा';

  @override
  String get gallery => 'गैलरी';

  @override
  String get unlock => 'अनलॉक करें';

  @override
  String get appLocked => 'Connect लॉक है';

  @override
  String get appLockedMessage =>
      'जारी रखने के लिए फ़िंगरप्रिंट, चेहरे या डिवाइस पासकोड से अनलॉक करें।';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';
}
