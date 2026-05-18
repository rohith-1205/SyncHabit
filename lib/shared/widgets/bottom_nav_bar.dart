import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/color_constants.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    final List<Map<String, dynamic>> tabs = [
      {'label': 'Planner', 'icon': Icons.calendar_today, 'color': ColorConstants.neonViolet},
      {'label': 'Projects', 'icon': Icons.account_tree, 'color': ColorConstants.blueGlow},
      {'label': 'Focus', 'icon': Icons.timer_outlined, 'color': ColorConstants.pinkNeon},
      {'label': 'Stats', 'icon': Icons.bar_chart, 'color': ColorConstants.success},
      {'label': 'Pro', 'icon': Icons.workspace_premium, 'color': ColorConstants.pinkNeon},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: navigationShell),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: ColorConstants.cardSurface.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                    boxShadow: [
                      BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10)),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(tabs.length, (index) {
                      final tab = tabs[index];
                      final isSelected = currentIndex == index;
                      final Color tabColor = tab['color'];

                      return GestureDetector(
                        onTap: () {
                          navigationShell.goBranch(
                            index,
                            initialLocation: index == navigationShell.currentIndex,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? tabColor.withOpacity(0.2) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: isSelected ? Border.all(color: tabColor.withOpacity(0.5), width: 1.5) : null,
                            boxShadow: isSelected ? ColorConstants.neonGlow(tabColor, blurRadius: 12) : null,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                tab['icon'],
                                color: isSelected ? tabColor : ColorConstants.textMuted,
                                size: isSelected ? 24 : 20,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                tab['label'],
                                style: TextStyle(
                                  color: isSelected ? ColorConstants.textPrimary : ColorConstants.textMuted,
                                  fontSize: 10,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ).animate(target: isSelected ? 1 : 0).scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1)),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
