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
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isSignUp = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submitAuth() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email'), backgroundColor: ColorConstants.neonViolet, behavior: SnackBarBehavior.floating),
      );
      return;
    }
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password'), backgroundColor: ColorConstants.neonViolet, behavior: SnackBarBehavior.floating),
      );
      return;
    }

    if (_isSignUp) {
      final displayName = name.isNotEmpty ? name : email.split('@').first.toUpperCase();
      ref.read(authNotifierProvider.notifier).signUpWithEmail(email, password, displayName);
    } else {
      ref.read(authNotifierProvider.notifier).loginWithEmail(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString().replaceAll('Failure: ', '')),
            backgroundColor: ColorConstants.neonViolet,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else if (next.hasValue && next.value != null) {
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
        title: Text(
          _isSignUp ? 'Create Profile' : 'Welcome Back',
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                    const SizedBox(height: 10),

                    // Header: Join the Sync. / Welcome Back.
                    Text(
                      _isSignUp ? 'Join the\nSync.' : 'Welcome\nBack.',
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
                      _isSignUp ? 'Three seconds to a smarter habit loop.' : 'Sync your neural habits seamlessly.',
                      style: TextStyle(
                        color: ColorConstants.textSecondary.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Continue with Google Button
                    _buildPillButton(
                      icon: Icons.g_mobiledata,
                      iconColor: Colors.white,
                      label: 'Continue with Google',
                      onTap: () => ref.read(authNotifierProvider.notifier).loginWithGoogle(),
                    ),

                    const SizedBox(height: 32),

                    // Divider: OR
                    Row(
                      children: [
                        Expanded(child: Divider(color: ColorConstants.neonViolet.withOpacity(0.3), thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR EMAIL',
                            style: TextStyle(color: ColorConstants.neonViolet.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2),
                          ),
                        ),
                        Expanded(child: Divider(color: ColorConstants.neonViolet.withOpacity(0.3), thickness: 1)),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Sign In / Sign Up Mode Toggle Tabs
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorConstants.cardSurface.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.2), width: 1),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isSignUp = false),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !_isSignUp ? ColorConstants.neonViolet : Colors.transparent,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: !_isSignUp ? Colors.white : ColorConstants.textMuted,
                                    fontSize: 15,
                                    fontWeight: !_isSignUp ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isSignUp = true),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _isSignUp ? ColorConstants.neonViolet : Colors.transparent,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: _isSignUp ? Colors.white : ColorConstants.textMuted,
                                    fontSize: 15,
                                    fontWeight: _isSignUp ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Display Name Input Field (Visible only on Sign Up)
                    if (_isSignUp) ...[
                      _buildInputField(
                        controller: _nameController,
                        icon: Icons.person_outline,
                        hintText: 'Display Name',
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Email Input Field
                    _buildInputField(
                      controller: _emailController,
                      icon: Icons.mail_outline,
                      hintText: 'name@email.com',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(height: 16),

                    // Password Input Field
                    _buildInputField(
                      controller: _passwordController,
                      icon: Icons.lock_outline,
                      hintText: 'Password',
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _submitAuth(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: ColorConstants.textMuted, size: 20),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Action Button (Sign In / Sign Up)
                    InkWell(
                      onTap: authState.isLoading ? null : _submitAuth,
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        height: 64,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorConstants.neonViolet,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(color: ColorConstants.neonViolet.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8)),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: authState.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2.5, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                              )
                            : Text(
                                _isSignUp ? 'Create Account' : 'Sign In',
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                              ),
                      ),
                    ),

                    const SizedBox(height: 48),

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

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    void Function(String)? onSubmitted,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: ColorConstants.cardSurface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: ColorConstants.neonViolet.withOpacity(0.3), width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Icon(icon, color: ColorConstants.textMuted, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ColorConstants.neonViolet.withOpacity(0.6), fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          if (suffixIcon != null) suffixIcon,
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
