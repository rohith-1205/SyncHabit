import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';
import '../../tasks/application/providers/task_providers.dart';
import '../../tasks/domain/entities/task_entity.dart';
import '../application/providers/project_providers.dart';
import '../domain/entities/project_entity.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({super.key});

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final projects = ref.watch(projectListWithProgressProvider);

    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110),
        child: FloatingActionButton.extended(
          onPressed: () => _showAddProjectModal(context),
          backgroundColor: ColorConstants.blueGlow,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.add_chart, color: Colors.white),
          label: const Text('New Mission', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Stack(
        children: [
          // Ambient Background Glows
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.blueGlow.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.blueGlow.withOpacity(0.3), blurRadius: 120)],
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.1),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.25), blurRadius: 120)],
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
                              'NOTION / LINEAR MISSION MATRIX',
                              style: TextStyle(
                                letterSpacing: 1.5,
                                color: ColorConstants.textMuted.withOpacity(0.8),
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Active Projects',
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
                              border: Border.all(color: ColorConstants.blueGlow, width: 2),
                              boxShadow: ColorConstants.neonGlow(ColorConstants.blueGlow, blurRadius: 12),
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

                // Projects List
                projects.isEmpty
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text('No active projects. Start a new mission below.', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final project = projects[index];
                            return _buildProjectCard(project);
                          },
                          childCount: projects.length,
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

  Widget _buildProjectCard(ProjectEntity project) {
    IconData icon = Icons.work;
    if (project.iconName == 'electric_car') icon = Icons.electric_car;
    if (project.iconName == 'code') icon = Icons.code;
    if (project.iconName == 'science') icon = Icons.science;

    Color pColor = ColorConstants.blueGlow;
    if (project.colorHex == '#00F0FF') pColor = ColorConstants.blueGlow;
    if (project.colorHex == '#FF00A0') pColor = ColorConstants.pinkNeon;
    if (project.colorHex == '#8A2BE2') pColor = ColorConstants.neonViolet;

    final tasks = ref.watch(taskNotifierProvider).value ?? [];
    final projTasks = tasks.where((t) => t.projectId == project.id).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: NeonCard(
        isGlowing: true,
        glowColor: pColor,
        padding: const EdgeInsets.all(24),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: pColor.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(icon, color: pColor, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(project.description ?? 'Active Mission Matrix', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.archive_outlined, color: ColorConstants.textMuted),
                  onPressed: () => ref.read(projectNotifierProvider.notifier).toggleArchiveProject(project.id),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MISSION VELOCITY', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                Text('${(project.progress * 100).toInt()}%', style: TextStyle(color: pColor, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: project.progress,
                minHeight: 8,
                backgroundColor: ColorConstants.bgDark.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(pColor),
              ),
            ),
            const SizedBox(height: 20),

            // Tasks List
            Text('LINKED TASKS (${projTasks.length})', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const SizedBox(height: 12),
            projTasks.isEmpty
                ? Text('No tasks linked to this mission.', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.5), fontSize: 12))
                : Column(
                    children: projTasks.map((t) {
                      final isDone = t.state == TaskState.completed;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Dismissible(
                          key: ValueKey(t.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(color: ColorConstants.danger, borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.delete_outline, color: Colors.white, size: 20),
                          ),
                          onDismissed: (_) {
                            ref.read(taskNotifierProvider.notifier).deleteTask(t.id);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${t.title}" deleted.'), backgroundColor: ColorConstants.cardSurface));
                          },
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => ref.read(taskNotifierProvider.notifier).toggleTaskCompletion(t.id),
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isDone ? pColor : Colors.transparent,
                                    border: isDone ? null : Border.all(color: ColorConstants.textMuted.withOpacity(0.5), width: 1.5),
                                  ),
                                  child: isDone ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => ref.read(taskNotifierProvider.notifier).toggleTaskCompletion(t.id),
                                  onLongPress: () => _showEditTaskModal(context, t),
                                  child: Text(
                                    t.title,
                                    style: TextStyle(color: isDone ? ColorConstants.textMuted : Colors.white, fontSize: 14, decoration: isDone ? TextDecoration.lineThrough : null),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => context.push('/focus'),
                                style: ElevatedButton.styleFrom(backgroundColor: pColor.withOpacity(0.2), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), minimumSize: Size.zero),
                                child: Text('Focus', style: TextStyle(color: pColor, fontSize: 10, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 16),

            // Add Task to Project Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showAddTaskToProjectModal(context, project.id),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: pColor.withOpacity(0.5), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                icon: Icon(Icons.add, color: pColor, size: 18),
                label: Text('Add Task to Mission', style: TextStyle(color: pColor, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddProjectModal(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String selectedColor = '#00F0FF';
    String selectedIcon = 'electric_car';

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
                  border: Border.all(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5),
                  boxShadow: [BoxShadow(color: ColorConstants.blueGlow.withOpacity(0.15), blurRadius: 40, spreadRadius: 5)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Create New Mission', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white)),
                        IconButton(icon: const Icon(Icons.close, color: Colors.white70), onPressed: () => Navigator.pop(modalContext)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text('MISSION TITLE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'e.g., SIH Hydrogen Mobility Platform',
                        hintStyle: TextStyle(color: ColorConstants.textMuted.withOpacity(0.5)),
                        filled: true,
                        fillColor: ColorConstants.cardSurface,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: ColorConstants.blueGlow, width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description
                    Text('DESCRIPTION', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descController,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'e.g., Next-Gen Clean Energy Infrastructure',
                        hintStyle: TextStyle(color: ColorConstants.textMuted.withOpacity(0.5)),
                        filled: true,
                        fillColor: ColorConstants.cardSurface,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Color Selection
                    Text('COLOR MATRIX', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['#00F0FF', '#FF00A0', '#8A2BE2'].map((cHex) {
                        Color c = ColorConstants.blueGlow;
                        if (cHex == '#FF00A0') c = ColorConstants.pinkNeon;
                        if (cHex == '#8A2BE2') c = ColorConstants.neonViolet;
                        final isSelected = selectedColor == cHex;

                        return GestureDetector(
                          onTap: () => setModalState(() => selectedColor = cHex),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: c, shape: BoxShape.circle, border: isSelected ? Border.all(color: Colors.white, width: 3) : null, boxShadow: isSelected ? ColorConstants.neonGlow(c, blurRadius: 12) : null),
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

                          final newProj = ProjectEntity(
                            id: const Uuid().v4(),
                            userId: 'default_user',
                            title: titleController.text.trim(),
                            description: descController.text.trim(),
                            colorHex: selectedColor,
                            iconName: selectedIcon,
                            deadline: DateTime.now().add(const Duration(days: 30)),
                            progress: 0.0,
                            isArchived: false,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                          );

                          ref.read(projectNotifierProvider.notifier).addProject(newProj);
                          Navigator.pop(modalContext);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Mission "${newProj.title}" initialized!'), backgroundColor: ColorConstants.cardSurface));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.blueGlow,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          shadowColor: ColorConstants.blueGlow.withOpacity(0.5),
                        ),
                        child: const Text('Initialize Mission', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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

  void _showAddTaskToProjectModal(BuildContext context, String projectId) {
    final titleController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(modalContext).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: ColorConstants.bgDark,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border.all(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Task to Mission', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white)),
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'e.g., Implement Neural Network Layer',
                    hintStyle: TextStyle(color: ColorConstants.textMuted.withOpacity(0.5)),
                    filled: true,
                    fillColor: ColorConstants.cardSurface,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5)),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (titleController.text.trim().isEmpty) return;

                      final newTask = TaskEntity(
                        id: const Uuid().v4(),
                        userId: 'default_user',
                        projectId: projectId,
                        title: titleController.text.trim(),
                        priority: TaskPriority.medium,
                        state: TaskState.pending,
                        category: 'Work',
                        tags: [],
                        subtasks: [],
                        dueDate: DateTime.now(),
                        actualDurationMinutes: 0,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      );

                      final success = await ref.read(taskNotifierProvider.notifier).addTask(newTask);
                      if (modalContext.mounted) {
                        Navigator.pop(modalContext);
                      }

                      if (!success) {
                        if (context.mounted) {
                          _showPremiumUpgradeModal(context);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: ColorConstants.blueGlow, padding: const EdgeInsets.symmetric(vertical: 18), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: const Text('Add Task', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditTaskModal(BuildContext context, TaskEntity task) {
    final titleController = TextEditingController(text: task.title);
    TaskPriority selectedPriority = task.priority;

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
                  border: Border.all(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5),
                  boxShadow: [BoxShadow(color: ColorConstants.blueGlow.withOpacity(0.15), blurRadius: 40, spreadRadius: 5)],
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.3), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: ColorConstants.blueGlow, width: 2)),
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
                        Color pColor = ColorConstants.blueGlow;
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
                            description: task.description,
                            priority: selectedPriority,
                            state: task.state,
                            category: task.category,
                            tags: task.tags,
                            subtasks: task.subtasks,
                            dueDate: task.dueDate,
                            actualDurationMinutes: task.actualDurationMinutes,
                            createdAt: task.createdAt,
                            updatedAt: DateTime.now(),
                          );

                          ref.read(taskNotifierProvider.notifier).updateTask(updatedTask);
                          Navigator.pop(modalContext);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task "${updatedTask.title}" updated successfully!'), backgroundColor: ColorConstants.cardSurface));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.blueGlow,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          shadowColor: ColorConstants.blueGlow.withOpacity(0.5),
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
          side: BorderSide(color: ColorConstants.blueGlow.withOpacity(0.5), width: 2),
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Redirecting to Pro checkout...'), backgroundColor: ColorConstants.blueGlow));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.blueGlow,
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
