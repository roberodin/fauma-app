import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

class MyAnimalsScreen extends StatelessWidget {
  const MyAnimalsScreen({super.key});

  // ── Color tokens not in FaumaColors ────────────────────────────────
  static const Color _secondaryContainer = Color(0xFFD7E3F9);
  static const Color _onSecondaryContainer = Color(0xFF596577);
  static const Color _onPrimaryContainer = Color(0xFFA1E9F1);
  static const Color _surfaceContainer = Color(0xFFF3EDE7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            // ── Top App Bar ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suscripciones',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primaryContainer,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.search,
                          color: FaumaColors.primaryContainer, size: 24),
                      const SizedBox(width: 16),
                      Icon(Icons.notifications_outlined,
                          color: FaumaColors.primaryContainer, size: 24),
                    ],
                  ),
                ],
              ),
            ),

            // ── Summary Strip ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: FaumaColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(
                      color: FaumaColors.onSurface.withValues(alpha: 0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  '3 suscripciones activas \u00b7 2 especies \u00b7 1 proyecto',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: FaumaColors.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ── Section: Especies ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Especies',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  Text(
                    'Ver todas',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: FaumaColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Card 1: Tortuga Caretta caretta ────────────────────
            _SpeciesCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBKQycRQ7imXV0APLcmGk05FYhv5013eJbupbLB3fF7xdVs0n8dONBmweh6Z6N8fNTkNlOq1juU5yhSwCNFbtGp7ww6aVpoVIpbJLFuiynzB5Y1rYw77apkBza-u6Dfffnvl-ZOeLxD8pgS-_C5kXd3CKgi0ZR0DghUOkYj1b9jQNwGiHNTnLrysIjBdGIiIEDNkM1iBDBEUL57NzqTBX0aJazChUnAFf2ayw9SlRq9TuHFYHYB-vtfqWwbpvQ_IDNv8Uv23_Nog-ux',
              name: 'Tortuga Caretta caretta',
              scientificName: 'Caretta caretta',
              badgeLabel: 'Hermano',
              badgeColor: FaumaColors.primaryContainer,
              badgeTextColor: _onPrimaryContainer,
              badgeBorder: null,
              newsCount: '3 novedades',
              sinceDate: 'Desde Mar 2026',
              progressFraction: 0.66,
              monthsText: '8 de 12 meses',
              contentText: '24 contenidos desbloqueados',
              onTap: () => context.go('/explore/species/caretta/subscriber'),
            ),
            const SizedBox(height: 24),

            // ── Card 2: Pinguino Papua ─────────────────────────────
            _SpeciesCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAxWFce6_vupWdblcttTNRt52_2nd4R6d_xfxAOh-tjP6W5JjSdepEapvTBKa6IM8y8m6smSV9GlowQuHTsFG71s7jeIXQ4Rk-yXfeHv93FJpdCzPqjtWpC4gT-rWzTuKhZZOylzhWYH00IbCRcBdfiN_rGoYZejrPsudaLjtaMoDWHzeNsntxMeHc8amG8pKkcxPEUOc04YQ6OLBQJZsj96RGtCHSrP4DXMQXUkf9OZQjRd3YCHtyp4MQ60ERGJdGjg5NLGZFTa60r',
              name: 'Ping\u00fcino Pap\u00faa',
              scientificName: 'Pygoscelis papua',
              badgeLabel: 'Amigo',
              badgeColor: _secondaryContainer,
              badgeTextColor: _onSecondaryContainer,
              badgeBorder: Border.all(
                color: FaumaColors.outlineVariant.withValues(alpha: 0.2),
              ),
              newsCount: '1 novedad',
              sinceDate: 'Desde Jun 2026',
              progressFraction: 0.25,
              monthsText: '3 de 12 meses',
              contentText: '9 contenidos desbloqueados',
              onTap: () => context.go('/explore/species/pinguino/subscriber'),
            ),
            const SizedBox(height: 32),

            // ── Section: Proyectos ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Proyectos',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Card 3: Proyecto Pintarroja ────────────────────────
            _ProjectCard(
              onTap: () =>
                  context.go('/explore/project/pintarroja/subscriber'),
            ),
            const SizedBox(height: 32),

            // ── Empty State / Upsell ───────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: _surfaceContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: FaumaColors.outlineVariant.withValues(alpha: 0.4),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(Icons.pets,
                        color: FaumaColors.primary, size: 36),
                    const SizedBox(height: 12),
                    Text(
                      '\u00bfQuieres apoyar m\u00e1s especies?',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explorar cat\u00e1logo \u2192',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Species Subscription Card
// ─────────────────────────────────────────────────────────────────────────────
class _SpeciesCard extends StatelessWidget {
  const _SpeciesCard({
    required this.imageUrl,
    required this.name,
    required this.scientificName,
    required this.badgeLabel,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.badgeBorder,
    required this.newsCount,
    required this.sinceDate,
    required this.progressFraction,
    required this.monthsText,
    required this.contentText,
    required this.onTap,
  });

  final String imageUrl;
  final String name;
  final String scientificName;
  final String badgeLabel;
  final Color badgeColor;
  final Color badgeTextColor;
  final BoxBorder? badgeBorder;
  final String newsCount;
  final String sinceDate;
  final double progressFraction;
  final String monthsText;
  final String contentText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: FaumaColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: FaumaColors.onSurface.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Image with news badge ─────────────────────────
              Stack(
                children: [
                  SizedBox(
                    height: 224,
                    width: double.infinity,
                    child: FaumaImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: FaumaColors.tertiary,
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: FaumaColors.onSurface
                                .withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        newsCount,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.onTertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ── Card body ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name row + tier badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: GoogleFonts.newsreader(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: FaumaColors.onSurface,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                scientificName,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: FaumaColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(999),
                            border: badgeBorder,
                          ),
                          child: Text(
                            badgeLabel,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: badgeTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Progress section
                    const SizedBox(height: 12),
                    Text(
                      sinceDate,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progressFraction,
                        minHeight: 8,
                        backgroundColor:
                            MyAnimalsScreen._surfaceContainer,
                        valueColor: const AlwaysStoppedAnimation(
                            FaumaColors.primary),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          monthsText,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: FaumaColors.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          contentText,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: FaumaColors.onSurfaceVariant,
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
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Project Subscription Card (horizontal layout)
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.onTap});

  final VoidCallback onTap;

  static const Color _secondaryContainer = Color(0xFFD7E3F9);
  static const Color _onSecondaryContainer = Color(0xFF596577);
  static const Color _surfaceContainerHighest = Color(0xFFE8E1DC);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: FaumaColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: FaumaColors.onSurface.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FaumaImage(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCZUcLpieoB3UCwNS8x6I-4F0ONq7x7YDUqXb9BvGV3Um7pvLju3voCCXs-lTe5Yu0-zMu9aq_4IVkpW7tZ3b1m7nFWeVlH5Upl83b-54TyNCbjSnZ0dY3W1GttH-e873InJG2C0he32YnuW8MiVQcJOQV16XhjwmX14EI3ngB2f-zgfLHEsFcRgT46WaVInsRVjn1-ZTt4lutnjNbntdmOFU2FOMoFBvbxtWywIxKOEkvcXVR74_LW6fJUCnxQjhaXJLbO258w3xTI',
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Desarrollo de huevos de Pintarroja',
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Oceanogr\u00e0fic \u00b7 Valencia',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Tier badge + date
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _secondaryContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Amigo',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _onSecondaryContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Desde Ene 2027',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: FaumaColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Divider + phase progress
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: FaumaColors.outlineVariant
                                .withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Circular progress + label
                          Row(
                            children: [
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: 0.5,
                                      strokeWidth: 3,
                                      backgroundColor:
                                          _surfaceContainerHighest,
                                      valueColor:
                                          const AlwaysStoppedAnimation(
                                              FaumaColors.primary),
                                    ),
                                    Text(
                                      '3/6',
                                      style: GoogleFonts.inter(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: FaumaColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Fase 3 de 6',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: FaumaColors.onSurface,
                                ),
                              ),
                            ],
                          ),

                          // Last updated
                          Flexible(
                            child: Text(
                              '\u00daltima actualizaci\u00f3n hace 3 d\u00edas',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                color: FaumaColors.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
