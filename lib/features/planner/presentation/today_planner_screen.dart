import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';
import '../../tasks/application/providers/task_providers.dart';
import '../../tasks/domain/entities/task_entity.dart';
import '../../habits/application/providers/habit_providers.dart';
import '../../habits/infrastructure/models/habit_model.dart';
import '../application/providers/planner_providers.dart';
import '../domain/entities/planner_item.dart';

class TodayPlannerScreen extends ConsumerStatefulWidget {
  const TodayPlannerScreen({super.key});

  @override
  ConsumerState<TodayPlannerScreen> createState() => _TodayPlannerScreenState();
}

class _TodayPlannerScreenState extends ConsumerState<TodayPlannerScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final items = ref.watch(todayPlannerItemsProvider);
    final progress = ref.watch(plannerProgressProvider);

    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110),
        child: FloatingActionButton.extended(
          onPressed: () => _showQuickTaskCaptureModal(context),
          backgroundColor: ColorConstants.neonViolet,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.add_task, color: Colors.white),
          label: const Text('Quick Capture', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Stack(
        children: [
          // Ambient Background Glows
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 120)],
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.blueGlow.withOpacity(0.1),
                boxShadow: [BoxShadow(color: ColorConstants.blueGlow.withOpacity(0.25), blurRadius: 120)],
              ),
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              slivers: [
                // Top Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BEHAVIORAL OPERATING DASHBOARD',
                              style: TextStyle(
                                letterSpacing: 1.5,
                                color: ColorConstants.textMuted.withOpacity(0.8),
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Today's Execution Plan",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => context.push('/settings'),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorConstants.neonViolet, width: 2),
                              boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12),
                            ),
                            child: CircleAvatar(
                              backgroundColor: ColorConstants.cardSurface,
                              backgroundImage: user?.photoUrl != null ? NetworkImage(user!.photoUrl!) : null,
                              child: user?.photoUrl == null
                                  ? const Text('DV', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Horizontal Date Selector Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              itemCount: 14, // 7 days past, today, 6 days future
                              itemBuilder: (context, index) {
                                final now = DateTime.now();
                                final date = now.subtract(const Duration(days: 7)).add(Duration(days: index));
                                final isSelected = date.year == ref.watch(selectedDateProvider).year &&
                                    date.month == ref.watch(selectedDateProvider).month &&
                                    date.day == ref.watch(selectedDateProvider).day;
                                final isToday = date.year == now.year && date.month == now.month && date.day == now.day;

                                return GestureDetector(
                                  onTap: () {
                                    ref.read(selectedDateProvider.notifier).state = date;
                                  },
                                  child: Container(
                                    width: 58,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      color: isSelected ? ColorConstants.neonViolet : ColorConstants.cardSurface,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected ? ColorConstants.neonViolet : (isToday ? ColorConstants.blueGlow : ColorConstants.textMuted.withOpacity(0.15)),
                                        width: isToday || isSelected ? 2 : 1,
                                      ),
                                      boxShadow: isSelected ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][date.weekday - 1],
                                          style: TextStyle(
                                            color: isSelected ? Colors.white : (isToday ? ColorConstants.blueGlow : ColorConstants.textMuted),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${date.day}',
                                          style: TextStyle(
                                            color: isSelected ? Colors.white : Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24, left: 8),
                            child: IconButton(
                              onPressed: () async {
                                final current = ref.read(selectedDateProvider);
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: current,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2035),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.dark(
                                          primary: ColorConstants.neonViolet,
                                          onPrimary: Colors.white,
                                          surface: ColorConstants.bgDark,
                                          onSurface: Colors.white,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (picked != null) {
                                  ref.read(selectedDateProvider.notifier).state = picked;
                                }
                              },
                              icon: const Icon(Icons.calendar_month, color: ColorConstants.neonViolet, size: 28),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Daily Progress Bar Banner
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    child: NeonCard(
                      isGlowing: true,
                      glowColor: ColorConstants.neonViolet,
                      padding: const EdgeInsets.all(24),
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'EXECUTION VELOCITY',
                                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.2),
                              ),
                              Text(
                                '${(progress * 100).toInt()}%',
                                style: const TextStyle(color: ColorConstants.neonViolet, fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 12,
                              backgroundColor: ColorConstants.bgDark.withOpacity(0.5),
                              valueColor: const AlwaysStoppedAnimation<Color>(ColorConstants.neonViolet),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.auto_awesome, color: ColorConstants.pinkNeon, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  progress == 1.0 ? 'Flawless execution! All daily protocols complete.' : 'Maintain momentum. AI recommends completing your next deep work block.',
                                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Timeline Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: Text(
                      'UNIFIED EXECUTION TIMELINE',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: ColorConstants.textMuted.withOpacity(0.8),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                // Timeline List
                items.isEmpty
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text('No tasks or protocols scheduled for today.', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = items[index];
                            return _buildPlannerTile(item);
                          },
                          childCount: items.length,
                        ),
                      ),

                const SliverToBoxAdapter(child: SizedBox(height: 120)), // Space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlannerTile(PlannerItem item) {
    IconData icon = Icons.task_alt;
    if (item.iconName == 'timer') icon = Icons.timer;
    if (item.iconName == 'warning') icon = Icons.warning_amber;
    if (item.iconName == 'auto_awesome') icon = Icons.auto_awesome;
    if (item.iconName == 'self_improvement') icon = Icons.psychology;
    if (item.iconName == 'code') icon = Icons.fitness_center;
    if (item.iconName == 'water_drop') icon = Icons.water_drop;
    if (item.iconName == 'menu_book') icon = Icons.menu_book;

    Color itemColor = ColorConstants.neonViolet;
    if (item.colorHex == '#FF0055') itemColor = ColorConstants.danger;
    if (item.colorHex == '#FF8800') itemColor = Colors.orange;
    if (item.colorHex == '#00F0FF') itemColor = ColorConstants.blueGlow;
    if (item.colorHex == '#FF00A0') itemColor = ColorConstants.pinkNeon;
    if (item.colorHex == '#FFFF00') itemColor = Colors.yellow;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: item.type == PlannerItemType.task || item.type == PlannerItemType.habit
          ? Dismissible(
              key: ValueKey(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 24),
                decoration: BoxDecoration(color: ColorConstants.danger, borderRadius: BorderRadius.circular(24)),
                child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
              ),
              onDismissed: (_) {
                if (item.type == PlannerItemType.task) {
                  ref.read(taskNotifierProvider.notifier).deleteTask(item.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${item.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                } else if (item.type == PlannerItemType.habit) {
                  ref.read(habitNotifierProvider.notifier).removeHabit(item.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Habit "${item.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                }
              },
              child: _buildTileContent(item, icon, itemColor),
            )
          : _buildTileContent(item, icon, itemColor),
    );
  }

  Widget _buildTileContent(PlannerItem item, IconData icon, Color itemColor) {
    return GestureDetector(
      onTap: () {
        if (item.type == PlannerItemType.task) {
          ref.read(taskNotifierProvider.notifier).toggleTaskCompletion(item.id);
        } else if (item.type == PlannerItemType.habit) {
          ref.read(habitNotifierProvider.notifier).toggleHabit(item.rawEntity as HabitModel);
        } else if (item.type == PlannerItemType.focusSession || item.type == PlannerItemType.aiRecommendation) {
          context.push('/focus');
        }
      },
      onLongPress: () {
        if (item.type == PlannerItemType.task && item.rawEntity is TaskEntity) {
          _showEditTaskModal(context, item.rawEntity as TaskEntity);
        } else if (item.type == PlannerItemType.habit && item.rawEntity is HabitModel) {
          _showEditHabitModal(context, item.rawEntity as HabitModel);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.7),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: itemColor.withOpacity(item.isCompleted ? 0.2 : 0.5), width: 1.5),
          boxShadow: item.isCompleted ? null : ColorConstants.neonGlow(itemColor.withOpacity(0.5), blurRadius: 12),
        ),
        child: Row(
          children: [
            // Icon / Checkbox
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: itemColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: itemColor, size: 24),
            ),
            const SizedBox(width: 16),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: item.isCompleted ? ColorConstants.textMuted : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 12),
                  ),
                ],
              ),
            ),

            // Action Button / Time Badge
            if (item.type == PlannerItemType.task || item.type == PlannerItemType.habit)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Edit Button
                  GestureDetector(
                    onTap: () {
                      if (item.type == PlannerItemType.task && item.rawEntity is TaskEntity) {
                        _showEditTaskModal(context, item.rawEntity as TaskEntity);
                      } else if (item.type == PlannerItemType.habit && item.rawEntity is HabitModel) {
                        _showEditHabitModal(context, item.rawEntity as HabitModel);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
                      ),
                      child: const Icon(Icons.edit_outlined, color: Colors.white70, size: 16),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Delete Button
                  GestureDetector(
                    onTap: () {
                      if (item.type == PlannerItemType.task) {
                        ref.read(taskNotifierProvider.notifier).deleteTask(item.id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${item.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                      } else if (item.type == PlannerItemType.habit) {
                        ref.read(habitNotifierProvider.notifier).removeHabit(item.id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Habit "${item.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
                      ),
                      child: const Icon(Icons.delete_outline, color: Colors.white70, size: 16),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.isCompleted ? itemColor : Colors.transparent,
                      border: item.isCompleted ? null : Border.all(color: ColorConstants.textMuted.withOpacity(0.5), width: 2),
                    ),
                    child: item.isCompleted ? const Icon(Icons.check, color: Colors.white, size: 18) : null,
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: () => context.push('/focus'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: itemColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: Size.zero,
                ),
                child: const Text('Focus', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
          ],
        ),
      ),
    );
  }

  void _showQuickTaskCaptureModal(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    TaskPriority selectedPriority = TaskPriority.medium;
    String selectedCategory = 'Work';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: ColorConstants.bgDark,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                  boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.15), blurRadius: 40, spreadRadius: 5)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quick Task Capture', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white)),
                        IconButton(icon: const Icon(Icons.close, color: Colors.white70), onPressed: () => Navigator.pop(modalContext)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text('TASK TITLE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'e.g., Deploy AI microservice, Code review',
                        hintStyle: TextStyle(color: ColorConstants.textMuted.withOpacity(0.5)),
                        filled: true,
                        fillColor: ColorConstants.cardSurface,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: ColorConstants.neonViolet, width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Priority
                    Text('PRIORITY', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: TaskPriority.values.map((priority) {
                        final isSelected = selectedPriority == priority;
                        Color pColor = ColorConstants.neonViolet;
                        if (priority == TaskPriority.critical) pColor = ColorConstants.danger;
                        if (priority == TaskPriority.high) pColor = Colors.orange;

                        return GestureDetector(
                          onTap: () => setModalState(() => selectedPriority = priority),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? pColor : ColorConstants.cardSurface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: isSelected ? pColor : ColorConstants.textMuted.withOpacity(0.2), width: 1.5),
                              boxShadow: isSelected ? ColorConstants.neonGlow(pColor, blurRadius: 12) : null,
                            ),
                            child: Text(priority.name.toUpperCase(), style: TextStyle(color: isSelected ? Colors.white : ColorConstants.textMuted, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    // Category
                    Text('CATEGORY', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: ['Work', 'Personal', 'AI', 'Health'].map((cat) {
                        final isSelected = selectedCategory == cat;
                        return GestureDetector(
                          onTap: () => setModalState(() => selectedCategory = cat),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? ColorConstants.neonViolet : ColorConstants.cardSurface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: isSelected ? ColorConstants.neonViolet : ColorConstants.textMuted.withOpacity(0.2), width: 1.5),
                            ),
                            child: Text(cat, style: TextStyle(color: isSelected ? Colors.white : ColorConstants.textMuted, fontWeight: FontWeight.bold, fontSize: 14)),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (titleController.text.trim().isEmpty) return;

                          final currentUser = ref.read(currentUserProvider);
                          final userId = currentUser?.id ?? 'default_user';
                          final selectedDate = ref.read(selectedDateProvider);

                          final newTask = TaskEntity(
                            id: const Uuid().v4(),
                            userId: userId,
                            title: titleController.text.trim(),
                            description: descController.text.trim(),
                            priority: selectedPriority,
                            state: TaskState.pending,
                            category: selectedCategory,
                            tags: [],
                            subtasks: [],
                            dueDate: selectedDate,
                            actualDurationMinutes: 0,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                          );

                          final success = await ref.read(taskNotifierProvider.notifier).addTask(newTask);
                          if (modalContext.mounted) {
                            Navigator.pop(modalContext);
                          }

                          if (success) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${newTask.title}" captured successfully!'), backgroundColor: ColorConstants.cardSurface));
                            }
                          } else {
                            if (context.mounted) {
                              _showPremiumUpgradeModal(context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.neonViolet,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          shadowColor: ColorConstants.neonViolet.withOpacity(0.5),
                        ),
                        child: const Text('Capture Task', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showEditTaskModal(BuildContext context, TaskEntity task) {
    final titleController = TextEditingController(text: task.title);
    final descController = TextEditingController(text: task.description);
    TaskPriority selectedPriority = task.priority;
    String selectedCategory = task.category;
    DateTime selectedDueDate = task.dueDate ?? ref.read(selectedDateProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: ColorConstants.bgDark,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                  boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.15), blurRadius: 40, spreadRadius: 5)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Edit Task', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white)),
                        IconButton(icon: const Icon(Icons.delete_outline, color: ColorConstants.danger), onPressed: () {
                          ref.read(taskNotifierProvider.notifier).deleteTask(task.id);
                          Navigator.pop(modalContext);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${task.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                        }),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text('TASK TITLE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConstants.cardSurface,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: ColorConstants.neonViolet, width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Due Date Picker
                    Text('DUE DATE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDueDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2035),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: ColorConstants.neonViolet,
                                  onPrimary: Colors.white,
                                  surface: ColorConstants.bgDark,
                                  onSurface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setModalState(() => selectedDueDate = picked);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: ColorConstants.cardSurface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${selectedDueDate.year}-${selectedDueDate.month.toString().padLeft(2, '0')}-${selectedDueDate.day.toString().padLeft(2, '0')}',
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const Icon(Icons.calendar_month, color: ColorConstants.neonViolet),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Priority
                    Text('PRIORITY', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: TaskPriority.values.map((priority) {
                        final isSelected = selectedPriority == priority;
                        Color pColor = ColorConstants.neonViolet;
                        if (priority == TaskPriority.critical) pColor = ColorConstants.danger;
                        if (priority == TaskPriority.high) pColor = Colors.orange;

                        return GestureDetector(
                          onTap: () => setModalState(() => selectedPriority = priority),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? pColor : ColorConstants.cardSurface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: isSelected ? pColor : ColorConstants.textMuted.withOpacity(0.2), width: 1.5),
                              boxShadow: isSelected ? ColorConstants.neonGlow(pColor, blurRadius: 12) : null,
                            ),
                            child: Text(priority.name.toUpperCase(), style: TextStyle(color: isSelected ? Colors.white : ColorConstants.textMuted, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleController.text.trim().isEmpty) return;

                          final updatedTask = TaskEntity(
                            id: task.id,
                            userId: task.userId,
                            projectId: task.projectId,
                            title: titleController.text.trim(),
                            description: descController.text.trim(),
                            priority: selectedPriority,
                            state: task.state,
                            category: selectedCategory,
                            tags: task.tags,
                            subtasks: task.subtasks,
                            dueDate: selectedDueDate,
                            actualDurationMinutes: task.actualDurationMinutes,
                            createdAt: task.createdAt,
                            updatedAt: DateTime.now(),
                          );

                          ref.read(taskNotifierProvider.notifier).updateTask(updatedTask);
                          Navigator.pop(modalContext);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${updatedTask.title}" updated successfully!'), backgroundColor: ColorConstants.cardSurface));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.neonViolet,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          shadowColor: ColorConstants.neonViolet.withOpacity(0.5),
                        ),
                        child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showEditHabitModal(BuildContext context, HabitModel habit) {
    final titleController = TextEditingController(text: habit.title);
    String selectedCategory = habit.category;
    String selectedIcon = habit.iconName;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: ColorConstants.bgDark,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                  boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.15), blurRadius: 40, spreadRadius: 5)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Edit Habit', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white)),
                        IconButton(icon: const Icon(Icons.delete_outline, color: ColorConstants.danger), onPressed: () {
                          ref.read(habitNotifierProvider.notifier).removeHabit(habit.id);
                          Navigator.pop(modalContext);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Habit "${habit.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                        }),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text('HABIT TITLE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConstants.cardSurface,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: ColorConstants.neonViolet, width: 2)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Category
                    Text('CATEGORY', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: ['Productivity', 'Mindfulness', 'Health', 'Fitness'].map((category) {
                        final isSelected = selectedCategory == category;
                        return GestureDetector(
                          onTap: () => setModalState(() => selectedCategory = category),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? ColorConstants.neonViolet : ColorConstants.cardSurface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: isSelected ? ColorConstants.neonViolet : ColorConstants.textMuted.withOpacity(0.2), width: 1.5),
                              boxShadow: isSelected ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                            ),
                            child: Text(category, style: TextStyle(color: isSelected ? Colors.white : ColorConstants.textMuted, fontWeight: isSelected ? FontWeight.bold : FontWeight.w600, fontSize: 14)),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    // Icon
                    Text('ICON', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        {'name': 'self_improvement', 'icon': Icons.psychology},
                        {'name': 'code', 'icon': Icons.fitness_center},
                        {'name': 'water_drop', 'icon': Icons.water_drop},
                        {'name': 'menu_book', 'icon': Icons.menu_book},
                      ].map((item) {
                        final iconName = item['name'] as String;
                        final iconData = item['icon'] as IconData;
                        final isSelected = selectedIcon == iconName;

                        return GestureDetector(
                          onTap: () => setModalState(() => selectedIcon = iconName),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected ? ColorConstants.neonViolet.withOpacity(0.2) : ColorConstants.cardSurface,
                              shape: BoxShape.circle,
                              border: Border.all(color: isSelected ? ColorConstants.neonViolet : ColorConstants.textMuted.withOpacity(0.2), width: 2),
                              boxShadow: isSelected ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 16) : null,
                            ),
                            child: Icon(iconData, color: isSelected ? ColorConstants.neonViolet : ColorConstants.textMuted, size: 28),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleController.text.trim().isEmpty) return;

                          final updatedHabit = HabitModel(
                            id: habit.id,
                            title: titleController.text.trim(),
                            iconName: selectedIcon,
                            streakCount: habit.streakCount,
                            isCompletedToday: habit.isCompletedToday,
                            progress: habit.progress,
                            category: selectedCategory,
                          );

                          ref.read(habitNotifierProvider.notifier).updateHabit(updatedHabit);
                          Navigator.pop(modalContext);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Habit "${updatedHabit.title}" updated successfully!'), backgroundColor: ColorConstants.cardSurface));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.neonViolet,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          shadowColor: ColorConstants.neonViolet.withOpacity(0.5),
                        ),
                        child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showPremiumUpgradeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ColorConstants.bgDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: ColorConstants.neonViolet.withOpacity(0.5), width: 2),
        ),
        title: Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 28),
            const SizedBox(width: 12),
            Text('Pro Plan Required', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          'You have reached the maximum limit of 5 active tasks on the Free Plan. Upgrade to SyncHabit Pro to unlock unlimited tasks, advanced AI scheduling, and infinite recurring workflows!',
          style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Maybe Later', style: TextStyle(color: ColorConstants.textMuted)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Redirecting to Pro checkout...'), backgroundColor: ColorConstants.neonViolet));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.neonViolet,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Upgrade to Pro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
