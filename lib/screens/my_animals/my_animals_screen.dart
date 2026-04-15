import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class MyAnimalsScreen extends StatelessWidget {
  const MyAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            // -- Top App Bar --
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
                      color: cs.primaryContainer,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.search, color: cs.primaryContainer),
                      const SizedBox(width: 16),
                      Icon(Icons.notifications_outlined,
                          color: cs.primaryContainer),
                    ],
                  ),
                ],
              ),
            ),

            // -- Summary Strip --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '3 suscripciones activas \u00b7 2 especies \u00b7 1 proyecto',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: cs.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // -- Section: Especies --
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
                      color: cs.onSurface,
                    ),
                  ),
                  Text(
                    'Ver todas',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // -- Card 1: Tortuga Caretta caretta --
            _AnimalCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBKQycRQ7imXV0APLcmGk05FYhv5013eJbupbLB3fF7xdVs0n8dONBmweh6Z6N8fNTkNlOq1juU5yhSwCNFbtGp7ww6aVpoVIpbJLFuiynzB5Y1rYw77apkBza-u6Dfffnvl-ZOeLxD8pgS-_C5kXd3CKgi0ZR0DghUOkYj1b9jQNwGiHNTnLrysIjBdGIiIEDNkM1iBDBEUL57NzqTBX0aJazChUnAFf2ayw9SlRq9TuHFYHYB-vtfqWwbpvQ_IDNv8Uv23_Nog-ux',
              name: 'Tortuga Caretta caretta',
              scientificName: 'Caretta caretta',
              badgeLabel: 'Hermano',
              badgeColor: cs.primaryContainer,
              badgeTextColor: Colors.white,
              newsCount: '3 novedades',
              sinceDate: 'Desde Mar 2026',
              progressFraction: 0.66,
              monthsText: '8 de 12 meses',
              contentText: '24 contenidos desbloqueados',
              onTap: () => context.go('/my-animals/caretta'),
            ),
            const SizedBox(height: 24),

            // -- Card 2: Pinguino Papua --
            _AnimalCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAxWFce6_vupWdblcttTNRt52_2nd4R6d_xfxAOh-tjP6W5JjSdepEapvTBKa6IM8y8m6smSV9GlowQuHTsFG71s7jeIXQ4Rk-yXfeHv93FJpdCzPqjtWpC4gT-rWzTuKhZZOylzhWYH00IbCRcBdfiN_rGoYZejrPsudaLjtaMoDWHzeNsntxMeHc8amG8pKkcxPEUOc04YQ6OLBQJZsj96RGtCHSrP4DXMQXUkf9OZQjRd3YCHtyp4MQ60ERGJdGjg5NLGZFTa60r',
              name: 'Pinguino Papua',
              scientificName: 'Pygoscelis papua',
              badgeLabel: 'Amigo',
              badgeColor: const Color(0xFFD7E3F9),
              badgeTextColor: const Color(0xFF596577),
              newsCount: '1 novedad',
              sinceDate: 'Desde Jun 2026',
              progressFraction: 0.25,
              monthsText: '3 de 12 meses',
              contentText: '9 contenidos desbloqueados',
              onTap: () => context.go('/my-animals/pinguino'),
            ),
            const SizedBox(height: 32),

            // -- Section: Proyectos --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Proyectos',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // -- Card 3: Proyecto Pintarroja --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () => context.go('/my-project/pintarroja'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: cs.onSurface.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: cs.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Desarrollo de huevos de Pintarroja',
                              style: GoogleFonts.newsreader(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: cs.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Oceanografic \u00b7 Valencia',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: cs.secondary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD7E3F9),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    'Amigo',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF596577),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Desde Ene 2027',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    color: cs.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: cs.outlineVariant
                                        .withValues(alpha: 0.2),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                              backgroundColor: cs
                                                  .outlineVariant
                                                  .withValues(alpha: 0.3),
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      cs.primary),
                                            ),
                                            Text(
                                              '3/6',
                                              style: GoogleFonts.inter(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w700,
                                                color: cs.primary,
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
                                          color: cs.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Hace 3 dias',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      color: cs.onSurfaceVariant,
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
            ),
            const SizedBox(height: 32),

            // -- Empty State / Upsell --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.4),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(Icons.pets, color: cs.primary, size: 36),
                    const SizedBox(height: 12),
                    Text(
                      '\u00bfQuieres apoyar mas especies?',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explorar catalogo \u2192',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: cs.tertiary,
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

// ---------------------------------------------------------------------------
// Animal Subscription Card
// ---------------------------------------------------------------------------
class _AnimalCard extends StatelessWidget {
  const _AnimalCard({
    required this.imageUrl,
    required this.name,
    required this.scientificName,
    required this.badgeLabel,
    required this.badgeColor,
    required this.badgeTextColor,
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
  final String newsCount;
  final String sinceDate;
  final double progressFraction;
  final String monthsText;
  final String contentText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: cs.onSurface.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: cs.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
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
                        color: cs.tertiary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        newsCount,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: cs.onTertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Info
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                  color: cs.onSurface,
                                ),
                              ),
                              Text(
                                scientificName,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: cs.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            badgeLabel,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: badgeTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      sinceDate,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: cs.secondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progressFraction,
                        minHeight: 8,
                        backgroundColor: cs.surfaceContainerLow,
                        valueColor: AlwaysStoppedAnimation(cs.primary),
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
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          contentText,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: cs.onSurfaceVariant,
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
