import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_button.dart';
import '../../../core/widgets/neon_card.dart';

class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({super.key});

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends ConsumerState<FocusScreen> {
  Timer? _timer;
  int _totalSeconds = 45 * 60; // 45 min default block matching wireframe
  int _remainingSeconds = 45 * 60;
  bool _isRunning = true; // Auto start matching active wireframe state
  String _activeSessionName = 'Code Architecture';
  int _sessionCount = 2;

  @override
  void initState() {
    super.initState();
    _startTimerInternal();
  }

  void _startTimerInternal() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0 && _isRunning) {
        setState(() {
          _remainingSeconds--;
        });
      } else if (_remainingSeconds <= 0) {
        _stopTimer();
        HapticFeedback.vibrate();
        _showCompletionModal();
      }
    });
  }

  void _togglePlayPause() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _stopTimer() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isRunning = false;
      _remainingSeconds = _totalSeconds;
    });
  }

  void _addFiveMinutes() {
    HapticFeedback.lightImpact();
    setState(() {
      _totalSeconds += 5 * 60;
      _remainingSeconds += 5 * 60;
    });
  }

  void _reduceToTenMinutes() {
    HapticFeedback.heavyImpact();
    setState(() {
      _totalSeconds = 10 * 60;
      _remainingSeconds = 10 * 60;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Micro-adjustment applied: 10m block active.'), backgroundColor: ColorConstants.cardSurface),
    );
  }

  void _switchToReading() {
    HapticFeedback.heavyImpact();
    setState(() {
      _activeSessionName = 'Reading Habit';
      _totalSeconds = 30 * 60;
      _remainingSeconds = 30 * 60;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Protocol switched to Reading Habit.'), backgroundColor: ColorConstants.cardSurface),
    );
  }

  void _showCompletionModal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConstants.bgMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28), side: const BorderSide(color: ColorConstants.success)),
        title: const Text('Deep Work Complete!', style: TextStyle(color: ColorConstants.success)),
        content: const Text('Session logged successfully. Neural recovery period of 5 minutes is recommended.', style: TextStyle(color: ColorConstants.textSecondary)),
        actions: [
          NeonButton(text: 'START RECOVERY', onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = 1.0 - (_remainingSeconds / _totalSeconds);
    String minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    String totalMinutesStr = (_totalSeconds ~/ 60).toString();

    return Scaffold(
      body: Stack(
        children: [
          // Ambient Glows matching wireframe
          Positioned(
            top: 200,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isRunning ? ColorConstants.neonViolet.withOpacity(0.2) : ColorConstants.blueGlow.withOpacity(0.1),
                boxShadow: [BoxShadow(color: _isRunning ? ColorConstants.neonViolet.withOpacity(0.4) : ColorConstants.blueGlow.withOpacity(0.2), blurRadius: 150)],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    // Header: DEEP WORK
                    Text(
                      'DEEP WORK',
                      style: TextStyle(
                        letterSpacing: 4.0,
                        color: ColorConstants.textMuted.withOpacity(0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle: Session 02 · Code Architecture
                    Text(
                      'Session 0$_sessionCount · $_activeSessionName',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 56),

                    // Circular Animated Timer matching wireframe exactly
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 8,
                            backgroundColor: ColorConstants.cardSurface.withOpacity(0.5),
                            valueColor: AlwaysStoppedAnimation<Color>(_isRunning ? ColorConstants.pinkNeon : ColorConstants.neonViolet),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'REMAINING',
                              style: TextStyle(
                                letterSpacing: 2.0,
                                color: ColorConstants.textMuted.withOpacity(0.8),
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$minutes:$seconds',
                              style: const TextStyle(
                                fontSize: 68,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFeatures: [FontFeature.tabularFigures()],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'of $totalMinutesStr:00 block',
                              style: const TextStyle(
                                color: ColorConstants.textMuted,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),

                    // 3-Button Control Row: [ X ], [ || ], [ +5m ]
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cancel Button [ X ]
                        InkWell(
                          onTap: _stopTimer,
                          borderRadius: BorderRadius.circular(36),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.cardSurface.withOpacity(0.6),
                              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1.5),
                            ),
                            child: const Icon(Icons.close, color: ColorConstants.textSecondary, size: 24),
                          ),
                        ),
                        const SizedBox(width: 28),

                        // Play/Pause Button [ || ]
                        InkWell(
                          onTap: _togglePlayPause,
                          borderRadius: BorderRadius.circular(48),
                          child: Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon]),
                              boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 24),
                            ),
                            child: Icon(_isRunning ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 38),
                          ),
                        ),
                        const SizedBox(width: 28),

                        // Add 5 Min Button [ +5m ]
                        InkWell(
                          onTap: _addFiveMinutes,
                          borderRadius: BorderRadius.circular(36),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.cardSurface.withOpacity(0.6),
                              border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1.5),
                            ),
                            child: const Center(
                              child: Text(
                                '+5m',
                                style: TextStyle(color: ColorConstants.textSecondary, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),

                    // Friction Detected Card matching wireframe
                    NeonCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.auto_awesome, color: ColorConstants.pinkNeon, size: 20),
                              const SizedBox(width: 10),
                              Text(
                                'FRICTION DETECTED',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: ColorConstants.pinkNeon.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Keep your streak alive with a micro-adjustment.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.95),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Pill Button 1: Reduce focus block to 10m
                          _buildMicroAdjustmentPill(
                            label: 'Reduce focus block to 10m',
                            onTap: _reduceToTenMinutes,
                          ),
                          const SizedBox(height: 16),

                          // Pill Button 2: Switch to Reading Habit
                          _buildMicroAdjustmentPill(
                            label: 'Switch to Reading Habit',
                            onTap: _switchToReading,
                          ),
                        ],
                      ),
                    ),
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

  Widget _buildMicroAdjustmentPill({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
