import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/config/flavor_config.dart';
import '../core/theme/app_theme.dart';
import '../routes/app_router.dart';
import '../l10n/app_localizations.dart';

class SyncHabitApp extends ConsumerWidget {
  const SyncHabitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: FlavorConfig.instance.appName,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
    );
  }
}

Future<void> bootstrap(Flavor flavor, String appName, String packageName, String apiEndpoint) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Flavor
  FlavorConfig.initialize(
    flavor: flavor,
    appName: appName,
    packageName: packageName,
    apiEndpoint: apiEndpoint,
  );

  // Initialize Storage / Services gracefully
  // Catch any native exceptions if Firebase/SharedPreferences aren't linked in simulator
  try {
    // SharedPreferences / Hive init
  } catch (e) {
    debugPrint('Storage init warning: $e');
  }

  runApp(
    const ProviderScope(
      child: SyncHabitApp(),
    ),
  );
}
