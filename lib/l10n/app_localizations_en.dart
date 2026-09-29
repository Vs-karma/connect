// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Connect';

  @override
  String get tagline => 'Build Connection Using Connect';

  @override
  String get connections => 'Connections';

  @override
  String get noConnectionsYet => 'No connections yet';

  @override
  String get couldNotLoadChats => 'Could not load chats';

  @override
  String get retry => 'Retry';

  @override
  String get enterNumberToLogin => 'Enter number to login';

  @override
  String get login => 'Login';

  @override
  String get invalidMobile => 'Enter a valid 10-digit mobile number';

  @override
  String get verifyOtpTitle => 'Verify OTP';

  @override
  String otpSentTo(String phone) {
    return 'We\'ve sent an OTP on $phone';
  }

  @override
  String get edit => 'Edit';

  @override
  String get enterOtp => 'Enter the OTP';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String resendOtpIn(String seconds) {
    return 'Resend OTP in $seconds';
  }

  @override
  String get verify => 'Verify';

  @override
  String get secureAndPrivate => 'Secure & Private';

  @override
  String get otpConfidential =>
      'Your OTP is confidential. Don\'t share it with anyone';

  @override
  String get secureCommunication => 'Secure Communication';

  @override
  String get builtForBusiness => 'Built For Business';

  @override
  String get yourDataProtected => 'Your Data Is Protected';

  @override
  String get byContinuing => 'By continuing, you agree to our';

  @override
  String get termsOfService => 'Terms of service';

  @override
  String get and => 'and';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get home => 'Home';

  @override
  String get broadcast => 'Broadcast';

  @override
  String get selectContacts => 'Select Contacts';

  @override
  String get searchByNameNumber => 'Search by name & number';

  @override
  String get newContact => 'New Contact';

  @override
  String get addNewContact => 'Add New Contact';

  @override
  String get nameLabel => 'Name';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumberLabel => 'Phone Number';

  @override
  String get phoneNumberHint => 'Phone number';

  @override
  String get add => 'Add';

  @override
  String get noBroadcastYet => 'No Broadcast Started Yet';

  @override
  String get startBroadcast => 'Start Broadcast';

  @override
  String get broadcastName => 'Broadcast Name';

  @override
  String get broadcastListsLoadError => 'Could not load broadcast lists';

  @override
  String get noBroadcastListsYet => 'No broadcast lists yet';

  @override
  String get tapPlusToCreate => 'Tap + to create one';

  @override
  String recipientsCount(int count) {
    return '$count recipients';
  }

  @override
  String get nameThisList => 'Name this list';

  @override
  String listNameHintExample(int count) {
    return 'e.g. Regulars ($count contacts)';
  }

  @override
  String get create => 'Create';

  @override
  String get couldNotCreateList => 'Could not create list.';

  @override
  String get broadcastListSubtitle => 'Broadcast list';

  @override
  String get manageRecipients => 'Manage recipients';

  @override
  String get renameList => 'Rename list';

  @override
  String get deleteList => 'Delete list';

  @override
  String get save => 'Save';

  @override
  String get couldNotRenameList => 'Could not rename list.';

  @override
  String deleteListConfirm(String name) {
    return 'Delete \"$name\"? This removes the list and its history. Recipients keep messages already sent.';
  }

  @override
  String get couldNotDeleteList => 'Could not delete list.';

  @override
  String get couldNotLoadMessages => 'Could not load messages';

  @override
  String get sendFirstBroadcast => 'Send your first broadcast';

  @override
  String get couldNotSendBroadcast => 'Could not send broadcast.';

  @override
  String get recipients => 'Recipients';

  @override
  String get couldNotLoadRecipients => 'Could not load recipients';

  @override
  String get noRecipientsYet => 'No recipients yet';

  @override
  String get tapAddToInclude => 'Tap Add to include contacts';

  @override
  String get notOnApp => 'not on the app';

  @override
  String get removeRecipient => 'Remove recipient';

  @override
  String get remove => 'Remove';

  @override
  String removeRecipientConfirm(String name) {
    return 'Remove $name from this list?';
  }

  @override
  String get couldNotAddRecipients => 'Could not add recipients.';

  @override
  String get couldNotRemoveRecipient => 'Could not remove recipient.';

  @override
  String get myStore => 'My Store';

  @override
  String get setUpYourStore => 'Set up your store';

  @override
  String get storeName => 'Store name';

  @override
  String get storeNameHint => 'e.g. Sharma Garments';

  @override
  String get category => 'Category';

  @override
  String get storeTagline => 'Tagline';

  @override
  String get taglineHint => 'One line about your store (optional)';

  @override
  String get storeLogo => 'Store logo';

  @override
  String get createStore => 'Create store';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get editStore => 'Edit store';

  @override
  String get couldNotSaveStore => 'Could not save store. Try again.';

  @override
  String get couldNotLoadStore => 'Could not load store.';

  @override
  String get catFashion => 'Fashion';

  @override
  String get catGrocery => 'Grocery';

  @override
  String get catElectronics => 'Electronics';

  @override
  String get catFood => 'Food';

  @override
  String get catHome => 'Home';

  @override
  String get catBeauty => 'Beauty';

  @override
  String get catServices => 'Services';

  @override
  String get catOther => 'Other';

  @override
  String get addProduct => 'Add product';

  @override
  String get editProduct => 'Edit product';

  @override
  String get productName => 'Product name';

  @override
  String get productNameHint => 'e.g. Cotton Kurta';

  @override
  String get price => 'Price';

  @override
  String get optional => 'Optional';

  @override
  String get description => 'Description';

  @override
  String get descriptionHint => 'Details, sizes, colours… (optional)';

  @override
  String get photos => 'Photos';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get inStock => 'In stock';

  @override
  String get outOfStock => 'Out of stock';

  @override
  String get available => 'Available';

  @override
  String get hide => 'Hide';

  @override
  String get unhide => 'Unhide';

  @override
  String deleteProductConfirm(String name) {
    return 'Delete \"$name\"? This can\'t be undone.';
  }

  @override
  String get productDeleted => 'Product deleted';

  @override
  String get couldNotSaveProduct => 'Could not save product. Try again.';

  @override
  String get couldNotDeleteProduct => 'Could not delete product.';

  @override
  String get noProductsYet => 'No products yet';

  @override
  String get addFirstProduct => 'Add your first product';

  @override
  String get couldNotLoadProducts => 'Could not load products.';

  @override
  String productsCount(int count) {
    return '$count products';
  }

  @override
  String get dmForPrice => 'Ask for price';

  @override
  String get enquire => 'Enquire';

  @override
  String get shareToChat => 'Share to chat';

  @override
  String get viewStore => 'View store';

  @override
  String get hiddenLabel => 'Hidden';

  @override
  String get couldNotLoadProduct => 'Could not load product.';

  @override
  String get storeHasNoProducts => 'This store has no products yet.';

  @override
  String get sharedAProduct => 'Shared a product';

  @override
  String get collections => 'Collections';

  @override
  String get manageCollections => 'Manage collections';

  @override
  String get newCollection => 'New collection';

  @override
  String get collectionName => 'Collection name';

  @override
  String get collectionNameHint => 'e.g. New Arrivals';

  @override
  String get createCollection => 'Create collection';

  @override
  String get renameCollection => 'Rename collection';

  @override
  String deleteCollectionConfirm(String name) {
    return 'Delete \"$name\"? Products stay, they\'re just removed from this collection.';
  }

  @override
  String get noCollectionsYet => 'No collections yet';

  @override
  String get addFirstCollection => 'Group your products into collections';

  @override
  String get couldNotSaveCollection => 'Could not save collection.';

  @override
  String get couldNotDeleteCollection => 'Could not delete collection.';

  @override
  String get couldNotLoadCollections => 'Could not load collections.';

  @override
  String get collectionsField => 'Collections';

  @override
  String get noneOption => 'None';

  @override
  String get allFilter => 'All';

  @override
  String get othersFilter => 'Others';

  @override
  String get storesTab => 'Stores';

  @override
  String get searchStores => 'Search stores';

  @override
  String get noStoresYet => 'No stores yet';

  @override
  String get noStoresFound => 'No stores match your search';

  @override
  String get couldNotLoadStores => 'Could not load stores.';

  @override
  String get details => 'Details';

  @override
  String get contactPermission => 'Contact Permission';

  @override
  String get contactPermissionDesc =>
      'Contact permission to allow sharing the broadcast';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get notificationPermissionDesc =>
      'Allow notification for getting instant updates';

  @override
  String get appLock => 'App Lock';

  @override
  String get appLockDesc => 'Use MFA to secure your app access';

  @override
  String get appLockUnavailable =>
      'No screen lock or biometrics set up on this device';

  @override
  String get permissionSettingsHint =>
      'You can change this permission from the app settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get cancel => 'Cancel';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get helpFeedback => 'Help & Feedback';

  @override
  String get shareInvite => 'Share & Invite';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get logout => 'Logout';

  @override
  String get sendMessage => 'Send Message';

  @override
  String get delete => 'Delete';

  @override
  String get editName => 'Edit Name';

  @override
  String get addMember => 'Add Member';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get unlock => 'Unlock';

  @override
  String get appLocked => 'Connect is locked';

  @override
  String get appLockedMessage =>
      'Unlock with your fingerprint, face, or device passcode to continue.';

  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';
}
