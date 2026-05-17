import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({super.key});

  @override
  ConsumerState<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends ConsumerState<ProScreen> {
  String _selectedPlan = 'Yearly';
  bool _isLoading = false;

  void _processUpgrade() async {
    setState(() { _isLoading = true; });
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    ref.read(authNotifierProvider.notifier).upgradeToPro();
    if (!mounted) return;
    setState(() { _isLoading = false; });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConstants.bgMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28), side: const BorderSide(color: ColorConstants.pinkNeon)),
        title: const Text('PRO UNLOCKED!', style: TextStyle(color: ColorConstants.pinkNeon)),
        content: const Text('Welcome to the elite tier of behavioral momentum. All neural systems, AI injections, and ambient binaural textures are now fully engaged.', style: TextStyle(color: ColorConstants.textSecondary)),
        actions: [
          NeonButton(text: 'ENTER COMMAND CENTER', onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final isPro = user?.isPro ?? false;

    return Scaffold(
      body: Stack(
        children: [
          // Ambient Glows
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.pinkNeon.withOpacity(0.2),
                boxShadow: [BoxShadow(color: ColorConstants.pinkNeon.withOpacity(0.4), blurRadius: 150)],
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 150)],
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
                    // Header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(color: ColorConstants.pinkNeon.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: ColorConstants.pinkNeon)),
                            child: const Text('ELITE PRODUCTIVITY TIER', style: TextStyle(color: ColorConstants.pinkNeon, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5)),
                          ),
                          const SizedBox(height: 16),
                          Text('SYNCHABIT PRO', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 40)),
                          const SizedBox(height: 8),
                          Text('Unlock autonomous AI scheduling, burnout protection, & neural focus audio.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    if (isPro)
                      NeonCard(
                        isGlowing: true,
                        glowColor: ColorConstants.success,
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: ColorConstants.success, size: 32),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PRO MEMBERSHIP ACTIVE', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorConstants.success)),
                                  const SizedBox(height: 4),
                                  Text('You have full access to all premium neural features.', style: Theme.of(context).textTheme.bodyMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    else ...[
                      // Pricing Cards
                      _buildPricingCard('Monthly Plan', '₹99', 'Billed monthly', false),
                      _buildPricingCard('Half Yearly Plan', '₹449', 'Billed every 6 months', false),
                      _buildPricingCard('Yearly Plan', '₹799', 'Billed annually', true), // BEST VALUE
                      const SizedBox(height: 32),

                      // Subscribe Button
                      NeonButton(
                        text: 'UPGRADE TO PRO NOW',
                        isLoading: _isLoading,
                        onPressed: _processUpgrade,
                      ),
                    ],
                    const SizedBox(height: 48),

                    // Feature Checklist
                    Text('PRO CAPABILITIES UNLOCKED', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 20),

                    _buildFeatureRow('Unlimited Protocols & Focus Sessions', 'Track infinite habits and engage deep work without limits.', route: '/focus'),
                    _buildFeatureRow('Advanced AI Burnout Predictor', 'Emotional intelligence engine dynamically scales difficulty.', route: '/safe'),
                    _buildFeatureRow('AI Chrono-Blocker & Calendar Sync', 'Autonomous deep work slot injection & smart DND.', route: '/chrono'),
                    _buildFeatureRow('Binaural Atmospheric Neural Audio', 'Immersive acoustic textures for peak mental state.', route: '/neuro'),
                    _buildFeatureRow('Retrospective AI Reports & PDF Export', 'Weekly productivity velocity & friction diagnostics.', route: '/retro'),
                    _buildFeatureRow('Real-time Cloud Sync & Encrypted Backup', 'Cross-device neural state persistence.', route: '/settings'),

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

  Widget _buildPricingCard(String title, String price, String subtitle, bool isBestValue) {
    final isSelected = _selectedPlan == title.split(' ').first;
    Color glowCol = isBestValue ? ColorConstants.pinkNeon : ColorConstants.neonViolet;

    return GestureDetector(
      onTap: () {
        setState(() { _selectedPlan = title.split(' ').first; });
      },
      child: NeonCard(
        isGlowing: isSelected || isBestValue,
        glowColor: glowCol,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18, color: isSelected ? ColorConstants.textPrimary : ColorConstants.textSecondary)),
                      if (isBestValue) ...[
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: ColorConstants.pinkNeon.withOpacity(0.2), borderRadius: BorderRadius.circular(12), border: Border.all(color: ColorConstants.pinkNeon)),
                          child: const Text('BEST VALUE', style: TextStyle(color: ColorConstants.pinkNeon, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorConstants.textMuted)),
                ],
              ),
            ),
            Text(price, style: Theme.of(context).textTheme.displayMedium?.copyWith(color: isSelected ? ColorConstants.textPrimary : ColorConstants.textSecondary, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String title, String description, {String? route}) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: ColorConstants.neonViolet.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.check, color: ColorConstants.neonViolet, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13, color: ColorConstants.textMuted)),
              ],
            ),
          ),
          if (route != null) ...[
            const SizedBox(width: 12),
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward_ios, color: ColorConstants.neonViolet, size: 16),
            ),
          ],
        ],
      ),
    );

    if (route != null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2)),
        ),
        child: InkWell(
          onTap: () => context.push(route),
          borderRadius: BorderRadius.circular(16),
          child: content,
        ),
      );
    }

    return Padding(padding: const EdgeInsets.only(bottom: 16), child: content);
  }
}
