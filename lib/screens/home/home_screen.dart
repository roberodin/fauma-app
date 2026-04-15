import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

/// Image URLs extracted from 14-home.html
const _kBabyTurtle =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBxAKoIJ18zLHDN5wfR2OXp82IAqp3ztH1P1mcxu6SIFrfX-0AJKJDwUDYHbGzTmB8396PVyVFVJGLYkdfV94WeWecbr94es21QxHMVRSwnkroOo5zTEkYvHgI7yUpOFaAz6qZ6uGjD1T9sPBuCQu0HWh-OtQGByQHLHp7yAGX_Ftj7M4jQ1fEK_nFEYxPK90IAVIY3hMo6BgsxLaxkfCFBzcFUy7RvnWFvNZAeVDgk2vPwaglI_E_FpbJXBQh8-NiNKq3bqx5MhWW7';
const _kPenguins =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAAsFPQ3xiOLGxLsRQp2tFLRSdT55MBcq0bP_mHyVp7Rwv_KJ9NTegEPQbV55LyYddatT7IlGZ5FJTw6KvFmOn5ULtJtu8PyFc0wQ2CTYEqnFzmUqCcOy57taHNMCsS_58x9tdBn7AiJDbS0RKX_gF2eemvehvCFKXuaVshP235-Zrz3LFl3F0wztSvPZYtdCdBH53hOc3Rs4mKOYcpya7PcW_bON1fJomLQTfrpv7dBuUdzcf8M98YshJumyNRp8mR37NbIqtMR_yp';
const _kScientificIllustration =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBFdLkAht236els0cCgzqU_8-c_tKCG7e9ni_V_lGZCsnd8qnGePxHLu_b-al_Vv1xdKipImWn3y0h3UMDJG7UjbtnhEv0vQodpmKevSyxtmKVYOkt-28C07HTZ1RESz9kzrNKBTHcSl643A6pzReaufQiyQwq-jhC1ThxWnHjLJ4vLFdh4WYnpaXJXRdH793OhfinlW7EQnuFikCA-HFfAp-GB8ZrWRAK7u8owpbuHTekOj5n864jGZnacauVG2B2sy-sICxQzvkLg';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Column(
        children: [
          // ── Top App Bar ─────────────────────────────────────
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: cs.surface,
                border: Border(
                  bottom: BorderSide(
                    color:
                        cs.primaryContainer.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Fauma',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: cs.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Buenos dias, Maria',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: cs.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_outlined,
                            color: cs.primaryContainer),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: cs.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: cs.surface, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── Scrollable body ─────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Impact Card Section ─────────────────────
                  _buildImpactCard(cs),
                  const SizedBox(height: 24),

                  // ── Species Feed Header ─────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Especies',
                          style: GoogleFonts.newsreader(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: cs.onSurface,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDAD6),
                            borderRadius:
                                BorderRadius.circular(999),
                            border: Border.all(
                              color: cs.tertiary
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                          child: Text(
                            '3 nuevas',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: cs.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Feed Card 1: Photo ──────────────────────
                  _buildPhotoCard(
                    context,
                    cs,
                    imageUrl: _kBabyTurtle,
                    badge: '\uD83D\uDCF8 Foto nueva',
                    title:
                        'Temporada de anidacion: primeros nidos',
                    species: 'Tortuga Caretta',
                    time: 'Hace 2h',
                    hasNewDot: true,
                  ),
                  const SizedBox(height: 16),

                  // ── Feed Card 2: Video ──────────────────────
                  _buildVideoCard(
                    cs,
                    imageUrl: _kPenguins,
                    badge: '\uD83D\uDCF9 Video',
                    title: 'Nuevo video: Alimentacion en grupo',
                    species: 'Pinguino Papua',
                    time: 'Hace 1 dia',
                  ),
                  const SizedBox(height: 16),

                  // ── Feed Card 3: Project (horizontal) ───────
                  _buildProjectCard(cs),
                  const SizedBox(height: 16),

                  // ── Global News Card ────────────────────────
                  _buildGlobalCard(cs),
                  const SizedBox(height: 24),

                  // ── Discover CTA ────────────────────────────
                  _buildDiscoverCta(cs),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Impact Card ───────────────────────────────────────────────
  Widget _buildImpactCard(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: cs.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tu Impacto',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: cs.primaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Resumen de tu contribucion actual',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: cs.secondary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'ACTIVA',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: cs.primaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Stats grid
          Row(
            children: [
              Expanded(child: _statCell(cs, '2', 'ESPECIES')),
              const SizedBox(width: 16),
              Expanded(child: _statCell(cs, '6', 'MESES')),
            ],
          ),
          const SizedBox(height: 32),

          // Milestones
          Text(
            'Hitos alcanzados',
            style: GoogleFonts.newsreader(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 88,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _milestone(cs, Icons.workspace_premium,
                    'Primer apoyo', true),
                const SizedBox(width: 16),
                _milestone(cs, Icons.water_drop,
                    'Amigo del oceano', true),
                const SizedBox(width: 16),
                _milestone(
                    cs, Icons.egg, 'Protector de tortugas', true),
                const SizedBox(width: 16),
                _milestone(
                    cs, Icons.lock, '6 meses seguidos', false),
                const SizedBox(width: 16),
                _milestone(
                    cs, Icons.lock, 'Heroe global', false),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Share button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: cs.tertiary,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding:
                    const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: const Icon(Icons.share, size: 18),
              label: Text(
                'Compartir mi impacto',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCell(ColorScheme cs, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: cs.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: cs.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _milestone(
      ColorScheme cs, IconData icon, String label, bool unlocked) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: unlocked
                ? cs.primaryContainer
                : cs.surfaceContainerHighest,
            border: unlocked
                ? null
                : Border.all(
                    color: cs.outline,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
            boxShadow: unlocked
                ? [
                    BoxShadow(
                      color: cs.primaryContainer
                          .withValues(alpha: 0.3),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            color: unlocked ? Colors.white : cs.secondary,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 60,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: unlocked ? cs.onSurface : cs.secondary,
            ),
          ),
        ),
      ],
    );
  }

  // ── Photo Feed Card ───────────────────────────────────────────
  Widget _buildPhotoCard(
    BuildContext context,
    ColorScheme cs, {
    required String imageUrl,
    required String badge,
    required String title,
    required String species,
    required String time,
    bool hasNewDot = false,
  }) {
    return GestureDetector(
      onTap: () => context.go('/my-animals/caretta'),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: cs.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            // Image area
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12)),
                  child: SizedBox(
                    height: 192,
                    width: double.infinity,
                    child: FaumaImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      badge,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Blue dot
                if (hasNewDot)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF007AFF),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 4,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Text content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        species,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                          color: cs.secondary,
                        ),
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cs.outline,
                        ),
                      ),
                      Text(
                        time,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                          color: cs.secondary,
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
    );
  }

  // ── Video Feed Card ───────────────────────────────────────────
  Widget _buildVideoCard(
    ColorScheme cs, {
    required String imageUrl,
    required String badge,
    required String title,
    required String species,
    required String time,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Image area with play button
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12)),
                child: SizedBox(
                  height: 192,
                  width: double.infinity,
                  child: FaumaImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Play button overlay
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.3),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              // Badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    badge,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.newsreader(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      species,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                        color: cs.secondary,
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cs.outline,
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                        color: cs.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Project Card (horizontal layout) ──────────────────────────
  Widget _buildProjectCard(ColorScheme cs) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          // Image (left third)
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12)),
            child: SizedBox(
              width: 120,
              height: 140,
              child: FaumaImage(
                imageUrl: _kScientificIllustration,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content (right two-thirds)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '\uD83D\uDD2C PROYECTO',
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fase 3 completada: Monitorizacion del desarrollo',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.newsreader(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Proyecto Pintarroja',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                          color: cs.secondary,
                        ),
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cs.outline,
                        ),
                      ),
                      Text(
                        'Hace 3 dias',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                          color: cs.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Global News Card ──────────────────────────────────────────
  Widget _buildGlobalCard(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.primaryContainer,
            cs.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.primary.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative icon
          Positioned(
            right: -16,
            bottom: -16,
            child: Transform.rotate(
              angle: 0.2,
              child: Opacity(
                opacity: 0.1,
                child: Icon(Icons.public,
                    size: 120, color: Colors.white),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.public,
                      color: const Color(0xFFFFDAD6), size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Novedad global: Fauma alcanza 15,000 colaboradores',
                      style: GoogleFonts.newsreader(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Gracias a vuestro apoyo, hemos extendido nuestra red de proteccion a 5 nuevas zonas costeras este mes.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFFA6EFF6),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'HACE 1 SEMANA',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Discover CTA ──────────────────────────────────────────────
  Widget _buildDiscoverCta(ColorScheme cs) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.tertiary.withValues(alpha: 0.3),
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle,
                  color: cs.tertiary, size: 36),
              const SizedBox(height: 8),
              Text(
                'Descubrir nuevas especies',
                style: GoogleFonts.newsreader(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: cs.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
