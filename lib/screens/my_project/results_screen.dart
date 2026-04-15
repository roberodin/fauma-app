import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.projectId});

  final String projectId;

  static const _labImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAPqzsJbLWrzbW7IB-W_6j2RsPD63FCKCCSmlmQDCMDAMuipCQvXNm_b0MY24jr3HHRvh0Tv4SOBHFcjesfFZzprKLrcP3STuYgoLf-bPQIB-ZPGI9mP5JPuwI2jdEf0Du8JEWPdZt3pPJ39MqpOEumRxIibaRbpXj6SwxhX_IptgGt9p5977PByKNOngvx7EemgkRHK8pNbIvqhBFqc2kqCQiSUx8wqUL2caneI6qcl-qGfXVENYaoeCSCJ1K8kCtx5A7K5m7aS8kP';
  static const _microscopeImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCl-3jHbHfDVRdgKHzTR5OqINbtysqCahprja_Pthx-ty-3j0Ko51zW5vCbND4wame0GR3yhebM41UGZTVkepHt1ZBhpEvFWo2OzqLd2XOCFqJlP9FraSo5zmBKUYFQRhfaEpO3B64U6a-n1cFETD3LAfQNRd7B2eeUHeFJPw5owqg2q5YqREgh96ih1x7-WIzBVGjNXjpaCR4Slxzsm8JfRy6WWCPyP-eodsU_sfw4mURuFJzZcWPw73GBaY4VTwXJD8HXvRLoXIgV';
  static const _teamImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBt8UvL0-8P49ML5fTzk8efuC_vFU-vjsEJFwHM7x0yUE7SeXRqfczmwdYrk3TmStKduRk4TftKVzzrpp9v2uOzvTAIUmm_wJ6qsGEDTguLxwURxAWCoHC3MKns6G8udCuHmpRi9l619Et1nGeoyCeD0gmkaoWTpBZWtC-HLDZ669_yzAkeY93tq9Rp0-E3v0picrB3GaUtqVj2YBqh-bNnP8qkxCZjKPxD3GrAOgIGIU_d7L7hstyGqyTVFtoV4-GI5UzNUDZry9IF';

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
              onPressed: () => context.go('/my-project/$projectId'),
            ),
            title: Text(
              'Resultados',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.share, color: cs.primaryContainer),
                onPressed: () {},
              ),
            ],
          ),

          // -- Stats Grid --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.set_meal,
                      iconBgColor: cs.primaryContainer,
                      iconColor: Colors.white,
                      value: '100',
                      label: 'Huevos rescatados',
                      bgColor: cs.surfaceContainerLow,
                      valueColor: cs.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.favorite,
                      iconBgColor: cs.tertiary,
                      iconColor: cs.onTertiary,
                      value: '87%',
                      label: 'Supervivencia',
                      bgColor: const Color(0xFFEEE7E1),
                      valueColor: cs.tertiary,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _StatCard(
                icon: Icons.psychology,
                iconBgColor: cs.secondary,
                iconColor: cs.onSecondary,
                value: 'Desarrollo Optimo',
                label: 'Analisis Craneal',
                bgColor: const Color(0xFFD7E3F9),
                valueColor: const Color(0xFF596577),
                isWide: true,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Progress Chart --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Progresion de Eclosion Mensual',
                              style: GoogleFonts.newsreader(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cs.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Seguimiento de nacimientos acumulados 2024',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: cs.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Eclosiones',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Simplified chart representation
                    SizedBox(
                      height: 200,
                      child: CustomPaint(
                        size: Size.infinite,
                        painter: _ChartPainter(color: cs.primaryContainer),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun']
                          .map((m) => Text(
                                m,
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  color: cs.outline,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // -- Behind the Scenes --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tras las camaras',
                    style: GoogleFonts.newsreader(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: cs.onSurface,
                    ),
                  ),
                  Text(
                    'Ver todo',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _BtsCard(
                      imageUrl: _labImage,
                      label: 'Control de temperatura en incubadoras',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BtsCard(
                      imageUrl: _microscopeImage,
                      label: 'Analisis morfologico semanal',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 256,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FaumaImage(
                        imageUrl: _teamImage,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.7),
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
                            Text(
                              'El equipo en accion',
                              style: GoogleFonts.newsreader(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Colaboracion entre universidades para la repoblacion del Mediterraneo.',
                              style: GoogleFonts.inter(
                                fontSize: 13,
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
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.bgColor,
    required this.valueColor,
    this.filled = false,
    this.isWide = false,
  });
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String value;
  final String label;
  final Color bgColor;
  final Color valueColor;
  final bool filled;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: isWide
                ? GoogleFonts.newsreader(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: valueColor,
                  )
                : GoogleFonts.newsreader(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: valueColor,
                  ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: cs.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _BtsCard extends StatelessWidget {
  const _BtsCard({required this.imageUrl, required this.label});
  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FaumaImage(imageUrl: imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
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
class _ChartPainter extends CustomPainter {
  _ChartPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.75,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width,
      size.height * 0.2,
    );

    canvas.drawPath(path, linePaint);

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
