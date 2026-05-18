import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/planner_item.dart';
import '../../../tasks/application/providers/task_providers.dart';
import '../../../tasks/domain/entities/task_entity.dart';
import '../../../habits/application/providers/habit_providers.dart';
import '../../../focus/application/providers/focus_providers.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final todayPlannerItemsProvider = Provider<List<PlannerItem>>((ref) {
  final tasks = ref.watch(taskNotifierProvider).value ?? [];
  final habits = ref.watch(habitNotifierProvider).value ?? [];
  final focusState = ref.watch(focusNotifierProvider).value;
  final selectedDate = ref.watch(selectedDateProvider);
  final activeSession = focusState?.activeSession;
  final sessions = activeSession != null ? [activeSession] : [];

  final List<PlannerItem> items = [];

  // Add Tasks for selectedDate
  for (final t in tasks) {
    if (t.state == TaskState.archived) continue;
    if (t.dueDate != null && (t.dueDate!.year != selectedDate.year || t.dueDate!.month != selectedDate.month || t.dueDate!.day != selectedDate.day)) {
      continue;
    }
    items.add(PlannerItem(
      id: t.id,
      type: PlannerItemType.task,
      title: t.title,
      subtitle: '${t.priority.name.toUpperCase()} PRIORITY • ${t.category}',
      colorHex: t.priority == TaskPriority.critical ? '#FF0055' : (t.priority == TaskPriority.high ? '#FF8800' : '#8A2BE2'),
      iconName: t.priority == TaskPriority.critical ? 'warning' : 'check_circle_outline',
      isCompleted: t.state == TaskState.completed,
      scheduledTime: t.dueDate ?? selectedDate,
      rawEntity: t,
    ));
  }

  // Add Habits for selectedDate
  for (final h in habits) {
    final isToday = selectedDate.year == DateTime.now().year && selectedDate.month == DateTime.now().month && selectedDate.day == DateTime.now().day;
    items.add(PlannerItem(
      id: h.id,
      type: PlannerItemType.habit,
      title: h.title,
      subtitle: '${h.streakCount}d streak • ${h.category}',
      colorHex: '#00F0FF',
      iconName: h.iconName,
      isCompleted: isToday ? h.isCompletedToday : false,
      scheduledTime: selectedDate.copyWith(hour: 9, minute: 0),
      rawEntity: h,
    ));
  }

  // Add Focus Sessions
  for (final s in sessions) {
    if (s.startTime.year == selectedDate.year && s.startTime.month == selectedDate.month && s.startTime.day == selectedDate.day) {
      items.add(PlannerItem(
        id: s.sessionId,
        type: PlannerItemType.focusSession,
        title: s.title,
        subtitle: '${s.durationMinutes}m deep work block • ${s.mode}',
        colorHex: '#FF00A0',
        iconName: 'timer',
        isCompleted: s.isCompleted,
        scheduledTime: s.startTime,
        rawEntity: s,
      ));
    }
  }

  // Sort by scheduledTime
  items.sort((a, b) => (a.scheduledTime ?? selectedDate).compareTo(b.scheduledTime ?? selectedDate));

  return items;
});

final plannerProgressProvider = Provider<double>((ref) {
  final items = ref.watch(todayPlannerItemsProvider);
  if (items.isEmpty) return 0.0;

  final completed = items.where((i) => i.isCompleted).length;
  return completed / items.length;
});
