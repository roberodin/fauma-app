import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class MyProjectScreen extends StatelessWidget {
  const MyProjectScreen({super.key, required this.id});

  final String id;

  static const _heroImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDJU9Aai_eQ2KCBOQS1behOBVmfz-k19nZbV6uFCjeaftapMEpHkY-ooyAXaDIRYuhfzIPVSyuANm-Bi0fYQBk287Njk1SatqMIkbYbPU2YdaYyJ8C0I1vKdu1spEvjwXm6kNldeX21P2MlYtrYhF0ODSLcjMaRb9NVlI39AGDP3jciUG9QbZjyKCyg_M0nHQ6dIVEchM_Pnhorzf8WLlRv8OuJS5t7EV-H1GFCtUOpDXKnC26VaTs9U9fqKK_l2kjCP5KoqY6QgGHN';
  static const _illustrationImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD2mCAxtCxKY7AiZ7HbJzfNEYsGrFT-Jotx5G2cwKFJWp3zurrxs0Nbzia3RAHZ59nVuaarICgM7HadfdfzDBc5_pUj_WZgQ6C7xcqd4TbqhFkk-fLKibErxl_YWqRz2mMVTj0GgGPXo2VxS55Q4WMtyD5Kzc3UUvq_hTNnpGeEFU9TtvGxiSGj-uVP65H4h3qlTFXZlbHAwKWU3bUWNhGNhP6XftbA5mDDaQZqSrqmunlt9wRNpX99oaKgqWkn7MGnaPC7drl6FbUj';
  static const _anatomyImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAgv2FlmiqvEjxHdp8Zuc6Oq5Z_nnp5WcWCwfhnkB6D35EtUYH1tU2qAG8WkppYPo0F-6nB1VsOa6n2Y7VVEdnRZxQCa51e1F9zxj16XBjvV2VJX3GgVU2nsAcs4LjF-DGDjKL842tIpGCoalEKwIyPwa4d4uzYyr9vY07UYMFEXSwmAPSUreaHWImsxSxDuwNLLdrYpByG_CEuZjvFekjrQv4tDhUeGQ_HxUrdu5Lul2hbV634pr2T98-wEShEPo8HYgmQH-jhw78Y';
  static const _mapImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBYZvZS5WcUsOi24PLmWMMMdnuWTUfx7U73Tq2zVEbaJtmYHMRpM1pya6vzpMqVYRSH2wYLRmrSHrpXsL4gbyq9P_PmPxfe_lN1Qmhj6xSsyC_zBp7m21Ss_Bc6_5nuhWyw-MADnyKrVOvGPu0BNthobpQIJiMmiG6De6s2Vs-km3GEc0BiuyxUFzajCWGL1gMUSdpa9gMnfRt2Ub8QWeuYsd5Yfft917-gHSdwCt2PX_jwJockBtL6rl7w_P9xktWxcRc-P9fM1cc-';

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
            backgroundColor: cs.surface,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: cs.primaryContainer),
              onPressed: () => context.go('/my-animals'),
            ),
            title: Text(
              'Detalle del Proyecto',
              style: GoogleFonts.newsreader(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.share, color: cs.primaryContainer),
                onPressed: () {},
              ),
            ],
          ),

          // -- Hero Section --
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
                          cs.primaryContainer.withValues(alpha: 0.9),
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: cs.primaryContainer,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'Oceanografic',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: cs.tertiary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'AMIGO',
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                  color: cs.onTertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Desarrollo de huevos de Pintarroja',
                          style: GoogleFonts.newsreader(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Tabs --
          SliverPersistentHeader(
            pinned: true,
            delegate: _ProjectTabDelegate(
              child: Container(
                color: cs.surface,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFFE8E1DC)),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      _TabButton(label: 'Timeline', active: false, onTap: () {}),
                      const SizedBox(width: 16),
                      _TabButton(label: 'Ficha Tecnica', active: true, onTap: () {}),
                      const SizedBox(width: 16),
                      _TabButton(
                        label: 'Galeria',
                        active: false,
                        onTap: () => context.go('/my-project/$id/gallery'),
                      ),
                      const SizedBox(width: 16),
                      _TabButton(
                        label: 'Equipo',
                        active: false,
                        onTap: () => context.go('/my-project/$id/team'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // -- Taxonomy Title --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pintarroja',
                          style: GoogleFonts.newsreader(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: cs.primary,
                          ),
                        ),
                        Text(
                          'Scyliorhinus canicula',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: cs.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFF3EDE7)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FaumaImage(
                      imageUrl: _illustrationImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Morfologia Card --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF3EDE7)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: cs.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Morfologia y Adaptacion',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: cs.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FaumaImage(
                        imageUrl: _anatomyImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _MorphologyGrid(),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Data Grid --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _DataGrid(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Distribution Map --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF3EDE7)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Area de Distribucion',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: cs.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.grey.withValues(alpha: 0.5),
                                BlendMode.saturation,
                              ),
                              child: Opacity(
                                opacity: 0.5,
                                child: FaumaImage(
                                  imageUrl: _mapImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color:
                                      Colors.white.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  'Mediterraneo y Atlantico Oriental',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: cs.primary,
                                  ),
                                ),
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
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Threats --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Principales Amenazas',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: cs.secondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _ThreatCard(
                    icon: Icons.sports_outlined,
                    title: 'Pesca incidental',
                    desc: 'Capturadas frecuentemente en redes de arrastre.',
                  ),
                  const SizedBox(height: 8),
                  _ThreatCard(
                    icon: Icons.thermostat,
                    title: 'Cambio climatico',
                    desc:
                        'El aumento de temperatura afecta el desarrollo embrionario.',
                  ),
                  const SizedBox(height: 8),
                  _ThreatCard(
                    icon: Icons.factory_outlined,
                    title: 'Habitat',
                    desc:
                        'Destruccion de praderas de fanerogamas marinas.',
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Conservation Status --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF22C55E),
                              width: 6,
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'LC',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF16A34A),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ESTADO IUCN',
                          style: GoogleFonts.inter(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            color: const Color(0xFF15803D),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preocupacion Menor (LC)',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF166534),
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: const Color(0xFF15803D),
                                height: 1.5,
                              ),
                              children: const [
                                TextSpan(
                                    text:
                                        'Aunque su poblacion global es estable, se observa una '),
                                TextSpan(
                                  text: 'tendencia decreciente',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                    text:
                                        ' en el Mediterraneo debido a la presion pesquera. Este proyecto monitoriza su reproduccion para asegurar la resiliencia de la especie.'),
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

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _TabButton extends StatelessWidget {
  const _TabButton({
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: active ? cs.primary : cs.secondary,
              ),
            ),
          ),
          if (active)
            Container(
              height: 2,
              width: 60,
              color: cs.primary,
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _MorphologyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final items = [
      ('Aletas dorsales:', 'Situadas hacia la parte posterior del cuerpo.'),
      ('Piel:', 'Denticulos dermicos que ofrecen proteccion.'),
      ('Ojos:', 'Adaptados a la vision en condiciones de penumbra.'),
      ('Capsulas:', '"Monederos de sirena" para proteger el embrion.'),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items.map((item) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 96) / 2,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: cs.tertiary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(fontSize: 12, height: 1.4),
                      children: [
                        TextSpan(
                          text: item.$1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: cs.primary,
                          ),
                        ),
                        TextSpan(
                          text: ' ${item.$2}',
                          style: TextStyle(color: cs.onSurface),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ---------------------------------------------------------------------------
class _DataGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final items = [
      (Icons.straighten, 'LONGITUD', '60-80 cm'),
      (Icons.fitness_center, 'PESO', '1-2 kg'),
      (Icons.scuba_diving, 'PROFUNDIDAD', '10-400 m'),
      (Icons.set_meal, 'DIETA', 'Crustaceos'),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items.map((item) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 60) / 2,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(item.$1, color: cs.primary, size: 28),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: cs.primary,
                      ),
                    ),
                    Text(
                      item.$3,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: cs.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ---------------------------------------------------------------------------
class _ThreatCard extends StatelessWidget {
  const _ThreatCard({
    required this.icon,
    required this.title,
    required this.desc,
  });
  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.primaryContainer.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: cs.tertiary),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: cs.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: cs.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _ProjectTabDelegate extends SliverPersistentHeaderDelegate {
  _ProjectTabDelegate({required this.child});
  final Widget child;

  @override
  double get maxExtent => 56;
  @override
  double get minExtent => 56;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _ProjectTabDelegate oldDelegate) => false;
}
