import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_card.dart';
import '../../../core/widgets/shimmer_loader.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/habit_provider.dart';
import '../models/habit_model.dart';

class HubScreen extends ConsumerStatefulWidget {
  const HubScreen({super.key});

  @override
  ConsumerState<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends ConsumerState<HubScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final habitsState = ref.watch(habitNotifierProvider);

    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      body: Stack(
        children: [
          // Ambient Background Glows
          Positioned(
            top: 50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 120)],
              ),
            ),
          ),
          Positioned(
            top: 400,
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

          Positioned.fill(
            child: SafeArea(
              child: RefreshIndicator(
              color: ColorConstants.neonViolet,
              backgroundColor: ColorConstants.cardSurface,
              onRefresh: () async {
                await ref.read(habitNotifierProvider.notifier).loadHabits();
              },
              child: CustomScrollView(
                slivers: [
                  // Top Header matching Image 3 & 4
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left: CircleAvatar DV
                          GestureDetector(
                            onTap: () => context.push('/settings'),
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorConstants.neonViolet, width: 2),
                                boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 16),
                              ),
                              child: CircleAvatar(
                                backgroundColor: ColorConstants.cardSurface,
                                backgroundImage: user?.photoUrl != null ? NetworkImage(user!.photoUrl!) : null,
                                child: user?.photoUrl == null
                                    ? Text(
                                        _getInitials(user?.displayName ?? 'Developer'),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                      )
                                    : null,
                              ),
                            ),
                          ),

                          // Center: PRO MEMBER / Hello, Developer
                          Column(
                            children: [
                              Text(
                                user?.isPro == true ? 'PRO MEMBER' : 'PRO MEMBER',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: ColorConstants.textMuted.withOpacity(0.8),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Hello, ${user?.displayName?.split(' ').first ?? 'Developer'}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),

                          // Right: Bell Icon with Pink Badge
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('No new neural alerts at this time.'), backgroundColor: ColorConstants.cardSurface),
                                  );
                                },
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstants.pinkNeon,
                                    boxShadow: ColorConstants.neonGlow(ColorConstants.pinkNeon, blurRadius: 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Weekly Date Strip matching Image 3 & 4
                  SliverToBoxAdapter(
                    child: _buildWeeklyDateStrip(),
                  ),

                  // Today's Habits Header matching Image 3 & 4
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 24, 28, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Habits",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          habitsState.when(
                            data: (habits) {
                              final completed = habits.where((h) => h.isCompletedToday).length;
                              return Text(
                                '$completed of ${habits.length}',
                                style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w600),
                              );
                            },
                            loading: () => const SizedBox(),
                            error: (_, __) => const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Habits List matching Image 3 & 4
                  habitsState.when(
                    loading: () => SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          children: List.generate(4, (index) => const Padding(padding: EdgeInsets.only(bottom: 12), child: ShimmerLoader(height: 80))),
                        ),
                      ),
                    ),
                    error: (e, st) => SliverToBoxAdapter(
                      child: Center(child: Text('Error loading habits: $e')),
                    ),
                    data: (habits) {
                      if (habits.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text('No habits assigned for today.', style: Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        );
                      }
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final habit = habits[index];
                            return _buildHabitCard(habit);
                          },
                          childCount: habits.length,
                        ),
                      );
                    },
                  ),

                  // SYNCHABIT NOTICED AI Card matching Image 3 & 4
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 24, 28, 16),
                      child: NeonCard(
                        isGlowing: true,
                        glowColor: ColorConstants.neonViolet,
                        padding: const EdgeInsets.all(24),
                        margin: EdgeInsets.zero,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstants.neonViolet.withOpacity(0.2),
                                  ),
                                  child: const Icon(Icons.auto_awesome, color: ColorConstants.neonViolet, size: 20),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'SYNCHABIT NOTICED',
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'You complete 78% more tasks when focus periods are logged before 2:00 PM.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.95),
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Smart Schedule Applied! Habits optimized for morning slots.'), backgroundColor: ColorConstants.cardSurface),
                                );
                              },
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: ColorConstants.cardSurface,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.4), width: 1.5),
                                ),
                                child: const Text(
                                  'Apply Smart Schedule',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // TODAY'S FOCUS Card matching Image 4
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 8, 28, 32),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                          color: ColorConstants.cardSurface.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TODAY'S FOCUS",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    color: ColorConstants.textMuted.withOpacity(0.8),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    const Text(
                                      '1h 24m',
                                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '/ 3h goal',
                                      style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => context.push('/focus'),
                              borderRadius: BorderRadius.circular(28),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon]),
                                  borderRadius: BorderRadius.circular(28),
                                  boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                                    const SizedBox(width: 6),
                                    const Text('Start', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // PRO COMMAND CENTER Quick-Launch Tiles
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 8, 28, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRO COMMAND CENTER',
                            style: TextStyle(
                              letterSpacing: 1.5,
                              color: ColorConstants.textMuted.withOpacity(0.8),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1.25,
                            children: [
                              _buildQuickLaunchTile(
                                context,
                                title: 'AI Chrono-Blocker',
                                subtitle: 'Smart Calendar Sync',
                                icon: Icons.calendar_today,
                                color: ColorConstants.neonViolet,
                                route: '/chrono',
                              ),
                              _buildQuickLaunchTile(
                                context,
                                title: 'Neuro-Focus Audio',
                                subtitle: 'Binaural Synthesis',
                                icon: Icons.headphones,
                                color: ColorConstants.pinkNeon,
                                route: '/neuro',
                              ),
                              _buildQuickLaunchTile(
                                context,
                                title: 'Break-Safe Engine',
                                subtitle: 'Burnout Shielding',
                                icon: Icons.shield_outlined,
                                color: ColorConstants.blueGlow,
                                route: '/safe',
                              ),
                              _buildQuickLaunchTile(
                                context,
                                title: 'AI Retrospective',
                                subtitle: 'Weekly Diagnostics',
                                icon: Icons.analytics_outlined,
                                color: ColorConstants.success,
                                route: '/retro',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 120)), // Space for bottom nav
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : 'DV';
  }

  Widget _buildWeeklyDateStrip() {
    final today = _selectedDate;
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final days = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final date = days[index];
          final isSelected = date.day == 15 || (date.year == _selectedDate.year && date.month == _selectedDate.month && date.day == _selectedDate.day);
          final dayName = ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Container(
              width: 54,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? ColorConstants.neonViolet : Colors.transparent,
                borderRadius: BorderRadius.circular(27),
                border: isSelected ? null : Border.all(color: ColorConstants.neonViolet.withOpacity(0.15), width: 1.5),
                boxShadow: isSelected ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 20) : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                      color: isSelected ? Colors.white : ColorConstants.textMuted,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : ColorConstants.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHabitCard(HabitModel habit) {
    IconData iconData = Icons.self_improvement;
    if (habit.iconName == 'code' || habit.title.contains('Workout')) iconData = Icons.fitness_center;
    if (habit.iconName == 'menu_book' || habit.title.contains('Read')) iconData = Icons.menu_book;
    if (habit.iconName == 'self_improvement' || habit.title.contains('Meditate')) iconData = Icons.psychology;
    if (habit.iconName == 'water_drop' || habit.title.contains('Hydration')) iconData = Icons.water_drop;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
      child: Dismissible(
        key: Key(habit.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(color: ColorConstants.danger, borderRadius: BorderRadius.circular(28)),
          child: const Icon(Icons.delete_outline, color: Colors.white, size: 32),
        ),
        onDismissed: (direction) {
          ref.read(habitNotifierProvider.notifier).removeHabit(habit.id);
        },
        child: GestureDetector(
          onTap: () {
            ref.read(habitNotifierProvider.notifier).toggleHabit(habit);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: ColorConstants.cardSurface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.15), width: 1.5),
            ),
            child: Row(
              children: [
                // Category Icon
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: ColorConstants.neonViolet.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: ColorConstants.neonViolet, size: 24),
                ),
                const SizedBox(width: 16),

                // Title & Streak
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${habit.streakCount}d streak',
                        style: TextStyle(
                          color: ColorConstants.textMuted.withOpacity(0.8),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Wireframe Checkbox (Solid purple circle with check vs empty ring)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: habit.isCompletedToday ? ColorConstants.neonViolet : Colors.transparent,
                    border: habit.isCompletedToday ? null : Border.all(color: ColorConstants.textMuted.withOpacity(0.3), width: 2),
                    boxShadow: habit.isCompletedToday ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                  ),
                  child: habit.isCompletedToday
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLaunchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return InkWell(
      onTap: () => context.push(route),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(0.3), width: 1.5),
          boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: ColorConstants.textMuted, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
