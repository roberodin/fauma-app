import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class AnimalDetailScreen extends StatelessWidget {
  const AnimalDetailScreen({super.key, required this.id});

  final String id;

  // Image URLs from the Stitch HTML
  static const _heroImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCxRbG-AW-ndG-n_2ovUHpzaM1Ww-QStNX18kdtFbCCtoaTB-ANzFeQ2cQOp0b4q6EIXhR7eg3qX9Xe2FwdbpLDp5Zdza2UyrH8RI_-J-jfwv9FH0I4r8kamZEpiGMyIOLgMn4RssqVvebOYJKFSpP--BHtwVc2Mb_ejuV0o6Xo_LdXp2uX3_njWMPYLCll9cSqq2UZOllkn_ANeOpKv3UkWb_XfSsh01fvZkZ_6BC4RKzoDZUBOpI9PRZUFLseZM4B1AIG7q3I2bEM';
  static const _mapImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAZPtsGcs5-OwlDC77vw6PZiyPu4cQv5g6mAUjr_cHwztJ-V1fd0m0A8JLZFGvBY7tJB9N6gH7PvpMFMNsytPrA3mERWIxiT9g7WB8SOHXFz950H2KoI2MifENYZpSivJUDSEHtAdlpNMM9P6jrW9PaS56L0h1bPUjTgp-v9KzS0Qtemjd9erD95mDQHXLDra8EPYkZ_2gbqcOnqVFa0wMpBw8ArWdpoKNPaU-I3l6hrkwyeojSNzbzhWF2iJXeYNfTOdJJiNHBzWt0';
  static const _anatomyImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCQC3ir58CVd_oJp5LxlDBsfETsncC-bG_SE2piWoOk7DNr2o_xHHXpDEWsZEzvDLqQ1DAY_XRd71o3jAuHcsd6uytyvf-ODQDaE0a3IG23Qw8OC7VbUNBhMKcwxUFlP3KC4TnXyHuGjGs5g4_kxas3zjb7DR_r14qsbqFb-3WwdZc2JSa-pC1SrKiqmlYNRxeFWg3SY9j39wG2N1eR1nkeyXB8F1gly9M6JOzkIzOYOEPflr4-qR_LmRa8r6fh6UxEBTBv_oK4LPeQ';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // -- Hero Header --
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 480,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FaumaImage(
                        imageUrl: _heroImage,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              cs.onSurface.withValues(alpha: 0.9),
                              cs.onSurface.withValues(alpha: 0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 32,
                        left: 24,
                        right: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: cs.primaryContainer,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'Nivel: Hermano',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Tortuga Caretta caretta',
                              style: GoogleFonts.newsreader(
                                fontSize: 42,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Somos 847 personas protegiendo esta especie',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // -- Content Tabs --
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  child: Container(
                    color: cs.surface,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _TabChip(
                            label: 'Ficha Tecnica',
                            active: true,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Galeria',
                            active: false,
                            onTap: () =>
                                context.go('/my-animals/$id/gallery'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Curiosidades',
                            active: false,
                            onTap: () =>
                                context.go('/my-animals/$id/curiosities'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Diario de Salud',
                            active: false,
                            onTap: () =>
                                context.go('/my-animals/$id/health'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // -- Seasonal Content Card --
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                      border: Border(
                        left: BorderSide(
                          color: const Color(0xFFF4847A),
                          width: 6,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CONTENIDO ESTACIONAL',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                            color: cs.tertiary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.newsreader(
                              fontSize: 20,
                              color: cs.onSurface,
                              height: 1.3,
                            ),
                            children: const [
                              TextSpan(text: '\ud83e\udd5a Ciclo de Vida \u2014 Marzo: '),
                              TextSpan(
                                text:
                                    'Temporada de anidacion. Las hembras buscan playas para anidar.',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // -- Tracking Map Section --
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ruta Migratoria Directa',
                            style: GoogleFonts.newsreader(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: cs.onSurface,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF22C55E),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'EN VIVO',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                    color: const Color(0xFF166534),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withValues(alpha: 0.4),
                                  BlendMode.darken,
                                ),
                                child: FaumaImage(
                                  imageUrl: _mapImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Location overlay
                              Positioned(
                                top: 16,
                                left: 16,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.black.withValues(alpha: 0.4),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white
                                          .withValues(alpha: 0.1),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'UBICACION ACTUAL',
                                        style: GoogleFonts.inter(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2,
                                          color: const Color(0xFFF4847A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '24.5502\u00b0 N, 81.7800\u00b0 W',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Action buttons
                              Positioned(
                                bottom: 16,
                                right: 16,
                                child: Column(
                                  children: [
                                    _MapButton(
                                      icon: Icons.my_location,
                                      color: cs.primary,
                                    ),
                                    const SizedBox(height: 8),
                                    _MapButton(
                                      icon: Icons.layers_outlined,
                                      color: cs.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Seguimiento por satelite de la hembra \'Nerea\' cruzando el estrecho.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // -- Scientific Plate: Interactive Anatomy --
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          FaumaImage(
                            imageUrl: _anatomyImage,
                            fit: BoxFit.contain,
                          ),
                          // Hotspot buttons
                          ..._buildHotspots(cs),
                          // Bottom label
                          Positioned(
                            bottom: 24,
                            left: 24,
                            right: 24,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      Colors.white.withValues(alpha: 0.2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ANATOMIA INTERACTIVA',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.5,
                                      color: cs.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Pulsa en los marcadores para descubrir datos biometricos.',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                      color: cs.onSurface,
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
                ),
              ),

              // -- Accordion Sections --
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _AccordionTile(
                          emoji: '\ud83d\udccb',
                          title: 'Identificacion y Taxonomia'),
                      const SizedBox(height: 12),
                      _AccordionTile(
                          emoji: '\ud83d\udccf',
                          title: 'Biometria y Morfologia'),
                      const SizedBox(height: 12),
                      _AccordionTile(
                          emoji: '\ud83c\udf0d',
                          title: 'Ecologia y Distribucion'),
                      const SizedBox(height: 12),
                      _AccordionTile(
                          emoji: '\ud83e\uddec',
                          title: 'Biologia Reproductiva'),
                      const SizedBox(height: 12),
                      _AccordionTile(
                          emoji: '\u26a0\ufe0f',
                          title: 'Amenazas y Desafios'),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // -- Back button --
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: GestureDetector(
              onTap: () => context.go('/my-animals'),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: cs.surface.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: cs.primaryContainer),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHotspots(ColorScheme cs) {
    final positions = [
      const Alignment(-0.0, -0.5),
      const Alignment(-0.34, -0.1),
      const Alignment(0.5, 0.34),
      const Alignment(-0.5, 0.5),
    ];
    return positions.map((alignment) {
      return Align(
        alignment: alignment,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: cs.primaryContainer.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 16),
        ),
      );
    }).toList();
  }
}

// ---------------------------------------------------------------------------
// Tab Chip
// ---------------------------------------------------------------------------
class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: active ? cs.primaryContainer : const Color(0xFFEEE7E1),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: active
              ? GoogleFonts.newsreader(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: cs.surface,
                )
              : GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: cs.onSurfaceVariant,
                ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Accordion Tile
// ---------------------------------------------------------------------------
class _AccordionTile extends StatelessWidget {
  const _AccordionTile({required this.emoji, required this.title});

  final String emoji;
  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$emoji $title',
            style: GoogleFonts.newsreader(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          Icon(Icons.expand_more, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Map Action Button
// ---------------------------------------------------------------------------
class _MapButton extends StatelessWidget {
  const _MapButton({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
          ),
        ],
      ),
      child: Icon(icon, size: 20, color: color),
    );
  }
}

// ---------------------------------------------------------------------------
// Persistent Tab Bar Delegate
// ---------------------------------------------------------------------------
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({required this.child});

  final Widget child;

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 72;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
