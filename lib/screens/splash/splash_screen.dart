import 'package:fauma_app/widgets/fauma_image.dart';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const _coralStart = Color(0xFFF4847A);
  static const _coralEnd = Color(0xFFE06E64);
  static const _heroImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCXDobMsQPsFZAWBIpKOi081uOYb7YDNZJ_vxiwrmtr4vrMV3ATrGikYwsVkQYagA6Xe2o8QrsgC5uQpMM0U6k8gzm6S_ai224nRuzgNToPjSdzd4WzEB5XDK9bdYGL_1GP9arFx3mDJJ38urA43Koow3kbdAk8u7jgZBn9NaUjzGS8IReTUOJrr_L1ZDarKyXh0ciHItt2wFDP-2B_LXBpN4DYe1cj2SUGUd5raWcNTCxzvnD_v_0t4IW-F4TX82Qpq9Ir4ivHDX4z';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final h = MediaQuery.of(context).size.height;
    final heroH = h * 0.50;

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // ── Hero image (top 50%) ─────────────────────────────
            Positioned(
              top: 0, left: 0, right: 0, height: heroH,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FaumaImage(
                    imageUrl: _heroImageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha:0.3),
                          Colors.transparent,
                          Colors.black.withValues(alpha:0.15),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                  // Branding
                  SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.eco_outlined, color: Colors.white, size: 30),
                          const SizedBox(height: 4),
                          Text('Fauma', style: GoogleFonts.newsreader(
                            fontSize: 32, fontStyle: FontStyle.italic,
                            color: Colors.white,
                            shadows: [const Shadow(color: Color(0x44000000), blurRadius: 8)],
                          )),
                        ],
                      ),
                    ),
                  ),
                  // Badge
                  Positioned(
                    bottom: 48, left: 0, right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha:0.2),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: Colors.white.withValues(alpha:0.2)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.favorite, color: Colors.white, size: 13),
                                const SizedBox(width: 6),
                                Text('12,847 personas ya apoyan', style: GoogleFonts.inter(
                                  fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Content panel (bottom, overlaps hero) ────────────
            Positioned(
              top: heroH - 36,
              left: 0, right: 0, bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha:0.05), blurRadius: 30, offset: const Offset(0, -10))],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(28, 36, 28, MediaQuery.of(context).padding.bottom + 16),
                  child: Column(
                    children: [
                      // Headline
                      Text(
                        'Elige tu causa.\nDescubre su historia.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.newsreader(
                          fontSize: 28, fontWeight: FontWeight.w600,
                          color: cs.onSurface, height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Subtitle
                      Text(
                        'Transforma tu apoyo en una experiencia viva de conservaci\u00f3n. Conecta con proyectos reales.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 14, color: cs.secondary, height: 1.5),
                      ),
                      const Spacer(),
                      // CTA button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => context.go('/onboarding'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _coralStart,
                            foregroundColor: Colors.white,
                            elevation: 8,
                            shadowColor: _coralStart.withValues(alpha: 0.5),
                            shape: const StadiumBorder(),
                            textStyle: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('C\u00f3mo funciona Fauma'),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward_rounded, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Secondary links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => context.go('/login'),
                            child: Text('Iniciar Sesi\u00f3n', style: GoogleFonts.inter(
                              fontSize: 13, fontWeight: FontWeight.w500, color: cs.secondary,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(width: 3, height: 3, decoration: BoxDecoration(color: cs.outlineVariant, shape: BoxShape.circle)),
                          ),
                          Text('\u00bfC\u00f3digo regalo?', style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.w500, color: cs.secondary,
                          )),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Branding
                      Opacity(
                        opacity: 0.08,
                        child: Text('FAUMA', style: GoogleFonts.newsreader(
                          fontSize: 16, fontStyle: FontStyle.italic, letterSpacing: 5, color: cs.onSurface,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
