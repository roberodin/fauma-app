import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

// ── Image URLs extracted from Stitch HTML ──────────────────────────────────
const _heroTurtleUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBOJxs9dtXvXqhSuwabjN1Hx2AxSEXZbshQwOEBe--oJGBI_JCoNcMnS--GBlC-l8LRMi1sHl3Tu_i3IxRpFix_h1nrc0_yFQIYp5ejlMYBwovywFUdkzd-kesgcyDDsGH_oasUod4VQKHHxC1LQt2hO1ArBkAJpIF0d2MKmNel-CrA6Q-ri-U0DtOi81Ws1jseaRXEq1Eqg1bgPlsCF7z2ErdiNSWULq3rhYfcoZrItEHIE09WR7jznOUCGDfnmFVqHqsGMNQjUZsu';
const _cardTurtleUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuANws5Fl-_wAYK_JsM-IBKw5VpMkltVPB8W2XlmkU0JoV97XOGqBuAcc8kAj6QuYMSfrNHXorQ19thdowAGtIV0s6s1Xtjuzw-V9paWEUCQ0wLRtWO3TNmFs7LRJlYJwLKy_hjpUxJm8mfqPPZGpLSjsUjUwXV_N74EpbHarYcr2h8XjjKefouwx-qlRzzdPNbVtjpn1WkFOIn6M0XWD_dvaUdHZA6wTRVV9d4zJzLhtFkxWN7UtwJ0L2ynGD1ckLL6ayEXsCBxB95S';
const _cardPenguinUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB7yIPuQS-g0qyYh71fuVlL7f0lG-_pfpsrt6Wt1KCJBo0fRTCsZh3gEjV9Q7vbEZhDQ1nNIuVkfARANFh3CnyKmHhhuY8nThP_y_NJeCOqSYzn5FcHsymSe5cHxvJ1k6rpEyzUSIPGQC4sKTwZNV7PwygDyJjie-gvyd01Cm16yzJwrq4jN1HaBrMiUdkSO2Qy0sf_lrT54X5DVl2qJ1qCAmwg1zh9SPgCHhW5kln7rWSgcFca1Y8R1uS5Xw7oxq8cvhpwS7Jk6WMS';

// ── Design tokens not in FaumaColors ──────────────────────────────────────
const _onSurfaceVariant = Color(0xFF3F484A);
const _surfaceContainerHigh = Color(0xFFEEE7E1);
const _tertiaryFixed = Color(0xFFFFDAD6);
const _emerald400 = Color(0xFF34D399);
const _emerald500 = Color(0xFF22C55E);

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedFilter = 0;
  final _filters = ['Todos', 'Especies', 'Proyectos', 'Marinos', 'Terrestres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: CustomScrollView(
        slivers: [
          // ── Top App Bar ──
          SliverAppBar(
            pinned: true,
            backgroundColor: FaumaColors.surface,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            toolbarHeight: 64,
            leading: IconButton(
              icon: const Icon(Icons.search, color: FaumaColors.primaryContainer),
              onPressed: () {},
            ),
            title: Text(
              'Explorar',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primaryContainer,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list,
                    color: FaumaColors.primaryContainer),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                color: FaumaColors.secondary.withValues(alpha: 0.1),
              ),
            ),
          ),

          // ── Main content ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Search pill ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: FaumaColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(Icons.search,
                              color: _onSurfaceVariant.withValues(alpha: 0.7)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Buscar especies o proyectos...',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _onSurfaceVariant.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Filter chips (horizontal scroll) ──
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      clipBehavior: Clip.none,
                      itemCount: _filters.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final selected = index == _selectedFilter;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedFilter = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            decoration: BoxDecoration(
                              color: selected
                                  ? FaumaColors.primaryContainer
                                  : _surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Center(
                              child: Text(
                                _filters[index],
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: selected
                                      ? Colors.white
                                      : _onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Featured carousel hero card ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () => context.go('/explore/species/caretta'),
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: FaumaColors.onSurface
                                  .withValues(alpha: 0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            FaumaImage(
                              imageUrl: _heroTurtleUrl,
                              fit: BoxFit.cover,
                            ),
                            // Gradient overlay: from-black/80 via-black/20 to-transparent
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xCC000000), // 80%
                                    Color(0x33000000), // 20%
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            // Bottom content
                            Positioned(
                              bottom: 24,
                              left: 24,
                              right: 24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Live badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: Colors.white
                                            .withValues(alpha: 0.2),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _emerald400,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '847 personas apoyando ahora',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tortuga Caretta caretta',
                                    style: GoogleFonts.newsreader(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      height: 1.15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '12 meses de contenido exclusivo',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Colors.white.withValues(alpha: 0.8),
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

                  // ── Species section header ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Especies',
                          style: GoogleFonts.newsreader(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Ver todas',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: FaumaColors.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward,
                                size: 14, color: FaumaColors.primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Species grid (2 columns) ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: _SpeciesCard(
                            imageUrl: _cardTurtleUrl,
                            name: 'Tortuga boba',
                            supporters: 847,
                            onTap: () =>
                                context.go('/explore/species/caretta'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _SpeciesCard(
                            imageUrl: _cardPenguinUrl,
                            name: 'Ping\u00fcino pap\u00faa',
                            supporters: 523,
                            onTap: () =>
                                context.go('/explore/species/caretta'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Active Projects section header ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Proyectos Activos',
                          style: GoogleFonts.newsreader(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Ver todos',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: FaumaColors.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward,
                                size: 14, color: FaumaColors.primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Project card ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () =>
                          context.go('/explore/project/pintarroja'),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: FaumaColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: FaumaColors.onSurface
                                  .withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: FaumaColors.outlineVariant
                                .withValues(alpha: 0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title row with urgency badge
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Desarrollo de huevos de Pintarroja',
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: FaumaColors.onSurface,
                                          height: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Oceanogr\u00e0fic de Valencia',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: FaumaColors.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _tertiaryFixed,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    'URGENTE',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: FaumaColors.tertiary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Progress section
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Progreso',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: _onSurfaceVariant,
                                      ),
                                    ),
                                    Text(
                                      '45%',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: FaumaColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _surfaceContainerHigh,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor: 0.45,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FaumaColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(999),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Footer with supporters + duration
                            Container(
                              padding: const EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: FaumaColors.outlineVariant
                                        .withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _emerald500,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '234 apoyando',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: _onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.schedule,
                                          size: 14,
                                          color: _onSurfaceVariant),
                                      const SizedBox(width: 4),
                                      Text(
                                        '6 meses',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: _onSurfaceVariant,
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
                  ),
                  const SizedBox(height: 24),

                  // ── Global conservation banner ──
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: FaumaColors.surfaceContainerLow
                            .withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color:
                                FaumaColors.onSurface.withValues(alpha: 0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: FaumaColors.primary.withValues(alpha: 0.05),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('\u{1F30D}', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              '12,847 personas apoyan la conservaci\u00f3n en Fauma',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: FaumaColors.primary,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom spacing for nav bar
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Species card widget ────────────────────────────────────────────────────

class _SpeciesCard extends StatelessWidget {
  const _SpeciesCard({
    required this.imageUrl,
    required this.name,
    required this.supporters,
    required this.onTap,
  });

  final String imageUrl;
  final String name;
  final int supporters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: FaumaColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: FaumaColors.onSurface.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image (h-40 = 160px)
            SizedBox(
              height: 160,
              width: double.infinity,
              child: FaumaImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Content (p-4 = 16px)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: _emerald500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$supporters APOYANDO',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: FaumaColors.secondary,
                          letterSpacing: 1,
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
}
