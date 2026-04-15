import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class AnimalGalleryScreen extends StatelessWidget {
  const AnimalGalleryScreen({super.key, required this.animalId});

  final String animalId;

  // Image URLs from the Stitch HTML
  static const _heroImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBgZCoxArnW6P8QbkKWGPJm3q_HUwLbWqpv8ZzWZ5nq9xk-J8M8ElCTGt47bbMIFDj5G-hmDMmesL-ToRiaXBZMR12Arem4d6Krs88in-Ea69XJyQ6KZwryba9Z3cCRXoqC4PDFTDmymUL3VKftW1f4rNDebVJ-Jw8z2TuGdsa-mQLWF-0rlEcuP8BDUQXw6l_B12PjTBQfL9zpp6olZbZc77y3XIM_HyOB-xKBt2ruDC0PXsNi2msWwVqHtDXaLd6clS2wRAdgzpus';

  static const _photos = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC5GLDcBGjMSDYj8wQxLVwrvhYWvh2a_QMepwaFFO4WsRaNqvFHP3EXZsOkMAZMcmWc8kfPmuXynB_8GkOVXv7AC45qSnZQbIZmzLoxzBED3IWLPvhDSZbNq1iGX3TOpWRlLevJ4s5BuNLVIKK5rvbrmDBoZEm_AUDFQNfqtvQ8IJVDO_uVokIE2bBF_vAcDahFI-f68e2gTwn0X-guZ6eiejRYK5uwnaK0TUhv-tfOozyynrMPPwPxE7IaEgDpXNUU6iv-dL8jgbQe',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCSIZDY9atIhtWCZZH3kNlnIHonT7i9b3gqG_KzkN92bAoJv-p9lh_WPlRx5Dq8KGhctDvYBxiOFEGIz8OIGuN-H6EJr1fuQbmCbOdpDGl1nhx0SQPmG4l-S9iXsBauFk1bc8nUT-pgep8TDBlnFZcnixVzmVktjle066s7l7JFO654zEyc6whTuAZ7imjl5Je-LsHAFWyM7C7YC-TOjoeE3ydLhSNX5aQzeNzLEE1Z0SXaHIcCIw1sxgRoXwsPCuRKJsZYuIbMqWwi',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuA4Q-Zt_s3hovhlhg7qOQ-9MsvJ0TZ8TDTPjOFKh32zxEqqHqR47qGHzkeMD3vBlMqLH7IByjRrAyc7h7_JMfEnZHCHxpp3lqd7g0Cut25coZnLK40Ai-g_ciMVphc2NCBczci3EJNdAI3KVMoRdGoZNMQzx07FzPZj3Ana0dsVXNm8dan_v7yWtn6rY1oOI29s2O8cIM26eRcofQOshsZV1pGJhLfirifKbWhTCRDzBRKJv1vkCAQcBSJtkkFwJklDhVC76p6Zt4YX',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDuN88J_ZnVoMq5lH_GGshOiA4PQ0K44iQUpLuCxpdUrsO5C2mycIVhwm-kmdCYNXyCMhcItUwCTB3FF4ArYVxO7BNzaQsUTEKo3dGAo01zO17iRU4BGmfOsbzsvffS2kYnCyRgYz4abG0sUM1LYF-_V8K-5DQMgJnwdDgzKRYB_QpVCp9dxw8Itoq44oU5L9bat5y1Xg79ItTzCCjlk7kQdfKE3iw85cxlIZ7H6h4a0iruVNC18995o_cvdlLe3f_zsRfMWdc2uFVH',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDVgOHU7T-OdjoXvyI_YJaaI_XyI8NEDQPxJdM2xFhVDhgCRB2YLBiCr9Jd_lOtFuXRr6sEUxwzMUBsiArKtyylY6u-wUd3OLXoyzC7v3vOIoY_QsGSu9uQ9-YytgGqS0S0ogA9lEZheZ7of1tRw-IE5Dq8ANBWMHk3q6lj3mowphWUpE7vHFcndCWUODFc9Rex4W19ZwlD7jck_J2l1IqOp7cNsHSu4evasMwvToA0eoz5IhKoSNMz9DNe94XSctkcEPCgvxJ2yQYY',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuA_a6su65lGSHaNZ-pZb_Q1fX8kv6WcLV84NAeowIqhCLmztcIHQL1t1LDAf88fC1VtNiTTAqndl2ZrfgSYghMdWjMDpDNAiyew0mLVjmMOXCKDa-5OAMbTXGbnw2_keuQYme_duF7dCa-YiaoB7sBvYD_9GqFGosbGhi7lN5dbaJ3R8FgZ_LFyrUW5YkAGpnnkTjg2WSs5ONpwClsrLMjEVRVBpwBSTfnGxvby4O8h09iDiAcNW9Tts0Z8njRGlLxGt_4epRpIa14W',
  ];

  static const _videoThumbnail1 =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBYbDD3DSx0yhf3zfFQc-pVPm4NH1pL5nNU5IhK3sv_t0yaNkdMtEUPT7G1EZAeNMjh5g8JnTf5NpCo38FWdbNUJUED33uW2Qavp3UwGu0YSyPPTxZoNhi2yRsHOQki-Dthqp2Xi4gl05DdCjCRW9H_bA1enHMHOZoClZTqYU2ghdclyPYFdLHuPws3U6eLYtqDb7toqpcX-I1SA_9DNuuSxiVUWE_EduMEcUZA6YksMoIVcwU6SU8_J7p1iqGm4ELw6oXLvcWXB1ri';
  static const _videoThumbnail2 =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuC_5mKFemRn_eW6HJN1WvSmf1KOaj5mIH5bvv6DSdaBoFwc3JQySp1_EZeJGssrVUOfe6XxliK0q6DrwnSSjOBiPBauBsoc0WQvI2HErvPoO0wg0wYKZB_NauH_MYItUALulK4gUAN7aHU30SXsr3bCBqbCwcSJcmBRms1M6vb4QtVnKOSKEcZgnxweI49I46PmAh3jFHRKBzK0hoTWEO3ZwiHcglNqbd4dCEl3GVHALCsi9sLHW_rGILu2gyo1qilNfysIWq7JOe5V';
  static const _liveCamImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDw3nj7Unmw31FRcZ0EQrKHFC94aXb7hWt3AXoOzrKz7G_XySKCa8huAsNhUomaeOeBFEqCHZhkjr9M-zYBjRyFnuXHHhtK414mhnKQqCVEB8eP3SdYVX2toWSpz_boCyHo2EO39ILdf0y7EZ8oq1f79G9N7nx9oznyrQQNa9Dg_9SkZxwb03xX3crx0i2udh64atwBEyLJsIXTALhqrRqVdrVU8xGumXyVKiqbaSPalyKriR4f-ZC8ldRpuQuanMcYRRoBth-jgoQ5';

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
              onPressed: () => context.go('/my-animals/$animalId'),
            ),
            title: Text(
              'Sura',
              style: GoogleFonts.newsreader(
                fontSize: 20,
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

          // -- Hero --
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
                          cs.primaryContainer.withValues(alpha: 0.8),
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
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.stars,
                                  size: 12, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                'HERMANO',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
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

          // -- Tab Bar --
          SliverPersistentHeader(
            pinned: true,
            delegate: _GalleryTabDelegate(
              child: Container(
                color: cs.surface.withValues(alpha: 0.95),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _TabItem(label: 'Ficha Tecnica', active: false),
                    const SizedBox(width: 24),
                    _TabItem(label: 'Galeria', active: true),
                    const SizedBox(width: 24),
                    _TabItem(label: 'Curiosidades', active: false),
                    const SizedBox(width: 24),
                    _TabItem(label: 'Diario de Salud', active: false),
                  ],
                ),
              ),
            ),
          ),

          // -- Filter Chips --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(label: 'Todo', active: true),
                    const SizedBox(width: 8),
                    _FilterChip(
                        label: '\ud83d\udcf8 Fotos', active: false),
                    const SizedBox(width: 8),
                    _FilterChip(
                        label: '\ud83d\udcf9 Videos', active: false),
                    const SizedBox(width: 8),
                    _FilterChip(
                        label: '\ud83d\udce1 Camara en directo',
                        active: false),
                  ],
                ),
              ),
            ),
          ),

          // -- Fotos recientes --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fotos recientes',
                    style: GoogleFonts.newsreader(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: cs.primaryContainer,
                    ),
                  ),
                  Text(
                    'Marzo 2027',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: cs.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Masonry Grid (simulated as staggered) --
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final radii = [12.0, 16.0, 24.0, 12.0, 20.0, 16.0];
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.circular(radii[index % radii.length]),
                    child: FaumaImage(
                      imageUrl: _photos[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount: _photos.length,
              ),
            ),
          ),

          // -- Videos exclusivos --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Text(
                'Videos exclusivos',
                style: GoogleFonts.newsreader(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: cs.primaryContainer,
                ),
              ),
            ),
          ),

          // Video Card 1
          SliverToBoxAdapter(
            child: _VideoCard(
              imageUrl: _videoThumbnail1,
              title: 'Anidacion nocturna en playa de Valencia',
              timeAgo: 'Hace 5 dias',
              duration: '3:42',
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Video Card 2
          SliverToBoxAdapter(
            child: _VideoCard(
              imageUrl: _videoThumbnail2,
              title: 'Alimentacion en arrecife',
              timeAgo: 'Hace 2 semanas',
              duration: '2:18',
            ),
          ),

          // -- Camara en directo --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
              child: Text(
                '\ud83d\udce1 Camara en directo',
                style: GoogleFonts.newsreader(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: cs.primaryContainer,
                ),
              ),
            ),
          ),

          // Live Cam locked section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: cs.primaryContainer.withValues(alpha: 0.1),
                      width: 4,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0.33, 0.33, 0.33, 0, 0,
                          0.33, 0.33, 0.33, 0, 0,
                          0.33, 0.33, 0.33, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),
                        child: Opacity(
                          opacity: 0.5,
                          child: FaumaImage(
                            imageUrl: _liveCamImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Live badge
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: cs.error,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'EN DIRECTO',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Locked overlay
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      Colors.white.withValues(alpha: 0.3),
                                ),
                              ),
                              child: const Icon(Icons.lock,
                                  color: Colors.white, size: 32),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Disponible para nivel Heroe',
                              style: GoogleFonts.newsreader(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Accede a todas las camaras de\nobservacion 24/7 en alta definicion.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Tu nivel actual',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                            ),
                            Text(
                              'Hermano',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: cs.tertiary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Subir a Heroe',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: cs.onTertiary,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Icon(Icons.arrow_forward,
                                      size: 14, color: cs.onTertiary),
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
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _GalleryTabDelegate extends SliverPersistentHeaderDelegate {
  _GalleryTabDelegate({required this.child});
  final Widget child;

  @override
  double get maxExtent => 52;
  @override
  double get minExtent => 52;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outlineVariant
                .withValues(alpha: 0.2),
          ),
        ),
      ),
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _GalleryTabDelegate oldDelegate) => false;
}

// ---------------------------------------------------------------------------
class _TabItem extends StatelessWidget {
  const _TabItem({required this.label, required this.active});
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            color: active ? cs.primaryContainer : cs.secondary,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(999)),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.active});
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? cs.primaryContainer : const Color(0xFFF3EDE7),
        borderRadius: BorderRadius.circular(999),
        border: active
            ? null
            : Border.all(color: cs.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: active ? Colors.white : cs.secondary,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.imageUrl,
    required this.title,
    required this.timeAgo,
    required this.duration,
  });
  final String imageUrl;
  final String title;
  final String timeAgo;
  final String duration;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3EDE7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: cs.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 192,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FaumaImage(imageUrl: imageUrl, fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(
                      child: Icon(Icons.play_circle_filled,
                          color: Colors.white, size: 48),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        duration,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: cs.secondary,
                    ),
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
