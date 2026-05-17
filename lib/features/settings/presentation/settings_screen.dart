import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _hapticsEnabled = true;
  bool _cloudSyncEnabled = true;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorConstants.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text('SYSTEM CONFIGURATION', style: TextStyle(color: ColorConstants.textPrimary, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.0)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            NeonCard(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: ColorConstants.cardSurface,
                    backgroundImage: user?.photoUrl != null ? NetworkImage(user!.photoUrl!) : null,
                    child: user?.photoUrl == null ? const Icon(Icons.person, color: ColorConstants.textPrimary, size: 32) : null,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user?.displayName ?? 'NEURAL GUEST', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Text(user?.email ?? 'guest@synchabit.local', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textMuted)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: (user?.isPro ?? false ? ColorConstants.pinkNeon : ColorConstants.blueGlow).withOpacity(0.2), borderRadius: BorderRadius.circular(12), border: Border.all(color: user?.isPro ?? false ? ColorConstants.pinkNeon : ColorConstants.blueGlow)),
                          child: Text(user?.isPro ?? false ? 'PRO TIER ACTIVE' : 'FREE TIER', style: TextStyle(color: user?.isPro ?? false ? ColorConstants.pinkNeon : ColorConstants.blueGlow, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Text('PREFERENCES', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            NeonCard(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  _buildSwitchRow('Push Notifications', 'Daily reminders & AI insights', _notificationsEnabled, (val) { setState(() { _notificationsEnabled = val; }); }),
                  const Divider(color: ColorConstants.cardSurface),
                  _buildSwitchRow('Haptic Feedback', 'Vibrations during timer & completion', _hapticsEnabled, (val) { setState(() { _hapticsEnabled = val; }); }),
                  const Divider(color: ColorConstants.cardSurface),
                  _buildSwitchRow('Real-time Cloud Sync', 'Encrypted state persistence', _cloudSyncEnabled, (val) { setState(() { _cloudSyncEnabled = val; }); }),
                ],
              ),
            ),
            const SizedBox(height: 48),

            NeonButton(
              text: 'TERMINATE SESSION (LOGOUT)',
              isSecondary: true,
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
                context.go('/login');
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchRow(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13, color: ColorConstants.textMuted)),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: ColorConstants.neonViolet,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
