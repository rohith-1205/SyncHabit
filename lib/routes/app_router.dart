import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_screen.dart';
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
import '../shared/widgets/bottom_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/hub', builder: (context, state) => const HubScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/stats', builder: (context, state) => const StatsScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/focus', builder: (context, state) => const FocusScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/duels', builder: (context, state) => const DuelsScreen())]),
        StatefulShellBranch(routes: [GoRoute(path: '/pro', builder: (context, state) => const ProScreen())]),
      ],
    ),
  ],
);
