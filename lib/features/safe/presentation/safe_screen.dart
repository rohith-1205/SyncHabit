import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class SafeScreen extends ConsumerStatefulWidget {
  const SafeScreen({super.key});

  @override
  ConsumerState<SafeScreen> createState() => _SafeScreenState();
}

class _SafeScreenState extends ConsumerState<SafeScreen> {
  bool _sicknessActive = true;
  bool _workloadActive = false;
  bool _travelActive = false;
  bool _isLoadingUpgrade = false;

  void _processUpgrade() async {
    setState(() { _isLoadingUpgrade = true; });
    await Future.delayed(const Duration(seconds: 1));
    ref.read(authNotifierProvider.notifier).upgradeToPro();
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
          // Background Glows
          Positioned(
            top: 200,
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
              child: !isPro ? _buildProLockPaywall(context) : _buildSafeContent(context),
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
              color: ColorConstants.neonViolet.withOpacity(0.15),
              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.5), width: 2),
              boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 50)],
            ),
            child: const Icon(Icons.shield_outlined, color: ColorConstants.neonViolet, size: 64),
          ),
          const SizedBox(height: 32),
          Text(
            'PRO FEATURE LOCKED',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'The Break-Safe Engine is an elite Pro capability. Upgrade to unlock autonomous burnout shielding, dynamic difficulty adjustment, and streak freeze protocols.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 15, height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          NeonCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildLockFeatureRow(Icons.favorite_border, 'Sickness & Recovery Protocol', 'Cleanly freeze active streaks without penalty.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.work_outline, 'Extreme Workload Shift', 'Dynamically scale habits down to micro-steps.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.flight_takeoff, 'Timezone & Travel Alignment', 'Seamlessly adapt reminder matrices on the go.'),
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

  Widget _buildSafeContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Break-Safe Engine
          Row(
            children: [
              const Icon(Icons.shield_outlined, color: ColorConstants.neonViolet, size: 28),
              const SizedBox(width: 12),
              Text('Break-Safe Engine', style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          const SizedBox(height: 6),
          Text('Burnout & lapse prevention', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 14)),
          const SizedBox(height: 36),

          // Subtitle matching wireframe exactly
          Text('Life happens.', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 4),
          Text('Protect your progress framework.', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28, fontWeight: FontWeight.w600, color: ColorConstants.textSecondary)),
          const SizedBox(height: 36),

          // Protocol 1: Sickness / Recovery Protocol
          _buildProtocolCard(
            title: 'Sickness / Recovery Protocol',
            statusText: _sicknessActive ? 'Active · expires in 47h 12m' : 'Tap to activate',
            icon: Icons.favorite_border,
            isActive: _sicknessActive,
            onChanged: (val) => setState(() => _sicknessActive = val),
            description: 'Freezes all active streaks cleanly without penalty for 48 hours. Notifications soften.',
          ),
          const SizedBox(height: 20),

          // Protocol 2: Extreme Workload Shift
          _buildProtocolCard(
            title: 'Extreme Workload Shift',
            statusText: _workloadActive ? 'Active · scaling engaged' : 'Tap to activate',
            icon: Icons.work_outline,
            isActive: _workloadActive,
            onChanged: (val) => setState(() => _workloadActive = val),
            description: 'Applies the Dynamic Difficulty Module to scale all habits down to 5-minute micro-steps.',
          ),
          const SizedBox(height: 20),

          // Protocol 3: Travel / Change of Timezone
          _buildProtocolCard(
            title: 'Travel / Change of Timezone',
            statusText: _travelActive ? 'Active · syncing timezone' : 'Tap to activate',
            icon: Icons.flight_takeoff,
            isActive: _travelActive,
            onChanged: (val) => setState(() => _travelActive = val),
            description: 'Re-aligns target reminder notification matrices seamlessly to destination coordinates via background sync.',
          ),
          const SizedBox(height: 36),

          // Bottom Preview Card matching wireframe exactly
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: ColorConstants.cardSurface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
              boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.1), blurRadius: 20)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SAFETY PREVIEW', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w800)),
                const SizedBox(height: 12),
                const Text('Current Streaks Safely Anchored until Monday.', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),

                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.65, // Partially filled matching screenshot
                    minHeight: 10,
                    backgroundColor: ColorConstants.bgDark,
                    valueColor: const AlwaysStoppedAnimation<Color>(ColorConstants.neonViolet),
                  ),
                ),
                const SizedBox(height: 12),

                // Dates Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Now · Fri', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w600)),
                    Text('Mon 06:00', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 120), // Bottom nav space
        ],
      ),
    );
  }

  Widget _buildProtocolCard({
    required String title,
    required String statusText,
    required IconData icon,
    required bool isActive,
    required ValueChanged<bool> onChanged,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.neonViolet.withOpacity(0.15) : ColorConstants.cardSurface.withOpacity(0.6),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: isActive ? ColorConstants.neonViolet : ColorConstants.neonViolet.withOpacity(0.2),
          width: isActive ? 2.0 : 1.5,
        ),
        boxShadow: isActive ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 16) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isActive ? ColorConstants.neonViolet.withOpacity(0.25) : ColorConstants.cardSurface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(icon, color: isActive ? ColorConstants.neonViolet : ColorConstants.textMuted, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(statusText, style: TextStyle(color: isActive ? ColorConstants.textSecondary : ColorConstants.textMuted, fontSize: 13)),
                  ],
                ),
              ),
              Switch(
                value: isActive,
                activeColor: ColorConstants.neonViolet,
                inactiveThumbColor: ColorConstants.textMuted,
                inactiveTrackColor: ColorConstants.bgDark,
                onChanged: onChanged,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: ColorConstants.cardSurface)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(description, style: TextStyle(color: ColorConstants.textSecondary.withOpacity(0.9), fontSize: 14, height: 1.3)),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.keyboard_arrow_down, color: ColorConstants.textMuted, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
