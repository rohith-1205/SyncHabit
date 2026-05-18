import '../../../core/config/app_config.dart';
import '../../../core/utils/logger.dart';
import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';
import '../repositories/ai_repository.dart';

class AiEngineService {
  final AiRepository _repository;
  final AppConfig _config;
  final AppLogger _logger;

  AiEngineService(this._repository, this._config, this._logger);

  Future<List<AiInsight>> fetchInsights() {
    _logger.info('Fetching AI Insights from ${_config.apiBaseUrl}');
    return _repository.getInsights();
  }

  Future<BurnoutMetrics> calculateBurnout({
    required int weeklyFocusMinutes,
    required int sleepHoursAverage,
    required int frictionReported,
  }) {
    _logger.info('Calculating burnout metrics in ${_config.environment.name} mode');
    return _repository.getBurnoutMetrics(
      weeklyFocusMinutes: weeklyFocusMinutes,
      sleepHoursAverage: sleepHoursAverage,
      frictionReported: frictionReported,
    );
  }

  Future<List<ChronoSlot>> fetchScheduleSlots(DateTime date) {
    _logger.info('Fetching schedule slots for $date');
    return _repository.getChronoSlots(date);
  }

  Future<String> getTimingAnalysis(List<DateTime> times) {
    _logger.info('Analyzing completion timing');
    return _repository.getCompletionTimingInsight(times);
  }
}
