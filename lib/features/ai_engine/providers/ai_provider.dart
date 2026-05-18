import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../core/utils/logger.dart';
import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';
import '../repositories/ai_repository.dart';
import '../services/ai_engine_service.dart';

import '../../focus/application/providers/focus_providers.dart';

final aiRepositoryProvider = Provider<AiRepository>((ref) {
  return AiRepository();
});

final aiEngineServiceProvider = Provider<AiEngineService>((ref) {
  return AiEngineService(
    ref.watch(aiRepositoryProvider),
    ref.watch(appConfigProvider),
    ref.watch(appLoggerProvider),
  );
});

final aiInsightsProvider = FutureProvider<List<AiInsight>>((ref) async {
  final service = ref.watch(aiEngineServiceProvider);
  return service.fetchInsights();
});

final burnoutMetricsProvider = FutureProvider<BurnoutMetrics>((ref) async {
  final service = ref.watch(aiEngineServiceProvider);
  final focusSessions = ref.watch(completedFocusSessionsProvider).value ?? [];
  final now = DateTime.now();
  final weeklySessions = focusSessions.where((s) => s.startTime.isAfter(now.subtract(const Duration(days: 7))));
  final weeklyFocusMinutes = weeklySessions.fold<int>(0, (sum, s) => sum + s.completedMinutes);

  return service.calculateBurnout(
    weeklyFocusMinutes: weeklyFocusMinutes,
    sleepHoursAverage: 7,
    frictionReported: weeklyFocusMinutes < 120 ? 2 : 1,
  );
});

final chronoSlotsProvider = FutureProvider.family<List<ChronoSlot>, DateTime>((ref, date) async {
  final service = ref.watch(aiEngineServiceProvider);
  return service.fetchScheduleSlots(date);
});
