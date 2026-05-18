import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/color_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      body: Stack(
        children: [
          // Subtle Ambient Glow in center
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 120),
                  BoxShadow(color: ColorConstants.blueGlow.withOpacity(0.2), blurRadius: 80),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),

                    // Center Glowing Sync Graphic
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.bgDark,
                        border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 3),
                        boxShadow: [
                          BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.4), blurRadius: 40),
                          const BoxShadow(color: ColorConstants.bgMedium, blurRadius: 20, spreadRadius: 5),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.bgMedium.withOpacity(0.5),
                            border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 2),
                          ),
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _rotationController,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _rotationController.value * 2 * 3.141592653589793,
                                  child: SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: Stack(
                                      children: [
                                        // Gradient Arc / Circular Progress
                                        ShaderMask(
                                          shaderCallback: ColorConstants.violetPinkGradient.createShader,
                                          child: const CircularProgressIndicator(
                                            value: 0.75,
                                            strokeWidth: 6,
                                            backgroundColor: Colors.transparent,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          ),
                                        ),
                                        // Cyan Dot
                                        Positioned(
                                          right: 0,
                                          top: 42,
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorConstants.blueGlow,
                                              boxShadow: ColorConstants.neonGlow(ColorConstants.blueGlow, blurRadius: 8),
                                            ),
                                          ),
                                        ),
                                        // Purple Dot
                                        Positioned(
                                          left: 12,
                                          top: 12,
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorConstants.neonViolet,
                                              boxShadow: ColorConstants.neonGlow(ColorConstants.neonViolet, blurRadius: 8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 56),

                    // Title: SyncHabit
                    Text(
                      'SyncHabit',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: ColorConstants.textPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 48,
                        letterSpacing: -1.0,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Subtitle: Consistency, Decoded.
                    Text(
                      'Consistency, Decoded.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorConstants.textSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const Spacer(flex: 4),

                    // Button: Begin Your Evolution
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [ColorConstants.neonViolet, ColorConstants.pinkNeon],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.neonViolet.withOpacity(0.5),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () => context.go('/login'),
                        child: const Text(
                          'Begin Your Evolution',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Sign in link
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        'Sign in to existing account',
                        style: TextStyle(
                          color: ColorConstants.textMuted.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Spacer(flex: 1),
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
