import 'package:connect/app/app_nav.dart';
import 'package:connect/app/locale_controller.dart';
import 'package:connect/firebase_options.dart';
import 'package:connect/l10n/app_localizations.dart';
import 'package:connect/module/auth/presentation/auth_gate.dart';
import 'package:connect/module/settings/application/settings_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_theme.dart';
import 'package:connect/network/remote_config_service.dart';
import 'package:connect/res/keys.dart';
import 'package:connect/services/notification_controller.dart';
import 'package:connect/services/push_service.dart';
import 'package:connect/utility/locale_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await RemoteConfigService.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final pushService = PushService();
  await pushService.init();

  final savedCode = await LocalePrefs.getLanguageCode();
  final initialLocale = Locale(savedCode ?? 'en');
  final settings = await SettingsPrefs.load();
  AppColors.isDark = settings.darkTheme;

  runApp(
    ProviderScope(
      overrides: [
        localeControllerProvider.overrideWith(() => LocaleController(initialLocale)),
        pushServiceProvider.overrideWithValue(pushService),
        settingsControllerProvider.overrideWith(() => SettingsController(settings)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);
    final dark = ref.watch(settingsControllerProvider.select((s) => s.darkTheme));
    AppColors.isDark = dark;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          key: ValueKey(dark),
          navigatorKey: navigatorKey,
          navigatorObservers: [appRouteObserver],
          title: 'Connect',
          debugShowCheckedModeBanner: false,
          theme: buildAppTheme(dark),
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const AuthGate(),
        );
      },
    );
  }
}
