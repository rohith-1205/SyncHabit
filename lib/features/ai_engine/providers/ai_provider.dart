import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';
import '../services/ai_engine_service.dart';

final aiEngineServiceProvider = Provider<AiEngineService>((ref) {
  return AiEngineService();
});

final aiInsightsProvider = FutureProvider<List<AiInsight>>((ref) async {
  final service = ref.watch(aiEngineServiceProvider);
  return service.fetchInsights();
});

final burnoutMetricsProvider = FutureProvider<BurnoutMetrics>((ref) async {
  final service = ref.watch(aiEngineServiceProvider);
  return service.calculateBurnout(
    weeklyFocusMinutes: 1850,
    sleepHoursAverage: 6,
    frictionReported: 4,
  );
});

final chronoSlotsProvider = FutureProvider.family<List<ChronoSlot>, DateTime>((ref, date) async {
  final service = ref.watch(aiEngineServiceProvider);
  return service.fetchScheduleSlots(date);
});
