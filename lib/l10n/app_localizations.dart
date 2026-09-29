import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Build Connection Using Connect'**
  String get tagline;

  /// No description provided for @connections.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connections;

  /// No description provided for @noConnectionsYet.
  ///
  /// In en, this message translates to:
  /// **'No connections yet'**
  String get noConnectionsYet;

  /// No description provided for @couldNotLoadChats.
  ///
  /// In en, this message translates to:
  /// **'Could not load chats'**
  String get couldNotLoadChats;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @enterNumberToLogin.
  ///
  /// In en, this message translates to:
  /// **'Enter number to login'**
  String get enterNumberToLogin;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @invalidMobile.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit mobile number'**
  String get invalidMobile;

  /// No description provided for @verifyOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtpTitle;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent an OTP on {phone}'**
  String otpSentTo(String phone);

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP'**
  String get enterOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @resendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in {seconds}'**
  String resendOtpIn(String seconds);

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @secureAndPrivate.
  ///
  /// In en, this message translates to:
  /// **'Secure & Private'**
  String get secureAndPrivate;

  /// No description provided for @otpConfidential.
  ///
  /// In en, this message translates to:
  /// **'Your OTP is confidential. Don\'t share it with anyone'**
  String get otpConfidential;

  /// No description provided for @secureCommunication.
  ///
  /// In en, this message translates to:
  /// **'Secure Communication'**
  String get secureCommunication;

  /// No description provided for @builtForBusiness.
  ///
  /// In en, this message translates to:
  /// **'Built For Business'**
  String get builtForBusiness;

  /// No description provided for @yourDataProtected.
  ///
  /// In en, this message translates to:
  /// **'Your Data Is Protected'**
  String get yourDataProtected;

  /// No description provided for @byContinuing.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our'**
  String get byContinuing;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfService;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get hindi;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @broadcast.
  ///
  /// In en, this message translates to:
  /// **'Broadcast'**
  String get broadcast;

  /// No description provided for @selectContacts.
  ///
  /// In en, this message translates to:
  /// **'Select Contacts'**
  String get selectContacts;

  /// No description provided for @searchByNameNumber.
  ///
  /// In en, this message translates to:
  /// **'Search by name & number'**
  String get searchByNameNumber;

  /// No description provided for @newContact.
  ///
  /// In en, this message translates to:
  /// **'New Contact'**
  String get newContact;

  /// No description provided for @addNewContact.
  ///
  /// In en, this message translates to:
  /// **'Add New Contact'**
  String get addNewContact;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberHint;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @noBroadcastYet.
  ///
  /// In en, this message translates to:
  /// **'No Broadcast Started Yet'**
  String get noBroadcastYet;

  /// No description provided for @startBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Start Broadcast'**
  String get startBroadcast;

  /// No description provided for @broadcastName.
  ///
  /// In en, this message translates to:
  /// **'Broadcast Name'**
  String get broadcastName;

  /// No description provided for @broadcastListsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load broadcast lists'**
  String get broadcastListsLoadError;

  /// No description provided for @noBroadcastListsYet.
  ///
  /// In en, this message translates to:
  /// **'No broadcast lists yet'**
  String get noBroadcastListsYet;

  /// No description provided for @tapPlusToCreate.
  ///
  /// In en, this message translates to:
  /// **'Tap + to create one'**
  String get tapPlusToCreate;

  /// No description provided for @recipientsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} recipients'**
  String recipientsCount(int count);

  /// No description provided for @nameThisList.
  ///
  /// In en, this message translates to:
  /// **'Name this list'**
  String get nameThisList;

  /// No description provided for @listNameHintExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. Regulars ({count} contacts)'**
  String listNameHintExample(int count);

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @couldNotCreateList.
  ///
  /// In en, this message translates to:
  /// **'Could not create list.'**
  String get couldNotCreateList;

  /// No description provided for @broadcastListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Broadcast list'**
  String get broadcastListSubtitle;

  /// No description provided for @manageRecipients.
  ///
  /// In en, this message translates to:
  /// **'Manage recipients'**
  String get manageRecipients;

  /// No description provided for @renameList.
  ///
  /// In en, this message translates to:
  /// **'Rename list'**
  String get renameList;

  /// No description provided for @deleteList.
  ///
  /// In en, this message translates to:
  /// **'Delete list'**
  String get deleteList;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @couldNotRenameList.
  ///
  /// In en, this message translates to:
  /// **'Could not rename list.'**
  String get couldNotRenameList;

  /// No description provided for @deleteListConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? This removes the list and its history. Recipients keep messages already sent.'**
  String deleteListConfirm(String name);

  /// No description provided for @couldNotDeleteList.
  ///
  /// In en, this message translates to:
  /// **'Could not delete list.'**
  String get couldNotDeleteList;

  /// No description provided for @couldNotLoadMessages.
  ///
  /// In en, this message translates to:
  /// **'Could not load messages'**
  String get couldNotLoadMessages;

  /// No description provided for @sendFirstBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Send your first broadcast'**
  String get sendFirstBroadcast;

  /// No description provided for @couldNotSendBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Could not send broadcast.'**
  String get couldNotSendBroadcast;

  /// No description provided for @recipients.
  ///
  /// In en, this message translates to:
  /// **'Recipients'**
  String get recipients;

  /// No description provided for @couldNotLoadRecipients.
  ///
  /// In en, this message translates to:
  /// **'Could not load recipients'**
  String get couldNotLoadRecipients;

  /// No description provided for @noRecipientsYet.
  ///
  /// In en, this message translates to:
  /// **'No recipients yet'**
  String get noRecipientsYet;

  /// No description provided for @tapAddToInclude.
  ///
  /// In en, this message translates to:
  /// **'Tap Add to include contacts'**
  String get tapAddToInclude;

  /// No description provided for @notOnApp.
  ///
  /// In en, this message translates to:
  /// **'not on the app'**
  String get notOnApp;

  /// No description provided for @removeRecipient.
  ///
  /// In en, this message translates to:
  /// **'Remove recipient'**
  String get removeRecipient;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @removeRecipientConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from this list?'**
  String removeRecipientConfirm(String name);

  /// No description provided for @couldNotAddRecipients.
  ///
  /// In en, this message translates to:
  /// **'Could not add recipients.'**
  String get couldNotAddRecipients;

  /// No description provided for @couldNotRemoveRecipient.
  ///
  /// In en, this message translates to:
  /// **'Could not remove recipient.'**
  String get couldNotRemoveRecipient;

  /// No description provided for @myStore.
  ///
  /// In en, this message translates to:
  /// **'My Store'**
  String get myStore;

  /// No description provided for @setUpYourStore.
  ///
  /// In en, this message translates to:
  /// **'Set up your store'**
  String get setUpYourStore;

  /// No description provided for @storeName.
  ///
  /// In en, this message translates to:
  /// **'Store name'**
  String get storeName;

  /// No description provided for @storeNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Sharma Garments'**
  String get storeNameHint;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @storeTagline.
  ///
  /// In en, this message translates to:
  /// **'Tagline'**
  String get storeTagline;

  /// No description provided for @taglineHint.
  ///
  /// In en, this message translates to:
  /// **'One line about your store (optional)'**
  String get taglineHint;

  /// No description provided for @storeLogo.
  ///
  /// In en, this message translates to:
  /// **'Store logo'**
  String get storeLogo;

  /// No description provided for @createStore.
  ///
  /// In en, this message translates to:
  /// **'Create store'**
  String get createStore;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @editStore.
  ///
  /// In en, this message translates to:
  /// **'Edit store'**
  String get editStore;

  /// No description provided for @couldNotSaveStore.
  ///
  /// In en, this message translates to:
  /// **'Could not save store. Try again.'**
  String get couldNotSaveStore;

  /// No description provided for @couldNotLoadStore.
  ///
  /// In en, this message translates to:
  /// **'Could not load store.'**
  String get couldNotLoadStore;

  /// No description provided for @catFashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get catFashion;

  /// No description provided for @catGrocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get catGrocery;

  /// No description provided for @catElectronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get catElectronics;

  /// No description provided for @catFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get catFood;

  /// No description provided for @catHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get catHome;

  /// No description provided for @catBeauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get catBeauty;

  /// No description provided for @catServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get catServices;

  /// No description provided for @catOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get catOther;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get editProduct;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @productNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Cotton Kurta'**
  String get productNameHint;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Details, sizes, colours… (optional)'**
  String get descriptionHint;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get inStock;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get outOfStock;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @unhide.
  ///
  /// In en, this message translates to:
  /// **'Unhide'**
  String get unhide;

  /// No description provided for @deleteProductConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? This can\'t be undone.'**
  String deleteProductConfirm(String name);

  /// No description provided for @productDeleted.
  ///
  /// In en, this message translates to:
  /// **'Product deleted'**
  String get productDeleted;

  /// No description provided for @couldNotSaveProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not save product. Try again.'**
  String get couldNotSaveProduct;

  /// No description provided for @couldNotDeleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not delete product.'**
  String get couldNotDeleteProduct;

  /// No description provided for @noProductsYet.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get noProductsYet;

  /// No description provided for @addFirstProduct.
  ///
  /// In en, this message translates to:
  /// **'Add your first product'**
  String get addFirstProduct;

  /// No description provided for @couldNotLoadProducts.
  ///
  /// In en, this message translates to:
  /// **'Could not load products.'**
  String get couldNotLoadProducts;

  /// No description provided for @productsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} products'**
  String productsCount(int count);

  /// No description provided for @dmForPrice.
  ///
  /// In en, this message translates to:
  /// **'Ask for price'**
  String get dmForPrice;

  /// No description provided for @enquire.
  ///
  /// In en, this message translates to:
  /// **'Enquire'**
  String get enquire;

  /// No description provided for @shareToChat.
  ///
  /// In en, this message translates to:
  /// **'Share to chat'**
  String get shareToChat;

  /// No description provided for @viewStore.
  ///
  /// In en, this message translates to:
  /// **'View store'**
  String get viewStore;

  /// No description provided for @hiddenLabel.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get hiddenLabel;

  /// No description provided for @couldNotLoadProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not load product.'**
  String get couldNotLoadProduct;

  /// No description provided for @storeHasNoProducts.
  ///
  /// In en, this message translates to:
  /// **'This store has no products yet.'**
  String get storeHasNoProducts;

  /// No description provided for @sharedAProduct.
  ///
  /// In en, this message translates to:
  /// **'Shared a product'**
  String get sharedAProduct;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @manageCollections.
  ///
  /// In en, this message translates to:
  /// **'Manage collections'**
  String get manageCollections;

  /// No description provided for @newCollection.
  ///
  /// In en, this message translates to:
  /// **'New collection'**
  String get newCollection;

  /// No description provided for @collectionName.
  ///
  /// In en, this message translates to:
  /// **'Collection name'**
  String get collectionName;

  /// No description provided for @collectionNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. New Arrivals'**
  String get collectionNameHint;

  /// No description provided for @createCollection.
  ///
  /// In en, this message translates to:
  /// **'Create collection'**
  String get createCollection;

  /// No description provided for @renameCollection.
  ///
  /// In en, this message translates to:
  /// **'Rename collection'**
  String get renameCollection;

  /// No description provided for @deleteCollectionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? Products stay, they\'re just removed from this collection.'**
  String deleteCollectionConfirm(String name);

  /// No description provided for @noCollectionsYet.
  ///
  /// In en, this message translates to:
  /// **'No collections yet'**
  String get noCollectionsYet;

  /// No description provided for @addFirstCollection.
  ///
  /// In en, this message translates to:
  /// **'Group your products into collections'**
  String get addFirstCollection;

  /// No description provided for @couldNotSaveCollection.
  ///
  /// In en, this message translates to:
  /// **'Could not save collection.'**
  String get couldNotSaveCollection;

  /// No description provided for @couldNotDeleteCollection.
  ///
  /// In en, this message translates to:
  /// **'Could not delete collection.'**
  String get couldNotDeleteCollection;

  /// No description provided for @couldNotLoadCollections.
  ///
  /// In en, this message translates to:
  /// **'Could not load collections.'**
  String get couldNotLoadCollections;

  /// No description provided for @collectionsField.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collectionsField;

  /// No description provided for @noneOption.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get noneOption;

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @othersFilter.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get othersFilter;

  /// No description provided for @storesTab.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get storesTab;

  /// No description provided for @searchStores.
  ///
  /// In en, this message translates to:
  /// **'Search stores'**
  String get searchStores;

  /// No description provided for @noStoresYet.
  ///
  /// In en, this message translates to:
  /// **'No stores yet'**
  String get noStoresYet;

  /// No description provided for @noStoresFound.
  ///
  /// In en, this message translates to:
  /// **'No stores match your search'**
  String get noStoresFound;

  /// No description provided for @couldNotLoadStores.
  ///
  /// In en, this message translates to:
  /// **'Could not load stores.'**
  String get couldNotLoadStores;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @contactPermission.
  ///
  /// In en, this message translates to:
  /// **'Contact Permission'**
  String get contactPermission;

  /// No description provided for @contactPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Contact permission to allow sharing the broadcast'**
  String get contactPermissionDesc;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermission;

  /// No description provided for @notificationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow notification for getting instant updates'**
  String get notificationPermissionDesc;

  /// No description provided for @appLock.
  ///
  /// In en, this message translates to:
  /// **'App Lock'**
  String get appLock;

  /// No description provided for @appLockDesc.
  ///
  /// In en, this message translates to:
  /// **'Use MFA to secure your app access'**
  String get appLockDesc;

  /// No description provided for @appLockUnavailable.
  ///
  /// In en, this message translates to:
  /// **'No screen lock or biometrics set up on this device'**
  String get appLockUnavailable;

  /// No description provided for @permissionSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'You can change this permission from the app settings.'**
  String get permissionSettingsHint;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @helpFeedback.
  ///
  /// In en, this message translates to:
  /// **'Help & Feedback'**
  String get helpFeedback;

  /// No description provided for @shareInvite.
  ///
  /// In en, this message translates to:
  /// **'Share & Invite'**
  String get shareInvite;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @editName.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get editName;

  /// No description provided for @addMember.
  ///
  /// In en, this message translates to:
  /// **'Add Member'**
  String get addMember;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @appLocked.
  ///
  /// In en, this message translates to:
  /// **'Connect is locked'**
  String get appLocked;

  /// No description provided for @appLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Unlock with your fingerprint, face, or device passcode to continue.'**
  String get appLockedMessage;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
