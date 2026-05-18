import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class NeuroScreen extends ConsumerStatefulWidget {
  const NeuroScreen({super.key});

  @override
  ConsumerState<NeuroScreen> createState() => _NeuroScreenState();
}

class _NeuroScreenState extends ConsumerState<NeuroScreen> {
  String _activeSound = '40Hz Binaural Focus Beats';
  bool _isPlaying = true;
  double _transparency = 0.62;
  bool _isLoadingUpgrade = false;

  final List<Map<String, dynamic>> _sounds = [
    {
      'title': '40Hz Binaural Focus Beats',
      'subtitle': 'Gamma entrainment',
      'icon': Icons.waves,
      'color': ColorConstants.neonViolet,
    },
    {
      'title': 'Deep Space Ambient Texture',
      'subtitle': 'Cosmic drone · 12 min loop',
      'icon': Icons.public,
      'color': ColorConstants.blueGlow,
    },
    {
      'title': 'Rain on Velvet Canopy',
      'subtitle': 'ASMR · soft layer',
      'icon': Icons.water_drop_outlined,
      'color': ColorConstants.success,
    },
    {
      'title': 'Brownian Cognitive Noise',
      'subtitle': 'Low-end masking',
      'icon': Icons.blur_on,
      'color': ColorConstants.pinkNeon,
    },
  ];

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
          // Background Ambient Glows
          Positioned(
            top: 150,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isPlaying ? ColorConstants.neonViolet.withOpacity(0.2) : ColorConstants.neonViolet.withOpacity(0.05),
                boxShadow: [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.4), blurRadius: 150)],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: !isPro ? _buildProLockPaywall(context) : _buildNeuroContent(context),
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
            child: const Icon(Icons.headphones_outlined, color: ColorConstants.neonViolet, size: 64),
          ),
          const SizedBox(height: 32),
          Text(
            'PRO FEATURE LOCKED',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Neuro-Focus is an elite Pro capability. Upgrade to unlock binaural atmospheric synthesis, gamma entrainment beats, and deep work acoustic textures.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 15, height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          NeonCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildLockFeatureRow(Icons.waves, '40Hz Binaural Beats', 'Pure gamma entrainment for maximum cognitive velocity.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.public, 'Deep Space Ambient', 'Immersive acoustic drones designed for deep coding.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.tune, 'Audio Transparency Matrix', 'Perfectly balance focus beats with external surroundings.'),
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

  Widget _buildNeuroContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Neuro-Focus
          Row(
            children: [
              const Icon(Icons.headphones_outlined, color: ColorConstants.neonViolet, size: 28),
              const SizedBox(width: 12),
              Text('Neuro-Focus', style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          const SizedBox(height: 6),
          Text('Ambient soundscape matrix', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 14)),
          const SizedBox(height: 36),

          // Radial Visualization matching wireframe exactly
          Center(
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.cardSurface.withOpacity(0.3),
                border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.4), width: 2),
                boxShadow: _isPlaying ? [BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.2), blurRadius: 30)] : null,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animated glowing ticks representing sound waves
                  if (_isPlaying)
                    ...List.generate(36, (index) {
                      final double angle = index * (3.6) * 3.141592653589793 / 18; // 36 ticks around circle
                      return Transform.rotate(
                        angle: angle,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 3,
                            height: index % 3 == 0 ? 16 : 10,
                            decoration: BoxDecoration(
                              color: index % 3 == 0 ? ColorConstants.neonViolet : ColorConstants.pinkNeon.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 8),
                            ),
                          ),
                        ),
                      );
                    }).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(begin: const Offset(0.96, 0.96), end: const Offset(1.04, 1.04)),

                  // Centered Text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SESSION TYPE', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.neonViolet.withOpacity(0.9), fontSize: 11, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      const Text('Deep Coding', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 6),
                      Text('Focus intensity 78%', style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // 2x2 Soundscape Grid matching wireframe exactly
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.15,
            children: _sounds.map((sound) {
              final isSelected = _activeSound == sound['title'];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _activeSound = sound['title'];
                    _isPlaying = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isSelected ? ColorConstants.neonViolet.withOpacity(0.15) : ColorConstants.cardSurface.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected ? ColorConstants.neonViolet : ColorConstants.neonViolet.withOpacity(0.15),
                      width: isSelected ? 2.0 : 1.5,
                    ),
                    boxShadow: isSelected ? ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 16) : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? sound['color'].withOpacity(0.25) : ColorConstants.cardSurface,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(sound['icon'], color: isSelected ? sound['color'] : ColorConstants.textMuted, size: 22),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sound['title'],
                            style: TextStyle(
                              color: isSelected ? Colors.white : ColorConstants.textSecondary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            sound['subtitle'],
                            style: TextStyle(color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),

          // Bottom Control Card matching wireframe exactly
          NeonCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('AUDIO TRANSPARENCY', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w800)),
                    Text('${(_transparency * 100).toInt()}%', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: ColorConstants.neonViolet,
                    inactiveTrackColor: ColorConstants.cardSurface,
                    thumbColor: Colors.white,
                    overlayColor: ColorConstants.neonViolet.withOpacity(0.2),
                    trackHeight: 6,
                  ),
                  child: Slider(
                    value: _transparency,
                    onChanged: (val) => setState(() => _transparency = val),
                  ),
                ),
                const SizedBox(height: 24),

                // Collapse Button
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('🎧 Floating mini-widget active!'), backgroundColor: ColorConstants.neonViolet),
                    );
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      gradient: ColorConstants.violetPinkGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close_fullscreen, color: Colors.white, size: 20),
                        SizedBox(width: 12),
                        Text('Collapse to Mini-Floating Widget', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 120), // Bottom nav space
        ],
      ),
    );
  }
}
