import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';
import '../repositories/ai_repository.dart';

class AiEngineService {
  final AiRepository _repository;

  AiEngineService({AiRepository? repository}) : _repository = repository ?? AiRepository();

  Future<List<AiInsight>> fetchInsights() => _repository.getInsights();

  Future<BurnoutMetrics> calculateBurnout({
    required int weeklyFocusMinutes,
    required int sleepHoursAverage,
    required int frictionReported,
  }) => _repository.getBurnoutMetrics(
    weeklyFocusMinutes: weeklyFocusMinutes,
    sleepHoursAverage: sleepHoursAverage,
    frictionReported: frictionReported,
  );

  Future<List<ChronoSlot>> fetchScheduleSlots(DateTime date) => _repository.getChronoSlots(date);

  Future<String> getTimingAnalysis(List<DateTime> times) => _repository.getCompletionTimingInsight(times);
}
