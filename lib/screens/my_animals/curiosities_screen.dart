import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class CuriositiesScreen extends StatelessWidget {
  const CuriositiesScreen({super.key, required this.animalId});

  final String animalId;

  static const _heroImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB19YDBs7wEGYI8TTdIY0_DpZXihoTB3ov2mHS1mk8lrjpgqcDrThyRnknk1C2Ty9we5bjvgj-DnPEFBXtdNhk1kcp__N8rBGSOrp5q1otU2r1OcC07I_1FQs2MKDCMjIb1VikSmUQdvsznzQ61qp3ND0i7Xu41xFl_bIzRIIJWV9TksFYBOdUusiKTS19Sf4-P1Jy_A5LxXPwwu1LlzmtlABh2juEEouV8nSVAWPrR1dC2rBJ08xaUJd-v0kiTzkxEJFqqFim0gdQz';
  static const _userAvatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD7VT3Rd4aCQGkQ_0tXL3G03HNce4vYvKjFaZDXM7td-1PrQ6gu_5S48wzzBgleLqV137VpeJhq6COytUwPQ7GGws5tptgE1KXRFBfo6pFL1MaoGKr1G9oQVk8_ZKEbcIJFI6b-IU3_FvT13CF_uQrIc572aH7oqFtYv9m_EZ3TG-_jb8Y8L2yico5EZMuMxboiB6YJV630Ao36a25JfxEYopjoSTqYicCs4gWuWOfVrmzK1WyjhnDOBBZnXsKch79iAXB3kqtXkSQY';
  static const _nestingImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAhLUxVdmr0dZHNvJ-OjA3KYZZVXRhSHUVHCro-phrenZ-PkKStdcXSISBQr_zZZyrV41FwN_ce-NAgilQnFrwAR6k6DEk654ZcZIg7_LuuX1CNp_zX81mOKruYMnHCmd8tQ1nEsBIWPtGjX40Zc-cxRtmAn8mWPgY-cE9dWu_zrjM_I0-kvBpwUZ29MaZSe0Xm8EvwVCFK7pOmx-nofvCxKmsd1NvLicEEx8ExA4kzh8-mSOv2slA4X_DMMC1qPzVCU47zsTjAEIwl';
  static const _scientistAvatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB8Nl4On2CVZ3R0Znpf-6vP3ueW1MJIsyt_dafi2uAaqgZhoM_4P_sDhy-iPcrF2j6vD2jN3AgtF2C8tcax9ObzdHdWDW3z4jSzmpGMizcuvBPEf5wxf4Vih9ReGAGKbJC2a9IQkaSKoUilxbQ_fj8YjU_g1tvYbdDq2-kzcar87rn2AZ-fdRAFC0xXI9EZxYLu2Q2uIudJY-Wu8P1PE6DwnMe_uBtcQ3--Bgj14YZWPnpcDhClCwixx6mvOEmOj7ssOmfnjvH9yK8J';

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
              icon: const Icon(Icons.menu),
              color: cs.primaryContainer,
              onPressed: () => context.go('/my-animals/$animalId'),
            ),
            title: Text(
              'Fauma',
              style: GoogleFonts.newsreader(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: cs.primaryContainer,
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  radius: 18,
                  child: ClipOval(
                    child: FaumaImage(
                      imageUrl: _userAvatar,
                      fit: BoxFit.cover,
                      width: 36,
                      height: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // -- Hero --
          SliverToBoxAdapter(
            child: SizedBox(
              height: 256,
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
                          Colors.black.withValues(alpha: 0.8),
                          Colors.black.withValues(alpha: 0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: cs.tertiary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'HERMANO',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tortuga Caretta caretta',
                          style: GoogleFonts.newsreader(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            letterSpacing: -0.3,
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
            delegate: _CuriosityTabDelegate(
              child: Container(
                color: cs.surface.withValues(alpha: 0.95),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PillTab(label: 'Ficha Tecnica', active: false),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Galeria', active: false),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Curiosidades', active: true),
                      const SizedBox(width: 8),
                      _PillTab(label: 'Diario de Salud', active: false),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // -- Sabias que...? --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Text(
                '\u00bfSabias que...?',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
            ),
          ),

          // Fact cards
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _FactCard(
                    icon: Icons.pets,
                    iconBgColor: const Color(0xFF8BD2DA).withValues(alpha: 0.3),
                    iconColor: cs.primaryContainer,
                    text:
                        'Las tortugas caretta pueden contener la respiracion hasta ',
                    boldText: '7 horas',
                    boldColor: cs.primaryContainer,
                    suffix: ' mientras duermen bajo el agua.',
                  ),
                  const SizedBox(height: 12),
                  _FactCard(
                    icon: Icons.thermostat,
                    iconBgColor:
                        const Color(0xFFFFDAD6).withValues(alpha: 0.4),
                    iconColor: cs.tertiary,
                    text:
                        'El sexo de las crias depende de la temperatura del nido: mas de ',
                    boldText: '29\u00b0C',
                    boldColor: cs.tertiary,
                    suffix: ' nacen hembras, menos de 29\u00b0C machos.',
                  ),
                  const SizedBox(height: 12),
                  _FactCard(
                    icon: Icons.explore,
                    iconBgColor: const Color(0xFFD7E3F9),
                    iconColor: cs.secondary,
                    text:
                        'Regresan a desovar a la misma playa donde nacieron, navegando miles de kilometros usando el ',
                    boldText: 'campo magnetico',
                    boldColor: cs.secondary,
                    suffix: ' terrestre.',
                  ),
                ],
              ),
            ),
          ),

          // -- Mitos y Realidades --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
              child: Text(
                'Mitos y Realidades',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Myth
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDAD6).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: cs.error.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.close, size: 14, color: cs.error),
                            const SizedBox(width: 6),
                            Text(
                              'MITO',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: cs.error,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '"Las tortugas lloran de tristeza cuando estan en la playa desovando."',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Reality
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA6EFF6).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: cs.primary.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, size: 14, color: cs.primary),
                            const SizedBox(width: 6),
                            Text(
                              'REALIDAD',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: cs.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Eliminan el exceso de sal de su cuerpo a traves de glandulas cerca de sus ojos, lo que parece lagrimas.',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Temporada de anidacion --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                    left: BorderSide(
                      color: cs.tertiaryContainer,
                      width: 8,
                    ),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\ud83e\udd5a Temporada de anidacion',
                            style: GoogleFonts.newsreader(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: cs.onSurface,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: cs.secondary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'CICLO DE VIDA \u2014 MARZO',
                              style: GoogleFonts.inter(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                                color: cs.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Durante este mes, las hembras buscan playas oscuras y tranquilas. La contaminacion luminica es su mayor enemigo, ya que las desorienta al intentar volver al mar.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: cs.secondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 192,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              FaumaImage(
                                imageUrl: _nestingImage,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.black.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Foto: @BioOcean',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.update, size: 14, color: cs.secondary),
                          const SizedBox(width: 6),
                          Text(
                            'Contenido estacional \u00b7 Se actualiza cada mes',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: cs.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // -- Preguntas a los cientificos --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEE7E1).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE8E1DC),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preguntas a los cientificos',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Question
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xFFE8E1DC),
                          child: Text(
                            'JD',
                            style: GoogleFonts.inter(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Juan Diego asks:',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\u00bfCuantos huevos pone de media una Caretta caretta en cada nido?',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: cs.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Answer
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            child: ClipOval(
                              child: FaumaImage(
                                imageUrl: _scientistAvatar,
                                fit: BoxFit.cover,
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: cs.primary.withValues(alpha: 0.05),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Dra. Elena Martinez',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: cs.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(Icons.verified,
                                          size: 12, color: cs.primary),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Suelen poner entre 100 y 120 huevos. Sin embargo, solo 1 de cada 1.000 llegara a la edad adulta.',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: cs.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    Center(
                      child: Text(
                        'Ver todas las preguntas \u2192',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: cs.tertiaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.chat, size: 18),
                        label: const Text('Hacer una pregunta'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.primaryContainer,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _FactCard extends StatelessWidget {
  const _FactCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.text,
    required this.boldText,
    required this.boldColor,
    required this.suffix,
  });

  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String text;
  final String boldText;
  final Color boldColor;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEE7E1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: cs.onSurface,
                  height: 1.5,
                ),
                children: [
                  TextSpan(text: text),
                  TextSpan(
                    text: boldText,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: boldColor),
                  ),
                  TextSpan(text: suffix),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.share, size: 18, color: cs.secondary),
        ],
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? cs.primaryContainer : const Color(0xFFF3EDE7),
        borderRadius: BorderRadius.circular(999),
        boxShadow: active
            ? [
                BoxShadow(
                  color: cs.primaryContainer.withValues(alpha: 0.2),
                  blurRadius: 8,
                ),
              ]
            : null,
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          color: active ? Colors.white : cs.secondary,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _CuriosityTabDelegate extends SliverPersistentHeaderDelegate {
  _CuriosityTabDelegate({required this.child});
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
  bool shouldRebuild(covariant _CuriosityTabDelegate oldDelegate) => false;
}
