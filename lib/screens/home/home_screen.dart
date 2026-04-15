import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

/// Image URLs from the Stitch design (14-home.html).
const _kBabyTurtle =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBxAKoIJ18zLHDN5wfR2OXp82IAqp3ztH1P1mcxu6SIFrfX-0AJKJDwUDYHbGzTmB8396PVyVFVJGLYkdfV94WeWecbr94es21QxHMVRSwnkroOo5zTEkYvHgI7yUpOFaAz6qZ6uGjD1T9sPBuCQu0HWh-OtQGByQHLHp7yAGX_Ftj7M4jQ1fEK_nFEYxPK90IAVIY3hMo6BgsxLaxkfCFBzcFUy7RvnWFvNZAeVDgk2vPwaglI_E_FpbJXBQh8-NiNKq3bqx5MhWW7';
const _kPenguins =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAAsFPQ3xiOLGxLsRQp2tFLRSdT55MBcq0bP_mHyVp7Rwv_KJ9NTegEPQbV55LyYddatT7IlGZ5FJTw6KvFmOn5ULtJtu8PyFc0wQ2CTYEqnFzmUqCcOy57taHNMCsS_58x9tdBn7AiJDbS0RKX_gF2eemvehvCFKXuaVshP235-Zrz3LFl3F0wztSvPZYtdCdBH53hOc3Rs4mKOYcpya7PcW_bON1fJomLQTfrpv7dBuUdzcf8M98YshJumyNRp8mR37NbIqtMR_yp';
const _kScientificIllustration =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBFdLkAht236els0cCgzqU_8-c_tKCG7e9ni_V_lGZCsnd8qnGePxHLu_b-al_Vv1xdKipImWn3y0h3UMDJG7UjbtnhEv0vQodpmKevSyxtmKVYOkt-28C07HTZ1RESz9kzrNKBTHcSl643A6pzReaufQiyQwq-jhC1ThxWnHjLJ4vLFdh4WYnpaXJXRdH793OhfinlW7EQnuFikCA-HFfAp-GB8ZrWRAK7u8owpbuHTekOj5n864jGZnacauVG2B2sy-sICxQzvkLg';

/// Extended color tokens from the Stitch design that are not in FaumaColors.
const _kTertiaryFixed = Color(0xFFFFDAD6);
const _kPrimaryFixed = Color(0xFFA6EFF6);
const _kSecondaryContainer = Color(0xFFD7E3F9);
const _kOnSecondaryContainer = Color(0xFF596577);
const _kSecondaryFixed = Color(0xFFD7E3F9);
const _kSurfaceContainer = Color(0xFFF3EDE7);
const _kSurfaceContainerHighest = Color(0xFFE8E1DC);
const _kOutline = Color(0xFF6F797A);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: Column(
        children: [
          // -- Top App Bar --
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: FaumaColors.surface,
                border: Border(
                  bottom: BorderSide(
                    color: FaumaColors.primaryContainer.withValues(alpha: 0.1),
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
                      color: FaumaColors.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Buenos d\u00edas, Mar\u00eda',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: FaumaColors.primaryContainer,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: FaumaColors.tertiary,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: FaumaColors.surface, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // -- Scrollable body --
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Impact Card Section --
                  _buildImpactCard(),
                  const SizedBox(height: 24),

                  // -- Species Feed Header --
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Especies',
                          style: GoogleFonts.newsreader(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: _kTertiaryFixed,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color:
                                  FaumaColors.tertiary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Text(
                            '3 nuevas',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: FaumaColors.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // -- Feed Card 1: Photo --
                  _buildPhotoCard(
                    context,
                    imageUrl: _kBabyTurtle,
                    badge: '\u{1F4F8} Foto nueva',
                    title: 'Temporada de anidaci\u00f3n: primeros nidos',
                    species: 'Tortuga Caretta',
                    time: 'Hace 2h',
                    hasNewDot: true,
                  ),
                  const SizedBox(height: 16),

                  // -- Feed Card 2: Video --
                  _buildVideoCard(
                    imageUrl: _kPenguins,
                    badge: '\u{1F4F9} V\u00eddeo',
                    title: 'Nuevo v\u00eddeo: Alimentaci\u00f3n en grupo',
                    species: 'Ping\u00fcino Pap\u00faa',
                    time: 'Hace 1 d\u00eda',
                  ),
                  const SizedBox(height: 16),

                  // -- Feed Card 3: Project (horizontal) --
                  _buildProjectCard(),
                  const SizedBox(height: 16),

                  // -- Global News Card --
                  _buildGlobalCard(),
                  const SizedBox(height: 24),

                  // -- Discover CTA --
                  _buildDiscoverCta(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Impact Card ─────────────────────────────────────────────────────
  Widget _buildImpactCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: FaumaColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
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
                      color: FaumaColors.primaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Resumen de tu contribuci\u00f3n actual',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: FaumaColors.secondary,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: FaumaColors.primaryContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'ACTIVA',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: FaumaColors.primaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Stats grid (2 columns)
          Row(
            children: [
              Expanded(child: _statCell('2', 'ESPECIES')),
              const SizedBox(width: 16),
              Expanded(child: _statCell('6', 'MESES')),
            ],
          ),
          const SizedBox(height: 32),

          // Milestones header
          Text(
            'Hitos alcanzados',
            style: GoogleFonts.newsreader(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: FaumaColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),

          // Milestones horizontal list
          SizedBox(
            height: 88,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              children: [
                _milestone(Icons.workspace_premium, 'Primer apoyo', true),
                const SizedBox(width: 16),
                _milestone(Icons.water_drop, 'Amigo del oc\u00e9ano', true),
                const SizedBox(width: 16),
                _milestone(Icons.egg, 'Protector de tortugas', true),
                const SizedBox(width: 16),
                _milestone(Icons.lock, '6 meses seguidos', false),
                const SizedBox(width: 16),
                _milestone(Icons.lock, 'H\u00e9roe global', false),
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
                backgroundColor: FaumaColors.tertiary,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
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

  Widget _statCell(String value, String label) {
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
              color: FaumaColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: FaumaColors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _milestone(IconData icon, String label, bool unlocked) {
    return Opacity(
      opacity: unlocked ? 1.0 : 0.4,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: unlocked ? FaumaColors.primaryContainer : _kSecondaryFixed,
              border: unlocked
                  ? null
                  : Border.all(
                      color: _kOutline,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
              boxShadow: unlocked
                  ? [
                      BoxShadow(
                        color: FaumaColors.primaryContainer
                            .withValues(alpha: 0.3),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: unlocked ? Colors.white : FaumaColors.secondary,
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
                height: 1.2,
                color: unlocked ? FaumaColors.onSurface : FaumaColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Photo Feed Card ─────────────────────────────────────────────────
  Widget _buildPhotoCard(
    BuildContext context, {
    required String imageUrl,
    required String badge,
    required String title,
    required String species,
    required String time,
    bool hasNewDot = false,
  }) {
    return GestureDetector(
      onTap: () => context.go('/explore/species/caretta/subscriber'),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _kSurfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: FaumaColors.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            // Image area
            Stack(
              children: [
                SizedBox(
                  height: 192,
                  width: double.infinity,
                  child: FaumaImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
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
                      color: FaumaColors.primaryContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.photo_camera,
                            size: 12, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          badge,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Blue "new" dot
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
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _metaRow(species, time),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Video Feed Card ─────────────────────────────────────────────────
  Widget _buildVideoCard({
    required String imageUrl,
    required String badge,
    required String title,
    required String species,
    required String time,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _kSurfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Image area with play overlay
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 192,
                width: double.infinity,
                child: FaumaImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              // Play button
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: FaumaColors.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.videocam,
                          size: 12, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        badge,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                    color: FaumaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                _metaRow(species, time),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Project Card (horizontal layout) ────────────────────────────────
  Widget _buildProjectCard() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _kSurfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Image (left third)
            SizedBox(
              width: 120,
              child: FaumaImage(
                imageUrl: _kScientificIllustration,
                fit: BoxFit.cover,
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
                        color: _kSecondaryContainer,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '\u{1F52C} PROYECTO',
                        style: GoogleFonts.inter(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          color: _kOnSecondaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fase 3 completada: Monitorizaci\u00f3n del desarrollo',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _metaRow('Proyecto Pintarroja', 'Hace 3 d\u00edas',
                        fontSize: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Global News Card ────────────────────────────────────────────────
  Widget _buildGlobalCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            FaumaColors.primaryContainer,
            FaumaColors.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.primary.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: FaumaColors.primary.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative background icon
          Positioned(
            right: -16,
            bottom: -16,
            child: Transform.rotate(
              angle: 0.2,
              child: const Opacity(
                opacity: 0.1,
                child: Icon(Icons.public, size: 120, color: Colors.white),
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.public,
                      color: _kTertiaryFixed, size: 20),
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
                'Gracias a vuestro apoyo, hemos extendido nuestra red de protecci\u00f3n a 5 nuevas zonas costeras este mes.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: _kPrimaryFixed,
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

  // ── Discover CTA ────────────────────────────────────────────────────
  Widget _buildDiscoverCta(BuildContext context) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        color: _kSurfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.tertiary.withValues(alpha: 0.3),
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.go('/explore'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle,
                  color: FaumaColors.tertiary, size: 36),
              const SizedBox(height: 8),
              Text(
                'Descubrir nuevas especies',
                style: GoogleFonts.newsreader(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: FaumaColors.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Shared metadata row (species + dot + time) ──────────────────────
  Widget _metaRow(String species, String time, {double fontSize = 12}) {
    return Row(
      children: [
        Text(
          species,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
            color: FaumaColors.secondary,
          ),
        ),
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: _kOutline,
          ),
        ),
        Text(
          time,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
            color: FaumaColors.secondary,
          ),
        ),
      ],
    );
  }
}
