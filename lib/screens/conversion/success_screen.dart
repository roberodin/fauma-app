import 'package:fauma_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Success Icon with particles ──────────────────
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main circle
                      Center(
                        child: Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FaumaColors.primary,
                            boxShadow: [
                              BoxShadow(
                                color: FaumaColors.primary
                                    .withValues(alpha: 0.3),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 48,
                            weight: 600,
                          ),
                        ),
                      ),
                      // Particle top-right
                      Positioned(
                        top: -4,
                        right: 8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FaumaColors.coralCta
                                .withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                      // Particle left
                      Positioned(
                        top: 48,
                        left: -8,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FaumaColors.primary
                                .withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                      // Particle bottom
                      Positioned(
                        bottom: 8,
                        right: 32,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FaumaColors.secondary
                                .withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // ── Title ─────────────────────────────────────────
                Text(
                  '\u00A1Bienvenido, h\u00E9roe!',
                  style: GoogleFonts.newsreader(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: FaumaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 12),

                // ── Subtitle ──────────────────────────────────────
                SizedBox(
                  width: 280,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: FaumaColors.secondary,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                            text: 'Tu suscripci\u00F3n a '),
                        TextSpan(
                          text: 'Tortuga Caretta caretta',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                        const TextSpan(
                            text: ' ya est\u00E1 activa.'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // ── Summary Card ──────────────────────────────────
                _buildSummaryCard(),
                const SizedBox(height: 40),

                // ── CTAs ──────────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.go('/explore/species/caretta/subscriber'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FaumaColors.coralCta,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      padding:
                          const EdgeInsets.symmetric(vertical: 20),
                      elevation: 8,
                      shadowColor: FaumaColors.onSurface
                          .withValues(alpha: 0.05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Conocer a tu tortuga',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.trending_flat, size: 24),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: () => context.go('/home'),
                  child: Text(
                    'Ir al inicio',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 64),

                // ── Ecological Seal ───────────────────────────────
                Opacity(
                  opacity: 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.eco,
                          size: 14, color: FaumaColors.onSurface),
                      const SizedBox(width: 8),
                      Text(
                        'FAUMA CONSERVATION ALLIANCE',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: FaumaColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Summary Card ────────────────────────────────────────────────
  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESUMEN DE IMPACTO',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: FaumaColors.secondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Nivel: Hermano',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: FaumaColors.primary,
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  const Icon(Icons.auto_stories,
                      color: FaumaColors.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: FaumaColors.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Pr\u00F3ximo contenido: '),
                          TextSpan(
                            text: 'en 2 d\u00EDas',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: FaumaColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.local_shipping,
                      color: FaumaColors.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: FaumaColors.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Tu peluche llegar\u00E1 en '),
                          TextSpan(
                            text: '7-10 d\u00EDas',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: FaumaColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Decorative circle
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: FaumaColors.primary.withValues(alpha: 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
