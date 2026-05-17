import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_card.dart';

class DuelsScreen extends ConsumerStatefulWidget {
  const DuelsScreen({super.key});

  @override
  ConsumerState<DuelsScreen> createState() => _DuelsScreenState();
}

class _DuelsScreenState extends ConsumerState<DuelsScreen> {
  bool _isFriendDuels = true;
  final List<Map<String, dynamic>> _duels = [
    {
      'myInitials': 'YO', 'myName': 'You', 'myToday': '86%',
      'oppInitials': 'AK', 'oppName': 'Alex K.', 'oppToday': '62%',
      'day': 12, 'showNudge': true,
      'myBars': [0.6, 0.8, 0.4, 0.9, 0.3, 0.7, 0.85],
      'oppBars': [0.5, 0.7, 0.3, 0.8, 0.4, 0.6, 0.6],
    },
    {
      'myInitials': 'YO', 'myName': 'You', 'myToday': '74%',
      'oppInitials': 'MR', 'oppName': 'Maya R.', 'oppToday': '80%',
      'day': 5, 'showNudge': false,
      'myBars': [0.5, 0.7, 0.3, 0.8, 0.4, 0.6, 0.7],
      'oppBars': [0.6, 0.8, 0.4, 0.9, 0.5, 0.7, 0.8],
    },
  ];

  void _sendElectricNudge(String oppName) {
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('⚡ Electric Nudge sent to $oppName!'), backgroundColor: ColorConstants.pinkNeon),
    );
  }

  void _challengeNewFriend() {
    HapticFeedback.mediumImpact();
    setState(() {
      _duels.add({
        'myInitials': 'YO', 'myName': 'You', 'myToday': '90%',
        'oppInitials': 'ST', 'oppName': 'Sarah T.', 'oppToday': '88%',
        'day': 1, 'showNudge': true,
        'myBars': [0.7, 0.8, 0.6, 0.9, 0.8, 0.9, 0.9],
        'oppBars': [0.6, 0.7, 0.5, 0.8, 0.7, 0.85, 0.88],
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Challenge initiated with Sarah T.'), backgroundColor: ColorConstants.cardSurface),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ambient Glows matching wireframe
          Positioned(
            top: 150,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.35), blurRadius: 150)],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Accountability Arenas
                    Row(
                      children: [
                        const Icon(Icons.sports_kabaddi, color: ColorConstants.neonViolet, size: 28),
                        const SizedBox(width: 12),
                        Text('Accountability Arenas', style: Theme.of(context).textTheme.displayMedium),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('Sync streaks with your crew', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 14)),
                    const SizedBox(height: 28),

                    // Segmented Toggle: Friend Duels vs Global Guilds
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorConstants.cardSurface.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => setState(() => _isFriendDuels = true),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  gradient: _isFriendDuels ? ColorConstants.violetPinkGradient : null,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: _isFriendDuels ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                                ),
                                child: Center(
                                  child: Text(
                                    'Friend Duels',
                                    style: TextStyle(color: _isFriendDuels ? Colors.white : ColorConstants.textMuted, fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => setState(() => _isFriendDuels = false),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  gradient: !_isFriendDuels ? ColorConstants.violetPinkGradient : null,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: !_isFriendDuels ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                                ),
                                child: Center(
                                  child: Text(
                                    'Global Guilds',
                                    style: TextStyle(color: !_isFriendDuels ? Colors.white : ColorConstants.textMuted, fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    if (!_isFriendDuels)
                      NeonCard(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          children: [
                            const Icon(Icons.public, color: ColorConstants.blueGlow, size: 48),
                            const SizedBox(height: 16),
                            Text('Global Guilds Active', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Text('You are currently competing in the "Cybernetic Coders" global tier. Ranked #142.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary)),
                          ],
                        ),
                      )
                    else ...[
                      // Duel Cards matching wireframe exactly
                      ..._duels.map((duel) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: NeonCard(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left Player (You)
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: ColorConstants.neonViolet,
                                        child: Text(duel['myInitials'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(duel['myName'], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                          Text('${duel['myToday']} today', style: const TextStyle(color: ColorConstants.textMuted, fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Center Flame & Day Badge
                                  Column(
                                    children: [
                                      const Icon(Icons.local_fire_department, color: ColorConstants.pinkNeon, size: 28),
                                      const SizedBox(height: 2),
                                      Text('DAY ${duel['day']}', style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900)),
                                      const Text('of sync', style: TextStyle(color: ColorConstants.textMuted, fontSize: 10)),
                                    ],
                                  ),

                                  // Right Player (Opponent)
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(duel['oppName'], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                          Text('${duel['oppToday']} today', style: const TextStyle(color: ColorConstants.textMuted, fontSize: 12)),
                                        ],
                                      ),
                                      const SizedBox(width: 12),
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: ColorConstants.cardSurface,
                                        child: Text(duel['oppInitials'], style: const TextStyle(color: ColorConstants.textSecondary, fontWeight: FontWeight.bold, fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Dual Bar Chart Simulation
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // My Bars
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: (duel['myBars'] as List<double>).map((val) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: Container(
                                        width: 12,
                                        height: val * 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [ColorConstants.neonViolet, ColorConstants.neonViolet.withOpacity(0.5)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    )).toList(),
                                  ),
                                  // Opponent Bars
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: (duel['oppBars'] as List<double>).map((val) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: Container(
                                        width: 12,
                                        height: val * 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [ColorConstants.pinkNeon, ColorConstants.pinkNeon.withOpacity(0.5)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    )).toList(),
                                  ),
                                ],
                              ),
                              if (duel['showNudge']) ...[
                                const SizedBox(height: 24),
                                // Send Electric Nudge Button
                                InkWell(
                                  onTap: () => _sendElectricNudge(duel['oppName']),
                                  borderRadius: BorderRadius.circular(24),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon]),
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: ColorConstants.neonGlow(ColorConstants.pinkNeon, blurRadius: 16),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.bolt, color: Colors.white, size: 22),
                                        SizedBox(width: 8),
                                        Text('Send Electric Nudge', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      )),

                      // Challenge another friend pill button
                      InkWell(
                        onTap: _challengeNewFriend,
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: ColorConstants.cardSurface.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.4), width: 1.5),
                          ),
                          child: const Center(
                            child: Text(
                              '+ Challenge another friend',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
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
