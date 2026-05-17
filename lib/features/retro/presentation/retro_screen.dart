import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';
import '../../auth/providers/auth_provider.dart';

class RetroScreen extends ConsumerStatefulWidget {
  const RetroScreen({super.key});

  @override
  ConsumerState<RetroScreen> createState() => _RetroScreenState();
}

class _RetroScreenState extends ConsumerState<RetroScreen> {
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
              child: !isPro ? _buildProLockPaywall(context) : _buildRetroContent(context),
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
            child: const Icon(Icons.psychology_outlined, color: ColorConstants.neonViolet, size: 64),
          ),
          const SizedBox(height: 32),
          Text(
            'PRO FEATURE LOCKED',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'The Weekly Retrospective is an elite Pro capability. Upgrade to unlock deep AI diagnostic centers, productivity velocity indexing, and friction heatmaps.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 15, height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          NeonCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildLockFeatureRow(Icons.trending_up, 'Productivity Velocity Index', 'Advanced AI benchmarking of your weekly output.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.show_chart, 'The Velocity Vector', 'Analyze sleep deficit impact on deep focus session length.'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: ColorConstants.cardSurface)),
                _buildLockFeatureRow(Icons.local_fire_department, 'The Friction Heatmap', 'Pinpoint exact times of day when habits most often fail.'),
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

  Widget _buildRetroContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Weekly Retrospective
          Row(
            children: [
              const Icon(Icons.psychology_outlined, color: ColorConstants.neonViolet, size: 28),
              const SizedBox(width: 12),
              Text('Weekly Retrospective', style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          const SizedBox(height: 6),
          Text('Deep AI diagnostic center', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConstants.textSecondary, fontSize: 14)),
          const SizedBox(height: 28),

          // Headline Insight Card matching wireframe exactly
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline Insight Pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.trending_up, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Text('HEADLINE INSIGHT', style: TextStyle(letterSpacing: 1.5, color: Colors.white.withOpacity(0.95), fontSize: 11, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Main Title Text
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.25),
                    children: [
                      const TextSpan(text: 'Your Productivity Velocity Index expanded by '),
                      TextSpan(text: '+14%', style: TextStyle(color: Colors.pinkAccent.shade100)),
                      const TextSpan(text: ' this week.'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 3 Metrics Columns
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildHeadlineMetric('14h 32m', 'Deep focus'),
                    _buildHeadlineMetric('87%', 'Habit completion'),
                    _buildHeadlineMetric('21', 'Streak peak'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section A: The Velocity Vector matching wireframe exactly
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: ColorConstants.cardSurface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SECTION A', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                const Text('The Velocity Vector', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Sleep deficit vs focus session length', style: TextStyle(color: ColorConstants.textSecondary.withOpacity(0.8), fontSize: 13)),
                const SizedBox(height: 36),

                // Custom Line Chart Visualization
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      // Graph Grid Lines
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Divider(color: ColorConstants.textMuted.withOpacity(0.1), thickness: 1),
                          Divider(color: ColorConstants.textMuted.withOpacity(0.1), thickness: 1),
                          Divider(color: ColorConstants.textMuted.withOpacity(0.1), thickness: 1),
                          Divider(color: ColorConstants.textMuted.withOpacity(0.4), thickness: 1.5), // Base axis
                        ],
                      ),

                      // Connecting Lines & Points
                      CustomPaint(
                        size: const Size(double.infinity, 150),
                        painter: _VelocityChartPainter(),
                      ),

                      // Drop Point Label
                      Positioned(
                        bottom: 35,
                        right: 45,
                        child: Row(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstants.pinkNeon,
                                boxShadow: ColorConstants.neonGlow(ColorConstants.pinkNeon, blurRadius: 12),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('drop point', style: TextStyle(color: ColorConstants.pinkNeon, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      // Days Label Strip at bottom
                      Positioned(
                        bottom: 0,
                        left: 45,
                        right: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: ['S', 'M', 'S', 'T', 'F', 'W', 'T'].map((day) => Text(day, style: const TextStyle(color: ColorConstants.textMuted, fontSize: 12, fontWeight: FontWeight.bold))).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text('Thursday: 2.1h sleep deficit cut focus blocks 62%.', style: TextStyle(color: ColorConstants.textSecondary.withOpacity(0.9), fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section B: The Friction Heatmap matching wireframe exactly
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: ColorConstants.cardSurface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, color: ColorConstants.pinkNeon, size: 18),
                    const SizedBox(width: 8),
                    Text('SECTION B', style: TextStyle(letterSpacing: 1.5, color: ColorConstants.textMuted.withOpacity(0.8), fontSize: 11, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('The Friction Heatmap', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('When habits most often fail', style: TextStyle(color: ColorConstants.textSecondary.withOpacity(0.8), fontSize: 13)),
                const SizedBox(height: 36),

                // Heatmap Columns
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildHeatmapColumn('6a', 0.4, ColorConstants.neonViolet.withOpacity(0.4)),
                    _buildHeatmapColumn('9a', 0.7, ColorConstants.neonViolet.withOpacity(0.7)),
                    _buildHeatmapColumn('12p', 0.9, ColorConstants.pinkNeon.withOpacity(0.85)), // Peak failure
                    _buildHeatmapColumn('3p', 0.8, ColorConstants.pinkNeon.withOpacity(0.7)),
                    _buildHeatmapColumn('6p', 0.5, ColorConstants.neonViolet.withOpacity(0.5)),
                    _buildHeatmapColumn('9p', 0.3, ColorConstants.cardSurface),
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

  Widget _buildHeadlineMetric(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13)),
      ],
    );
  }

  Widget _buildHeatmapColumn(String time, double heightFactor, Color color) {
    return Column(
      children: [
        Text(time, style: const TextStyle(color: ColorConstants.textMuted, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          width: 36,
          height: 120 * heightFactor,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
            boxShadow: heightFactor > 0.7 ? ColorConstants.neonGlow(color, blurRadius: 12) : null,
          ),
        ),
      ],
    );
  }
}

class _VelocityChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorConstants.neonViolet
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final glowPaint = Paint()
      ..color = ColorConstants.neonViolet.withOpacity(0.4)
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    // Points matching S, M, S, T, F, W, T
    final points = [
      Offset(50, 30),
      Offset(70, 35),
      Offset(95, 40),
      Offset(120, 50),
      Offset(155, 65),
      Offset(195, 80),
      Offset(245, 115), // Drop point
    ];

    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    // Draw glowing path then solid path
    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()..color = Colors.white;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawCircle(points[i], 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
