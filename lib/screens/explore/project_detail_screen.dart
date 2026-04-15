import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

// ── Image URLs from Stitch HTML ─────────────────────────────────────────────
const _heroImageUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDouoOvg36oN4eIecD5NkhSHP-qfyslsJdeUCR5G3TwPgGTukaRXw0GFrAta1pVuE1hJt8Y33q6yRdssWwBmnP-CL9YDGend33L82hBIMo2ewyc3wj8xK5vQUCZAhAZh6NVd3-5EmqFNkAVSy-c__l77akKSICRH6NUAyvF56v9LQDbrL1kOJPMpU0xTxPPuPOwnqIQFyPBGo7EYp78cO5ViE6Q-Vo_WfnLIbbjyVbw5G3DPNpWNdfINrCrwpDhfZeR4Lh8dArYqpVb';


/// Public presentation view of a project (pre-subscription).
class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Hero image (530px from Stitch) ──
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 530,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FaumaImage(
                        imageUrl: _heroImageUrl,
                        fit: BoxFit.cover,
                      ),
                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              cs.surface,
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.2),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                      // Back button + badge overlay
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 16,
                        child: Row(
                          children: [
                            _GlassBadgeButton(
                              icon: Icons.arrow_back,
                              onTap: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.go('/explore');
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                'PROYECTO ACTIVO',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Content canvas (overlapping hero by -48px) ──
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -48),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 3. Headline
                        Text(
                          'Proyecto Pintarroja',
                          style: GoogleFonts.newsreader(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Scyliorhinus canicula',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: FaumaColors.secondary.withValues(alpha: 0.7),
                          ),
                        ),

                        // 4. Banner phrase
                        const SizedBox(height: 16),
                        Text(
                          '"No hace falta ser grande para importar."',
                          style: GoogleFonts.newsreader(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: FaumaColors.primaryContainer,
                          ),
                        ),

                        // 5. Stats row
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: _StatCell(
                                icon: Icons.shield,
                                label: 'IUCN',
                                value: 'Preocupación menor',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _StatCell(
                                icon: Icons.trending_flat,
                                label: 'TENDENCIA',
                                value: 'Estable',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _StatCell(
                                icon: Icons.scale,
                                label: 'PESO',
                                value: '~1 kg',
                              ),
                            ),
                          ],
                        ),

                        // 6. Mini-presentation
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: FaumaColors.outlineVariant
                                  .withValues(alpha: 0.4),
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: cs.onSurface,
                                height: 1.7,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'La pintarroja es un pequeño tiburón de fondo, esencial en los ecosistemas mediterráneos. Sus huevos, conocidos popularmente como ',
                                ),
                                TextSpan(
                                  text: 'bolsos de sirena',
                                  style: GoogleFonts.newsreader(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: FaumaColors.primary,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ', son cápsulas coriáceas que se enganchan a corales y algas, protegiendo al embrión durante su desarrollo.',
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 7. Importance & Why support
                        const SizedBox(height: 24),
                        _ImportanceRow(
                          iconBgColor:
                              FaumaColors.primary.withValues(alpha: 0.1),
                          icon: Icons.eco,
                          iconColor: FaumaColors.primary,
                          title: 'Importancia Ecológica',
                          titleColor: FaumaColors.primary,
                          description:
                              'Controla las poblaciones de crustáceos y moluscos, manteniendo el equilibrio de los fondos marinos.',
                        ),
                        const SizedBox(height: 24),
                        _ImportanceRow(
                          iconBgColor:
                              FaumaColors.tertiary.withValues(alpha: 0.1),
                          icon: Icons.favorite,
                          iconColor: FaumaColors.tertiary,
                          title: '¿Por qué apoyar?',
                          titleColor: FaumaColors.tertiary,
                          description:
                              'Es una especie modelo para estudiar la evolución de los vertebrados y la regeneración de hábitats marinos degradados.',
                        ),

                        // 8. Vertical timeline — Fases del Proyecto
                        const SizedBox(height: 48),
                        _buildPhasesSection(),

                        // 9. Collaborators
                        const SizedBox(height: 40),
                        Text(
                          'COLABORADORES',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.secondary,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _CollaboratorName('Asociación LAMNA'),
                              const SizedBox(width: 32),
                              _CollaboratorName('Fundación Oceanogràfic'),
                              const SizedBox(width: 32),
                              _CollaboratorName('Fundación Azul Marino'),
                            ],
                          ),
                        ),

                        // Bottom spacing for CTA
                        const SizedBox(height: 140),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ── Sticky bottom CTA ──
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  24, 16, 24, MediaQuery.of(context).padding.bottom + 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    cs.surface,
                    cs.surface,
                    cs.surface.withValues(alpha: 0),
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/conversion/level/${widget.id}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FaumaColors.coralCta,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: FaumaColors.coralCta.withValues(alpha: 0.3),
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apoyar este proyecto — desde 4,99\u20AC/mes',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Phases timeline ─────────────────────────────────────────────────
  Widget _buildPhasesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: FaumaColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Fases del Proyecto',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _PhaseItem(
          isCompleted: true,
          isCurrent: false,
          icon: Icons.description,
          title: 'Contexto',
          subtitle: 'Análisis del estado de la especie en la zona.',
        ),
        _PhaseItem(
          isCompleted: true,
          isCurrent: false,
          icon: Icons.phishing,
          title: 'Recolección',
          subtitle: 'Rescate de cápsulas de huevo de redes de pesca.',
        ),
        _PhaseItem(
          isCompleted: false,
          isCurrent: true,
          icon: Icons.egg,
          title: 'Incubación (Activa)',
          subtitle: 'Cuidado controlado en tanques de temperatura estable.',
        ),
        _PhaseItem(
          isCompleted: false,
          isCurrent: false,
          icon: Icons.monitor_heart,
          title: 'Triaje',
          subtitle: 'Evaluación de viabilidad de los embriones.',
        ),
        _PhaseItem(
          isCompleted: false,
          isCurrent: false,
          icon: Icons.celebration,
          title: 'Eclosión',
          subtitle: 'Nacimiento supervisado de los alevines.',
        ),
        _PhaseItem(
          isCompleted: false,
          isCurrent: false,
          icon: Icons.waves,
          title: 'Suelta',
          subtitle: 'Retorno al medio natural protegido.',
          isLast: true,
        ),
      ],
    );
  }
}

// ── Glass badge button ──────────────────────────────────────────────────────

class _GlassBadgeButton extends StatelessWidget {
  const _GlassBadgeButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

// ── Stat cell ───────────────────────────────────────────────────────────────

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: FaumaColors.primary, size: 22),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: FaumaColors.secondary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: FaumaColors.onSurface,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Importance row ──────────────────────────────────────────────────────────

class _ImportanceRow extends StatelessWidget {
  const _ImportanceRow({
    required this.iconBgColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleColor,
    required this.description,
  });

  final Color iconBgColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.newsreader(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: FaumaColors.secondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Phase item (vertical timeline) ──────────────────────────────────────────

class _PhaseItem extends StatelessWidget {
  const _PhaseItem({
    required this.isCompleted,
    required this.isCurrent,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  final bool isCompleted;
  final bool isCurrent;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final dotColor = isCurrent
        ? FaumaColors.tertiary
        : isCompleted
            ? FaumaColors.secondary
            : FaumaColors.outlineVariant;
    final textOpacity = (!isCompleted && !isCurrent) ? 0.5 : 1.0;
    final iconColor = isCurrent ? FaumaColors.tertiary : FaumaColors.secondary;
    final titleColor = isCurrent ? FaumaColors.tertiary : null;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline rail
          SizedBox(
            width: 32,
            child: Column(
              children: [
                // Dot
                Container(
                  width: isCurrent ? 24 : 16,
                  height: isCurrent ? 24 : 16,
                  decoration: BoxDecoration(
                    color:
                        isCurrent ? FaumaColors.surface : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: dotColor,
                      width: isCurrent ? 2 : 4,
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color:
                                  FaumaColors.tertiary.withValues(alpha: 0.2),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: isCurrent
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: FaumaColors.tertiary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
                // Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: FaumaColors.outlineVariant.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Opacity(
              opacity: textOpacity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, size: 20, color: iconColor),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: titleColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: FaumaColors.secondary,
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
        ],
      ),
    );
  }
}

// ── Collaborator name ───────────────────────────────────────────────────────

class _CollaboratorName extends StatelessWidget {
  const _CollaboratorName(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.newsreader(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: FaumaColors.secondary.withValues(alpha: 0.6),
      ),
    );
  }
}
