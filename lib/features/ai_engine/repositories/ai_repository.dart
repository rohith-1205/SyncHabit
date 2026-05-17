import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';
import '../inference_engine/ai_inference_engine.dart';

class AiRepository {
  final AiInferenceEngine _engine;

  AiRepository({AiInferenceEngine? engine}) : _engine = engine ?? AiInferenceEngine();

  Future<List<AiInsight>> getInsights() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _engine.detectFrictionPatterns();
  }

  Future<BurnoutMetrics> getBurnoutMetrics({
    required int weeklyFocusMinutes,
    required int sleepHoursAverage,
    required int frictionReported,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _engine.estimateBurnoutProbability(
      weeklyFocusMinutes: weeklyFocusMinutes,
      sleepHoursAverage: sleepHoursAverage,
      frictionReported: frictionReported,
    );
  }

  Future<List<ChronoSlot>> getChronoSlots(DateTime date) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _engine.calculateOptimalFocusTiming(date);
  }

  Future<String> getCompletionTimingInsight(List<DateTime> times) async {
    return _engine.analyzeCompletionTiming(times);
  }
}
