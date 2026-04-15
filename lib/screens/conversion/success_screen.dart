import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

const _kCoral = Color(0xFFF4847A);

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Success Icon with particles ──────────────
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
                            color: cs.primary,
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary
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
                            color: _kCoral.withValues(alpha: 0.4),
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
                            color: cs.primary
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
                            color: cs.secondary
                                .withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // ── Title ──────────────────────────────────
                Text(
                  '\u00A1Bienvenido, heroe!',
                  style: GoogleFonts.newsreader(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 12),

                // ── Subtitle ───────────────────────────────
                SizedBox(
                  width: 280,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: cs.secondary,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                            text: 'Tu suscripcion a '),
                        TextSpan(
                          text: 'Tortuga Caretta caretta',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        const TextSpan(
                            text: ' ya esta activa.'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // ── Summary Card ───────────────────────────
                _buildSummaryCard(cs),
                const SizedBox(height: 40),

                // ── CTAs ───────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.go('/my-animals/caretta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kCoral,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      padding:
                          const EdgeInsets.symmetric(vertical: 20),
                      elevation: 8,
                      shadowColor:
                          cs.onSurface.withValues(alpha: 0.05),
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
                      color: cs.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 64),

                // ── Ecological Seal ─────────────────────────
                Opacity(
                  opacity: 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.eco, size: 14, color: cs.onSurface),
                      const SizedBox(width: 8),
                      Text(
                        'FAUMA CONSERVATION ALLIANCE',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: cs.onSurface,
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

  // ── Summary Card ──────────────────────────────────────────────
  Widget _buildSummaryCard(ColorScheme cs) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
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
                  color: cs.secondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Nivel: Hermano',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: cs.primary,
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Icon(Icons.auto_stories,
                      color: cs.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: cs.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Proximo contenido: '),
                          TextSpan(
                            text: 'en 2 dias',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: cs.onSurfaceVariant,
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
                  Icon(Icons.local_shipping,
                      color: cs.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: cs.onSurfaceVariant,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Tu peluche llegara en '),
                          TextSpan(
                            text: '7-10 dias',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: cs.onSurfaceVariant,
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
                color: cs.primary.withValues(alpha: 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
