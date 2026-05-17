import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/neon_card.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) {
      if (next.value != null) {
        context.go('/hub');
      }
    });

    return Scaffold(
      backgroundColor: ColorConstants.bgDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Create Profile',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background subtle glow on bottom right
          Positioned(
            bottom: 0,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.neonViolet.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.3), blurRadius: 120),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Header: Join the Sync.
                    Text(
                      'Join the\nSync.',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 42,
                        height: 1.1,
                        letterSpacing: -1.0,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      'Three seconds to a smarter habit loop.',
                      style: TextStyle(
                        color: ColorConstants.textSecondary.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Continue with Google Button
                    _buildPillButton(
                      icon: Icons.g_mobiledata,
                      iconColor: Colors.white,
                      label: 'Continue with Google',
                      onTap: () => ref.read(authNotifierProvider.notifier).loginWithGoogle(),
                    ),

                    const SizedBox(height: 20),

                    // Continue with Apple Button
                    _buildPillButton(
                      icon: Icons.apple,
                      iconColor: Colors.white,
                      label: 'Continue with Apple',
                      onTap: () => ref.read(authNotifierProvider.notifier).loginWithApple(),
                    ),

                    const SizedBox(height: 20),

                    // Email Input Field
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: ColorConstants.cardSurface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          const Icon(Icons.mail_outline, color: ColorConstants.textMuted, size: 22),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'name@email.com',
                                hintStyle: TextStyle(color: ColorConstants.neonViolet.withOpacity(0.6), fontSize: 16),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (val) {
                                if (val.isNotEmpty) {
                                  ref.read(authNotifierProvider.notifier).loginWithEmail(val, 'password');
                                }
                              },
                            ),
                          ),
                          if (authState.isLoading)
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.neonViolet)),
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.arrow_forward, color: ColorConstants.neonViolet, size: 20),
                              onPressed: () {
                                final email = _emailController.text.isNotEmpty ? _emailController.text : 'alex@synchabit.ai';
                                ref.read(authNotifierProvider.notifier).loginWithEmail(email, 'password');
                              },
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 56),

                    // Bottom Guest Card: ZERO FRICTION
                    GestureDetector(
                      onTap: () => ref.read(authNotifierProvider.notifier).loginAsGuest(),
                      child: NeonCard(
                        isGlowing: true,
                        glowColor: ColorConstants.neonViolet,
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ZERO FRICTION',
                                    style: TextStyle(
                                      color: ColorConstants.textMuted.withOpacity(0.8),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Want to try it out first?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Explore as Guest',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillButton({
    required IconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color: ColorConstants.cardSurface.withOpacity(0.6),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
