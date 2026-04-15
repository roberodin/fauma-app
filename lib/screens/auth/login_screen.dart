import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _giftCodeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _giftCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Top bar with back arrow + centered logo ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: cs.onSurface),
                      iconSize: 24,
                      onPressed: () {
                        if (context.canPop()) context.pop();
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Icon(
                          Icons.eco,
                          size: 32,
                          color: FaumaColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // balance the back button
                  ],
                ),
              ),

              // ── Editorial header ──
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                  children: [
                    Text(
                      'Bienvenido a Fauma',
                      style: GoogleFonts.newsreader(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: cs.onSurface,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Inicia sesión o crea tu cuenta',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: cs.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Social auth buttons ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Google button
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.go('/home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.surfaceContainerLowest,
                          foregroundColor: cs.onSurface,
                          elevation: 0,
                          shape: const StadiumBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaumaImage(
                              imageUrl:
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuA9ZOe0LYPk-_ctgN8MD_oxFb4I8gHI1sdHo3VVuIKbkXQSIglBYca35hAPbO54EtPcw9WMZ0hYev-TqziHm_B5YVey6u956vq36N-971X46PGnRPGy434AXZcBn5lxxFQ7caVRnfEZeMSVRYhT8Rs24HYCEUgR1wvr7RvIRvLl-nXLvF-3PRqO6EiYZ-MI7r2QoRYehKJ16takk8iReukuHblUC7ZsAKI7fCdTim6nd_9OnhgrmQTdGPl_2rgAAmPKjT0F74g-_7vT',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Continuar con Google',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Apple button
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.go('/home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF33302C),
                          foregroundColor: const Color(0xFFF6F0EA),
                          elevation: 0,
                          shape: const StadiumBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.apple, size: 24),
                            const SizedBox(width: 12),
                            Text(
                              'Continuar con Apple',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Divider "o" ──
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'O',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: cs.secondary,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Email form ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Email input
                    SizedBox(
                      height: 56,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: cs.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'tu@email.com',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF6F797A),
                          ),
                          filled: true,
                          fillColor: FaumaColors.surfaceContainerLow,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password input
                    SizedBox(
                      height: 56,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: cs.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF6F797A),
                          ),
                          filled: true,
                          fillColor: FaumaColors.surfaceContainerLow,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFF6F797A),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Iniciar Sesion button (coral gradient)
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              FaumaColors.coralCta,
                              Color(0xFFE57368),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  FaumaColors.coralCta.withValues(alpha: 0.2),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => context.go('/home'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            'Iniciar Sesión',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Secondary links ──
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        '¿No tienes cuenta? Regístrate',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // ── Gift code section ──
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Container(
                  decoration: BoxDecoration(
                    color: FaumaColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // Background decoration icon
                      Positioned(
                        right: -16,
                        top: -16,
                        child: Opacity(
                          opacity: 0.05,
                          child: Icon(
                            Icons.card_giftcard,
                            size: 120,
                            color: cs.onSurface,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('🎁', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 12),
                                Text(
                                  '¿Tienes un código regalo?',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: cs.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: TextField(
                                      controller: _giftCodeController,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: cs.onSurface,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Código',
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: const Color(0xFF6F797A),
                                        ),
                                        filled: true,
                                        fillColor:
                                            FaumaColors.surfaceContainerLowest,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  height: 48,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          FaumaColors.primary,
                                          FaumaColors.primaryContainer,
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(999),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => context.go('/home'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        shape: const StadiumBorder(),
                                      ),
                                      child: Text(
                                        'Canjear',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
