import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class ChronoScreen extends ConsumerStatefulWidget {
  const ChronoScreen({super.key});

  @override
  ConsumerState<ChronoScreen> createState() => _ChronoScreenState();
}

class _ChronoScreenState extends ConsumerState<ChronoScreen> {
  bool _isDeviceStreams = true;
  bool _isLoadingUpgrade = false;

  final List<Map<String, dynamic>> _timelineEvents = [
    {'time': '08:00', 'title': 'Morning routine', 'type': 'routine', 'confirmed': false},
    {'time': '09:00', 'title': 'Standup · Eng', 'subtitle': 'Google Calendar', 'type': 'external', 'confirmed': false},
    {'time': '10:00', 'title': 'Team Sync', 'subtitle': 'Outlook', 'type': 'external', 'confirmed': false},
    {
      'time': '11:00', 'title': 'Optimal Focus Window',
      'subtitle': 'Based on high morning energy trends',
      'type': 'ai_slot', 'confirmed': false,
    },
    {'time': '13:00', 'title': 'Lunch', 'type': 'routine', 'confirmed': false},
    {'time': '14:00', 'title': '1:1 with Maya', 'subtitle': 'Google Calendar', 'type': 'external', 'confirmed': false},
    {
      'time': '15:30', 'title': 'Deep Work Injection',
      'subtitle': 'Detected 90-min uninterrupted gap',
      'type': 'ai_slot', 'confirmed': false,
    },
    {
      'time': '17:30', 'title': 'Reflection & Journal',
      'subtitle': 'Wind-down protocol',
      'type': 'ai_slot', 'confirmed': false,
    },
  ];

  void _confirmAiBlock(int index) {
    HapticFeedback.heavyImpact();
    setState(() {
      _timelineEvents[index]['confirmed'] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🛡️ DND Profile active for ${_timelineEvents[index]['title']}!'),
        backgroundColor: ColorConstants.pinkNeon,
      ),
    );
  }

  void _processUpgrade() async {
    setState(() { _isLoadingUpgrade = true; });
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    ref.read(authNotifierProvider.notifier).upgradeToPro();
    if (!mounted) return;
    setState(() { _isLoadingUpgrade = false; });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final isPro = user?.isPro ?? false;

    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      body: Stack(
        children: [
          // Background Glows matching wireframe
          Positioned(
            top: 250,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Container(
               width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.pinkNeon.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.pinkNeon.withOpacity(0.35), blurRadius: 150)],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: !isPro ? _buildProLockPaywall(context) : _buildChronoContent(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProLockPaywall(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.pinkNeon.withOpacity(0.15),
              border: Border.all(color: ColorConstants.pinkNeon.withOpacity(0.5), width: 2),
              boxShadow: [BoxShadow(color: ColorConstants.pinkNeon.withOpacity(0.3), blurRadius: 50)],
            ),
            child: const Icon(Icons.lock_outline, color: ColorConstants.pinkNeon, size: 64),
          ),
          const SizedBox(height: 32),
          Text(
            'PRO FEATURE LOCKED',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'The AI Chrono-Blocker is an elite Pro capability. Upgrade to unlock autonomous calendar synchronization, smart DND injection, and predictive scheduling.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 15, height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          NeonCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildLockFeatureRow(Icons.sync, 'Device Calendar Streams', 'Seamless 2-way sync with Google & Outlook.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.star_border, 'Smart Slots Optimization', 'AI dynamically injects protected focus windows.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.do_not_disturb, 'Autonomous DND Defense', 'Silences distracting notifications automatically.'),
              ],
            ),
          ),
          const SizedBox(height: 48),
          NeonButton(
            text: 'UPGRADE TO PRO NOW',
            isLoading: _isLoadingUpgrade,
            onPressed: _processUpgrade,
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildLockFeatureRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: ColorConstants.neonViolet.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: ColorConstants.neonViolet, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: ColorConstants.textMuted, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChronoContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: AI Chrono-Blocker
          Row(
            children: [
              const Icon(Icons.calendar_today, color: ColorConstants.neonViolet, size: 28),
              const SizedBox(width: 12),
              Text('AI Chrono-Blocker', style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          const SizedBox(height: 6),
          Text('Automated calendar sync matrix', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 14)),
          const SizedBox(height: 28),

          // Segmented Toggle: Device Calendar Streams vs SyncHabit Smart Slots
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
                    onTap: () => setState(() => _isDeviceStreams = true),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        gradient: _isDeviceStreams ? ColorConstants.violetPinkGradient : null,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: _isDeviceStreams ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                      ),
                      child: Center(
                        child: Text(
                          'Device Calendar Streams',
                          style: TextStyle(color: _isDeviceStreams ? Colors.white : ColorConstants.textMuted, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _isDeviceStreams = false),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        gradient: !_isDeviceStreams ? ColorConstants.violetPinkGradient : null,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: !_isDeviceStreams ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 12) : null,
                      ),
                      child: Center(
                        child: Text(
                          'SyncHabit Smart Slots',
                          style: TextStyle(color: !_isDeviceStreams ? Colors.white : ColorConstants.textMuted, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Date Strip Header: TODAY · MAR 15 | 24h view
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TODAY · MAR 15',
                style: TextStyle(letterSpacing: 2.0, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w700),
              ),
              Text(
                '24h view',
                style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Timeline Matrix matching wireframe exactly
          ..._timelineEvents.asMap().entries.map((entry) {
            int idx = entry.key;
            var event = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time Column
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: Text(
                      event['time'],
                      style: const TextStyle(color: ColorConstants.textMuted, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),

                  // Event Card / Container
                  Expanded(
                    child: _buildTimelineCard(event, idx),
                  ),
                ],
              ),
            );
          }).toList(),

          // Smart Slots Bottom Summary Card (Shown when SyncHabit Smart Slots is active)
          if (!_isDeviceStreams) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: ColorConstants.cardSurface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.4), width: 1.5),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.15), blurRadius: 20)],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: ColorConstants.neonViolet.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.bolt, color: ColorConstants.neonViolet, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '3 optimal slots injected today. Estimated 4.5h of protected focus.',
                      style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w600, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 120), // Bottom nav space
        ],
      ),
    );
  }

  Widget _buildTimelineCard(Map<String, dynamic> event, int index) {
    if (event['type'] == 'routine') {
      // Dotted Pill Container
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: ColorConstants.textMuted.withOpacity(0.2), width: 1.5),
        ),
        child: Text(event['title'], style: const TextStyle(color: ColorConstants.textMuted, fontSize: 15)),
      );
    } else if (event['type'] == 'external') {
      // Google / Outlook Calendar Card
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event['title'], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(event['subtitle'], style: const TextStyle(color: ColorConstants.textMuted, fontSize: 13)),
          ],
        ),
      );
    } else {
      // AI Slot Glowing Pink Gradient Card
      bool isConfirmed = event['confirmed'];

      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(28),
          boxShadow: ColorConstants.neonGlow(ColorConstants.pinkNeon, blurRadius: 20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text('AI SLOT', style: TextStyle(letterSpacing: 1.5, color: Colors.white.withOpacity(0.9), fontSize: 11, fontWeight: FontWeight.w800)),
              ],
            ),
            const SizedBox(height: 8),
            Text(event['title'], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(event['subtitle'], style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13)),
            const SizedBox(height: 20),

            // Confirm Block Button
            InkWell(
              onTap: isConfirmed ? null : () => _confirmAiBlock(index),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isConfirmed ? Colors.white.withOpacity(0.25) : ColorConstants.cardSurface.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(isConfirmed ? Icons.check_circle : Icons.notifications_off_outlined, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      isConfirmed ? 'DND Profile Confirmed' : 'Confirm Block & Set DND Profile',
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
