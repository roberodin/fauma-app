import 'dart:ui';

import 'package:fauma_app/theme/colors.dart';
import 'package:fauma_app/widgets/fauma_image.dart';
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
    final h = MediaQuery.of(context).size.height;
    // HTML: hero is 486px out of min 884px => ~55%
    final heroH = h * 0.55;

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // ── Hero image (top ~55%) ───────────────────────────────
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: heroH,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  FaumaImage(
                    imageUrl: _heroImageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay: from-black/30 via-transparent to-transparent
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.30),
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  // Top app bar: eco icon + "Fauma" title (centered, py-12 = 48px)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.eco_outlined,
                              color: Colors.white,
                              size: 30,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Fauma',
                              style: GoogleFonts.newsreader(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                letterSpacing: -0.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Glassmorphism trust badge: bottom-16 = 64px from hero bottom
                  Positioned(
                    bottom: 64,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9999),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.20),
                              borderRadius: BorderRadius.circular(9999),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.10),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '12,847 personas ya apoyan',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 0.3,
                                  ),
                                ),
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

            // ── Content panel (overlaps hero by 48px, rounded top) ──
            Positioned(
              // HTML: -mt-12 = 48px overlap
              top: heroH - 48,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: FaumaColors.surface,
                  // HTML: rounded-t-[3.5rem] = 56px
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(56),
                  ),
                  // HTML: shadow-[0_-20px_50px_rgba(0,0,0,0.08)]
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 50,
                      offset: const Offset(0, -20),
                    ),
                  ],
                ),
                // HTML: px-8 = 32px, pt-12 = 48px, pb-10 = 40px
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    32,
                    48,
                    32,
                    MediaQuery.of(context).padding.bottom + 40,
                  ),
                  child: Column(
                    children: [
                      // ── Tagline ───────────────────────────────────
                      // HTML: text-4xl (36px), font-semibold, tracking-tight
                      Text(
                        'Elige tu causa.\nDescubre su historia.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.newsreader(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: FaumaColors.onSurface,
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                      ),
                      // HTML: mb-4 = 16px
                      const SizedBox(height: 16),

                      // ── Subtitle ──────────────────────────────────
                      // HTML: text-lg (18px), text-secondary, leading-relaxed, max-w-[280px], mb-10
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 280),
                        child: Text(
                          'Transforma tu apoyo en una\n'
                          'experiencia viva de conservaci\u00f3n.\n'
                          'Conecta con proyectos reales y\n'
                          'recibe contenido exclusivo de los\n'
                          'animales que proteges.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: FaumaColors.secondary,
                            height: 1.625, // leading-relaxed
                          ),
                        ),
                      ),
                      // HTML: mb-10 = 40px
                      const SizedBox(height: 40),

                      // ── Primary CTA button ────────────────────────
                      // HTML: w-full max-w-sm py-5 rounded-full bg-gradient coral
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 384),
                        child: SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [_coralStart, _coralEnd],
                              ),
                              borderRadius: BorderRadius.circular(9999),
                              // HTML: shadow-[0_8px_30px_rgba(244,132,122,0.3)]
                              boxShadow: [
                                BoxShadow(
                                  color: _coralStart.withValues(alpha: 0.30),
                                  blurRadius: 30,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => context.go('/onboarding'),
                                borderRadius: BorderRadius.circular(9999),
                                child: Padding(
                                  // HTML: py-5 = 20px vertical padding
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 24,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'C\u00f3mo funciona Fauma',
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // HTML: mt-8 = 32px
                      const SizedBox(height: 32),

                      // ── Secondary nav links ───────────────────────
                      // HTML: text-sm (14px), font-medium, text-secondary
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => context.go('/login'),
                            child: Text(
                              'Iniciar Sesi\u00f3n',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: FaumaColors.secondary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: FaumaColors.outlineVariant,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Text(
                            '\u00bfTienes un c\u00f3digo regalo?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: FaumaColors.secondary,
                            ),
                          ),
                        ],
                      ),

                      // ── Bottom branding ───────────────────────────
                      // HTML: mt-auto pt-10 = 40px
                      const SizedBox(height: 40),
                      Opacity(
                        opacity: 0.10,
                        child: Text(
                          'FAUMA',
                          style: GoogleFonts.newsreader(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 6,
                            color: FaumaColors.onSurface,
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
      ),
    );
  }
}
