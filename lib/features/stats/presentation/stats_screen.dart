import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';
import '../../ai_engine/providers/ai_provider.dart';
import '../../habits/providers/habit_provider.dart';
import '../../tasks/application/providers/task_providers.dart';
import '../../tasks/domain/entities/task_entity.dart';
import '../../focus/application/providers/focus_providers.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({super.key});

  @override
  ConsumerState<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen> {
  int _selectedWeeksAgo = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final burnoutState = ref.watch(burnoutMetricsProvider);
    final habitsState = ref.watch(habitNotifierProvider);
    final tasksState = ref.watch(taskNotifierProvider);
    final focusState = ref.watch(completedFocusSessionsProvider);
    final habitCompletionsState = ref.watch(habitCompletionsProvider);
    final isPro = user?.isPro ?? false;

    // Actual lists from providers
    final habits = habitsState.value ?? [];
    final tasks = tasksState.value ?? [];
    final focusSessions = focusState.value ?? [];
    final habitCompletions = habitCompletionsState.value ?? [];

    // Calculate real-time stats from actual data
    final totalHabits = habits.length;
    final completedTodayHabits = habits.where((h) => h.isCompletedToday).length;
    final maxStreak = habits.isEmpty
        ? 0
        : habits.map((h) => h.streakCount).fold(0, (a, b) => a > b ? a : b);

    final totalTasks = tasks.length;
    final completedTasks =
        tasks.where((t) => t.state == TaskState.completed).length;

    // Real Consistency Score
    final double habitRate =
        totalHabits > 0 ? completedTodayHabits / totalHabits : 1.0;
    final double taskRate = totalTasks > 0 ? completedTasks / totalTasks : 1.0;
    final double consistencyScore =
        ((habitRate * 0.5 + taskRate * 0.5) * 100.0).clamp(0.0, 100.0);

    // Real Weekly Completion Trends (Filtered by Week Offset)
    final now = DateTime.now();
    final referenceDate = now.subtract(Duration(days: _selectedWeeksAgo * 7));
    final weekDays = AppDateUtils.getWeekDays(referenceDate);
    final List<FlSpot> weeklySpots = [];
    final List<String> dayLabels = [];
    double maxVal = 0.0;

    for (int i = 0; i < 7; i++) {
      final day = weekDays[i];
      final monthStr = day.month.toString().padLeft(2, '0');
      final dayStr = day.day.toString().padLeft(2, '0');
      dayLabels.add('$dayStr/$monthStr');

      int tasksCompletedOnDay = tasks.where((t) {
        if (t.state != TaskState.completed) return false;
        final d = t.completedAt ?? t.updatedAt;
        return AppDateUtils.isSameDay(d, day);
      }).length;

      int focusCompletedOnDay = focusSessions.where((s) {
        if (!s.isCompleted) return false;
        final d = s.startTime;
        return AppDateUtils.isSameDay(d, day);
      }).length;

      int habitsCompletedOnDay = habitCompletions.where((hc) {
        final d = hc.completedAt;
        return AppDateUtils.isSameDay(d, day);
      }).length;

      double val = tasksCompletedOnDay.toDouble() +
          focusCompletedOnDay.toDouble() +
          habitsCompletedOnDay.toDouble();
      if (val > maxVal) maxVal = val;
      weeklySpots.add(FlSpot(i.toDouble(), val));
    }

    // Real Time-of-Day Friction Heatmap Analysis
    int morningCompleted = 0;
    int afternoonCompleted = 0;
    int eveningCompleted = 0;

    for (final t in tasks.where((t) => t.state == TaskState.completed)) {
      final h = (t.updatedAt ?? t.dueDate ?? t.createdAt).hour;
      if (h >= 6 && h < 12) {
        morningCompleted++;
      } else if (h >= 12 && h < 18)
        afternoonCompleted++;
      else
        eveningCompleted++;
    }

    for (final s in focusSessions.where((s) => s.isCompleted)) {
      final h = s.startTime.hour;
      if (h >= 6 && h < 12) {
        morningCompleted++;
      } else if (h >= 12 && h < 18)
        afternoonCompleted++;
      else
        eveningCompleted++;
    }

    final totalDayCompletions =
        morningCompleted + afternoonCompleted + eveningCompleted;
    final morningRate = totalDayCompletions > 0
        ? (morningCompleted / totalDayCompletions * 100).toInt()
        : 0;
    final afternoonRate = totalDayCompletions > 0
        ? (afternoonCompleted / totalDayCompletions * 100).toInt()
        : 0;
    final eveningRate = totalDayCompletions > 0
        ? (eveningCompleted / totalDayCompletions * 100).toInt()
        : 0;

    return Scaffold(
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.pinkNeon.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(
                      color: ColorConstants.pinkNeon.withOpacity(0.3),
                      blurRadius: 120)
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text('BEHAVIORAL ANALYTICS',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 8),
                    Text('Real-time neural consistency & momentum diagnostics',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 24),

                    // Pro tier lock toggle / indicator
                    if (!isPro)
                      NeonCard(
                        isGlowing: true,
                        glowColor: ColorConstants.blueGlow,
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Icon(Icons.lock_outline,
                                color: ColorConstants.blueGlow),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('7-Day History Active (Free Tier)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(
                                      'Upgrade to Pro to unlock unlimited analytics history & burnout AI.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Consistency Score & Streak Metrics
                    Row(
                      children: [
                        Expanded(
                          child: NeonCard(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CONSISTENCY SCORE',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                const SizedBox(height: 12),
                                Text('${consistencyScore.toStringAsFixed(1)}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                            color: ColorConstants.success,
                                            fontWeight: FontWeight.w800)),
                                const SizedBox(height: 4),
                                Text(
                                    totalTasks > 0 || totalHabits > 0
                                        ? 'Live synchronized data'
                                        : 'Add tasks to start tracking',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            color: ColorConstants.success)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: NeonCard(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('STREAK METRICS',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                const SizedBox(height: 12),
                                Text('$maxStreak Days',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                            color: ColorConstants.pinkNeon,
                                            fontWeight: FontWeight.w800)),
                                const SizedBox(height: 4),
                                Text('Active habits tracked: $totalHabits',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            color: ColorConstants.textMuted)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Burnout Predictor AI Card
                    Text('BURNOUT PREDICTOR AI',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    burnoutState.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (e, st) => NeonCard(child: Text('Error: $e')),
                      data: (burnout) {
                        Color riskColor = ColorConstants.success;
                        if (burnout.riskLevel == 'Moderate')
                          riskColor = ColorConstants.warning;
                        if (burnout.riskLevel == 'High' ||
                            burnout.riskLevel == 'Critical')
                          riskColor = ColorConstants.danger;

                        return NeonCard(
                          isGlowing: burnout.riskLevel == 'High' ||
                              burnout.riskLevel == 'Critical',
                          glowColor: riskColor,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'BURNOUT RISK: ${burnout.riskLevel.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: riskColor)),
                                  Icon(Icons.warning_amber_rounded,
                                      color: riskColor),
                                ],
                              ),
                              const SizedBox(height: 16),
                              LinearProgressIndicator(
                                value: burnout.burnoutProbability,
                                backgroundColor: ColorConstants.cardSurface,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(riskColor),
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              const SizedBox(height: 20),
                              Text('AI RECOMMENDATION:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: ColorConstants.textSecondary)),
                              const SizedBox(height: 8),
                              ...burnout.recommendedActions
                                  .map((action) => Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.arrow_right_alt,
                                                color:
                                                    ColorConstants.neonViolet,
                                                size: 16),
                                            const SizedBox(width: 8),
                                            Expanded(
                                                child: Text(action,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium)),
                                          ],
                                        ),
                                      )),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    // Smooth Neon Line Chart Header with Week Filter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'WEEKLY COMPLETION TRENDS',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: ColorConstants.cardSurface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color:
                                    ColorConstants.neonViolet.withOpacity(0.3)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: _selectedWeeksAgo,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: ColorConstants.neonViolet),
                              dropdownColor: ColorConstants.bgLight,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: ColorConstants.neonViolet),
                              items: const [
                                DropdownMenuItem(
                                    value: 0, child: Text('This Week')),
                                DropdownMenuItem(
                                    value: 1, child: Text('Last Week')),
                                DropdownMenuItem(
                                    value: 2, child: Text('2 Weeks Ago')),
                                DropdownMenuItem(
                                    value: 3, child: Text('3 Weeks Ago')),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _selectedWeeksAgo = val;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    NeonCard(
                      padding: const EdgeInsets.all(24),
                      height: 280,
                      child: LineChart(
                        LineChartData(
                          minY: 0,
                          maxY: maxVal > 0 ? maxVal * 1.2 : 5.0,
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                                color:
                                    ColorConstants.textMuted.withOpacity(0.1),
                                strokeWidth: 1),
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  final idx = value.toInt();
                                  if (idx >= 0 && idx < dayLabels.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(dayLabels[idx],
                                          style: const TextStyle(
                                              color: ColorConstants.textMuted,
                                              fontSize: 12)),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: weeklySpots,
                              isCurved: true,
                              preventCurveOverShooting: true,
                              curveSmoothness: 0.2,
                              gradient: ColorConstants.violetPinkGradient,
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter:
                                    (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                  radius: 6,
                                  color: ColorConstants.pinkNeon,
                                  strokeWidth: 2,
                                  strokeColor: ColorConstants.textPrimary,
                                ),
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    ColorConstants.neonViolet.withOpacity(0.3),
                                    ColorConstants.pinkNeon.withOpacity(0.0)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Friction Heatmap & Mood Correlation
                    Text('FRICTION HEATMAP & MOOD CORRELATION',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    NeonCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Morning Alignment (6 AM - 12 PM)',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                  totalDayCompletions == 0
                                      ? 'No Data'
                                      : '$morningCompleted items ($morningRate%)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: morningRate > 30
                                              ? ColorConstants.success
                                              : ColorConstants.warning,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Afternoon Execution (12 PM - 6 PM)',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                  totalDayCompletions == 0
                                      ? 'No Data'
                                      : '$afternoonCompleted items ($afternoonRate%)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: afternoonRate > 30
                                              ? ColorConstants.success
                                              : ColorConstants.warning,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Evening Recovery (6 PM - 12 AM)',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                  totalDayCompletions == 0
                                      ? 'No Data'
                                      : '$eveningCompleted items ($eveningRate%)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: eveningRate > 30
                                              ? ColorConstants.blueGlow
                                              : ColorConstants.warning,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120), // Bottom nav space
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
