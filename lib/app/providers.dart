/// Centralized Provider Registration for SyncHabit.
/// Organizes and exports all Riverpod providers across the application layers.
/// 
/// Prepared for future Supabase, Firebase, Isar, RevenueCat, and AI API integrations.

// 1. Core Service Providers
export '../core/config/app_config.dart' show appConfigProvider;
export '../core/utils/logger.dart' show appLoggerProvider;
export '../core/network/connectivity_service.dart' show connectivityServiceProvider;
export '../core/network/api_client.dart' show apiClientProvider;
export '../core/services/payment_service.dart' show paymentServiceProvider;
export '../core/services/notification_service.dart' show notificationServiceProvider;
export '../core/analytics/analytics_service.dart' show analyticsServiceProvider;
export '../core/services/firebase_providers.dart' show firebaseAuthProvider, firebaseFirestoreProvider, googleSignInProvider;

// 2. DataSource Providers
export '../features/habits/application/providers/habit_providers.dart' show habitLocalDataSourceProvider;

// 3. Repository Providers
export '../features/auth/providers/auth_provider.dart' show authRepositoryProvider;
export '../features/ai_engine/providers/ai_provider.dart' show aiRepositoryProvider;
export '../features/habits/application/providers/habit_providers.dart' show habitRepositoryInterfaceProvider, habitRepositoryProvider;

// 4. Service & UseCase Providers
export '../features/ai_engine/providers/ai_provider.dart' show aiEngineServiceProvider, aiInsightsProvider, burnoutMetricsProvider, chronoSlotsProvider;
export '../features/habits/application/providers/habit_providers.dart' show getHabitsUseCaseProvider, toggleHabitUseCaseProvider, createHabitUseCaseProvider, deleteHabitUseCaseProvider;

// 5. Controller & StateNotifier Providers
export '../features/auth/providers/auth_provider.dart' show authNotifierProvider, currentUserProvider;
export '../features/habits/application/providers/habit_providers.dart' show habitNotifierProvider;
