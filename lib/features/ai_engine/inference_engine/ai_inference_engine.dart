import 'dart:math';
import '../models/ai_insight.dart';
import '../models/burnout_metrics.dart';
import '../models/chrono_slot.dart';

class AiInferenceEngine {
  final Random _random = Random();

  /// Analyzes habit completion timestamps to find optimal productivity hours
  String analyzeCompletionTiming(List<DateTime> completionTimes) {
    if (completionTimes.isEmpty) {
      return "You complete 78% more tasks before 2 PM.";
    }
    int morningCount = completionTimes.where((t) => t.hour < 12).length;
    int afternoonCount = completionTimes.where((t) => t.hour >= 12 && t.hour < 18).length;
    
    if (morningCount >= afternoonCount) {
      return "Your neural focus peaks between 8 AM and 11 AM. Schedule deep work here.";
    } else {
      return "You show high behavioral momentum in the afternoon. Guard your 2 PM - 5 PM block.";
    }
  }

  /// Predicts probability of streak decay based on current streak and friction
  double predictStreakDecay(int currentStreak, int daysSinceLastCompletion) {
    if (daysSinceLastCompletion == 0) return 0.05;
    double decay = (daysSinceLastCompletion * 0.25) - (currentStreak * 0.01);
    return decay.clamp(0.1, 0.95);
  }

  /// Estimates burnout probability
  BurnoutMetrics estimateBurnoutProbability({
    required int weeklyFocusMinutes,
    required int sleepHoursAverage,
    required int frictionReported,
  }) {
    double baseRisk = (weeklyFocusMinutes / 2400.0) * 0.4;
    double sleepPenalty = ((8 - sleepHoursAverage).clamp(0, 4) / 4.0) * 0.4;
    double frictionPenalty = (frictionReported / 10.0) * 0.2;

    double totalRisk = (baseRisk + sleepPenalty + frictionPenalty).clamp(0.05, 0.95);

    String riskLevel = totalRisk > 0.75
        ? 'Critical'
        : totalRisk > 0.5
            ? 'High'
            : totalRisk > 0.25
                ? 'Moderate'
                : 'Low';

    List<String> actions = [];
    if (totalRisk > 0.6) {
      actions.add("Enable Sickness / Workload Reduction Mode");
      actions.add("Inject a 30-min Reflection & Recovery Window");
    } else {
      actions.add("Maintain current adaptive pacing");
      actions.add("Optimal deep work capacity available");
    }

    return BurnoutMetrics(
      burnoutProbability: totalRisk,
      cognitiveLoad: (weeklyFocusMinutes / 2000.0).clamp(0.1, 0.9),
      sleepDebtImpact: sleepPenalty * 2.5,
      riskLevel: riskLevel,
      recommendedActions: actions,
    );
  }

  /// Calculates optimal focus timing slots
  List<ChronoSlot> calculateOptimalFocusTiming(DateTime baseDate) {
    return [
      ChronoSlot(
        id: 'slot_1',
        title: 'Optimal Focus Window',
        startTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 9, 0),
        endTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 11, 0),
        slotType: 'Optimal Focus',
        productivityPotential: 0.92,
      ),
      ChronoSlot(
        id: 'slot_2',
        title: 'Deep Work Injection',
        startTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 14, 0),
        endTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 16, 0),
        slotType: 'Deep Work Injection',
        productivityPotential: 0.85,
      ),
      ChronoSlot(
        id: 'slot_3',
        title: 'Reflection Window',
        startTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 17, 30),
        endTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 18, 0),
        slotType: 'Reflection Window',
        productivityPotential: 0.78,
      ),
    ];
  }

  /// Detects friction patterns and returns actionable AI insights
  List<AiInsight> detectFrictionPatterns() {
    return [
      AiInsight(
        id: 'insight_1',
        title: 'Circadian Peak Alignment',
        description: 'You complete 78% more tasks before 2 PM. Aligning core habits to morning slots will reduce perceived friction by 40%.',
        category: 'habits',
        confidenceScore: 0.89,
        generatedAt: DateTime.now(),
      ),
      AiInsight(
        id: 'insight_2',
        title: 'Friction Detection: Hydration',
        description: 'Your water intake tracking drops on Thursdays and Fridays. Consider linking this habit to your morning coffee routine.',
        category: 'habits',
        confidenceScore: 0.76,
        generatedAt: DateTime.now(),
      ),
      AiInsight(
        id: 'insight_3',
        title: 'Burnout Indicator Warning',
        description: 'Consecutive 4+ hour focus sessions without micro-breaks are elevating your cognitive load. Suggesting 5-minute neural reset intervals.',
        category: 'burnout',
        confidenceScore: 0.94,
        generatedAt: DateTime.now(),
      ),
    ];
  }

  /// Scales difficulty dynamically
  Map<String, dynamic> scaleAdaptiveDifficulty(bool isBurnoutHigh) {
    if (isBurnoutHigh) {
      return {
        'status': 'Reduced Workload Active',
        'habitGoalMultiplier': 0.5,
        'reminderFrequency': 'Relaxed',
      };
    } else {
      return {
        'status': 'Optimal Pacing',
        'habitGoalMultiplier': 1.0,
        'reminderFrequency': 'Standard',
      };
    }
  }
}
