import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HealthDiaryScreen extends StatelessWidget {
  const HealthDiaryScreen({super.key, required this.animalId});

  final String animalId;

  static const _heroImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCPf50l0s3CDTJvDdIYWEde2IDIqh5tJ5YKCXMMrOhX209RtYn9eEHchVyWIblo_3YLPztPMtjVrM_EFfa179gvNSAjXtfh_szgRSfX3YbEk_nmzglmMtgmZg4x6tML1el4C6NlxFPruP1oznonjbtYwq-BtgTIJ1Ma1IpFei15X7SiffYVWxu3XWN_CgVeTbELtEhQ5y8GvNE9xgKJ6D1PIW8IEIkEXZxpDRR0hhVicmoOauMOm-KeRLkCxMVJkxyniUIU5c7DQAoX';
  static const _vetAvatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDLIf4xw2z27kNMcfRq-FavHglR8HD9cY_BRuJTURcckMrbqlsMz6I-x1k1EdP2fl3ElnTzpftF2Rx0tfN2F-oq_PaPr_9Dq8llMAS8C_fhiy1eVeQF_ldA0YKfxR0RauJoCWBjHVIGaj3gbLKprOCDZmdrKiO_5IeeFTUfuUbQ2J846nRiPUnJzUTDpI3cSW1HMiHIxrLApfO48aGIOp2qfD06FFTv_H6qIukFLUH8p91lTjI1_fOKTgarNMmUSqDog9ppt5E9CToU';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          // -- App Bar --
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: cs.primaryContainer),
              onPressed: () => context.go('/my-animals/$animalId'),
            ),
            title: Text(
              'Mis Animales',
              style: GoogleFonts.newsreader(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: cs.primaryContainer),
                onPressed: () {},
              ),
            ],
          ),

          // -- Hero Header --
          SliverToBoxAdapter(
            child: SizedBox(
              height: 224,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FaumaImage(imageUrl: _heroImage, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          cs.primary.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 24,
                    right: 24,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tortuga Caretta caretta',
                            style: GoogleFonts.newsreader(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'HERMANO',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: Colors.white,
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

          // -- Tab Bar --
          SliverPersistentHeader(
            pinned: true,
            delegate: _HealthTabDelegate(
              child: Container(
                color: cs.surface.withValues(alpha: 0.95),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: cs.outlineVariant.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PillTab(label: 'Ficha Tecnica', active: false),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Galeria', active: false),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Curiosidades', active: false),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Diario de Salud', active: true),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // -- Bitacora Veterinaria Title --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Text(
                'Bitacora Veterinaria',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: cs.primary,
                ),
              ),
            ),
          ),

          // -- Timeline entries --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _TimelineSection(vetAvatar: _vetAvatar),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _TimelineSection extends StatelessWidget {
  const _TimelineSection({required this.vetAvatar});
  final String vetAvatar;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // Timeline line
        Positioned(
          left: 15,
          top: 8,
          bottom: 8,
          child: Container(
            width: 2,
            color: cs.outlineVariant.withValues(alpha: 0.3),
          ),
        ),

        Column(
          children: [
            // Entry 1
            _TimelineEntry(
              dotColor: cs.primary,
              date: '12 Mar, 2027',
              title: 'Revision trimestral',
              avatarUrl: vetAvatar,
              body: RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: cs.onSurfaceVariant,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: 'Peso registrado: '),
                    TextSpan(
                      text: '138kg',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: cs.primary),
                    ),
                    const TextSpan(
                        text:
                            '. El estado del caparazon es optimo, sin parasitos externos. Muestra comportamiento activo de pre-anidacion.'),
                  ],
                ),
              ),
              opacity: 1.0,
            ),
            const SizedBox(height: 32),

            // Entry 2
            _TimelineEntry(
              dotColor: cs.outlineVariant,
              date: '15 Dic, 2026',
              title: 'Control post-temporada',
              body: Text(
                'Recuperacion exitosa tras temporada de desove. Valores sanguineos dentro de los parametros normales de la especie.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              opacity: 0.8,
            ),
            const SizedBox(height: 32),

            // Entry 3 (Locked)
            _LockedEntry(),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.dotColor,
    required this.date,
    required this.title,
    required this.body,
    this.avatarUrl,
    this.opacity = 1.0,
  });

  final Color dotColor;
  final String date;
  final String title;
  final Widget body;
  final String? avatarUrl;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Opacity(
      opacity: opacity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
              border: Border.all(color: cs.surface, width: 4),
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cs.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD7E3F9),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          date,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: const Color(0xFF596577),
                          ),
                        ),
                      ),
                      if (avatarUrl != null)
                        CircleAvatar(
                          radius: 16,
                          child: ClipOval(
                            child: FaumaImage(
                              imageUrl: avatarUrl!,
                              fit: BoxFit.cover,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  body,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _LockedEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: cs.outlineVariant.withValues(alpha: 0.3),
            shape: BoxShape.circle,
            border: Border.all(color: cs.surface, width: 4),
          ),
          child: const Icon(Icons.lock, size: 10, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cs.surfaceContainerLow.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: cs.outlineVariant,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '8 Sep, 2026',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: cs.outline,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDAD6),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'DISPONIBLE EN NIVEL HEROE',
                        style: GoogleFonts.inter(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF7E2A25),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Blurred placeholder lines
                Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                FractionallySizedBox(
                  widthFactor: 0.75,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
class _PillTab extends StatelessWidget {
  const _PillTab({required this.label, required this.active});
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? cs.primary : null,
        borderRadius: BorderRadius.circular(999),
        boxShadow: active
            ? [
                BoxShadow(
                  color: cs.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                ),
              ]
            : null,
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: active ? FontWeight.w600 : FontWeight.w600,
          color: active ? Colors.white : cs.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _HealthTabDelegate extends SliverPersistentHeaderDelegate {
  _HealthTabDelegate({required this.child});
  final Widget child;

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _HealthTabDelegate oldDelegate) => false;
}
