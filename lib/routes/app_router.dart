import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/providers/auth_provider.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/habits/presentation/hub_screen.dart';
import '../features/stats/presentation/stats_screen.dart';
import '../features/focus/presentation/focus_screen.dart';
import '../features/chrono/presentation/chrono_screen.dart';
import '../features/neuro/presentation/neuro_screen.dart';
import '../features/safe/presentation/safe_screen.dart';
import '../features/retro/presentation/retro_screen.dart';
import '../features/premium/presentation/pro_screen.dart';
import '../features/duels/presentation/duels_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/planner/presentation/today_planner_screen.dart';
import '../features/projects/presentation/projects_screen.dart';
import '../shared/widgets/bottom_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/onboarding',
    redirect: (context, state) {
      final isLoggedIn = authState.hasValue && authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/onboarding';

      if (!isLoggedIn && !isLoggingIn) {
        return '/onboarding';
      }
      if (isLoggedIn && isLoggingIn) {
        return '/planner';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/chrono',
        builder: (context, state) => const ChronoScreen(),
      ),
      GoRoute(
        path: '/neuro',
        builder: (context, state) => const NeuroScreen(),
      ),
      GoRoute(
        path: '/safe',
        builder: (context, state) => const SafeScreen(),
      ),
      GoRoute(
        path: '/retro',
        builder: (context, state) => const RetroScreen(),
      ),
      GoRoute(
        path: '/hub',
        builder: (context, state) => const HubScreen(),
      ),
      GoRoute(
        path: '/duels',
        builder: (context, state) => const DuelsScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [GoRoute(path: '/planner', builder: (context, state) => const TodayPlannerScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/projects', builder: (context, state) => const ProjectsScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/focus', builder: (context, state) => const FocusScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/stats', builder: (context, state) => const StatsScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/pro', builder: (context, state) => const ProScreen())]),
        ],
      ),
    ],
  );
});

// Keep legacy appRouter for backward compatibility if any non-riverpod place imports it
final appRouter = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'legacy_root'),
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/chrono',
      builder: (context, state) => const ChronoScreen(),
    ),
    GoRoute(
      path: '/neuro',
      builder: (context, state) => const NeuroScreen(),
    ),
    GoRoute(
      path: '/safe',
      builder: (context, state) => const SafeScreen(),
    ),
    GoRoute(
      path: '/retro',
      builder: (context, state) => const RetroScreen(),
    ),
    GoRoute(
      path: '/hub',
      builder: (context, state) => const HubScreen(),
    ),
    GoRoute(
      path: '/duels',
      builder: (context, state) => const DuelsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/planner', builder: (context, state) => const TodayPlannerScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/projects', builder: (context, state) => const ProjectsScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/focus', builder: (context, state) => const FocusScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/stats', builder: (context, state) => const StatsScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/pro', builder: (context, state) => const ProScreen())]),
      ],
    ),
  ],
);

