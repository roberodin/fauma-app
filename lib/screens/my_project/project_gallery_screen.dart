import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ProjectGalleryScreen extends StatelessWidget {
  const ProjectGalleryScreen({super.key, required this.projectId});

  final String projectId;

  // Hero mosaic images
  static const _heroImages = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC9I7RgzE4vPJRNcfKv1gU_qCA3W3f3-U5nUFROGETFwLZLxeMh2cjC9rlT2uboy10xTBbLfy6HxCoTAVasQ4tqMwd7Wu0qyvE3JSv-Pvd7EsDznOTobJxEVbhltteRz4ONSGmd-wD2Y8o6nPmJLzfknkJQoU9ClzzgORu8iSkBZlhkOsPtk0GAmYeR0P8AWwzqtKWRKgAQ5_4iXK-TrhqFIF7aDTG8KFImdL452W5bTtofGsKQjd6Yk5LI1qrnwiY3DciURoALbIZM',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBp2Q1QnWwn0j4nBR2E1ylPHNnYUzUDWzB2qD4lxh89LT7nbpicREyVW2pda9j0UhC5qtdxLKYXD7PCx6PzIYw3RK5wwlBsmQzU50OB7dGc69qZskfXASXX3cgoMkAGxOKJXNzFHWPHPXlEu9U5CBrEic6obZ4Iv7iwlnkcB-qsIiQ5gjFr8oqalXm9pMl7NPBgW-40L7r-7ComwhLcPhKXcaTjsfZ_TRBY3_JpKG60eT1IqWJM-lD1pMEx6LULoRV5PbKZ67PkHG3h',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDUGeojBtxZqo8tA-PQD7__pJGhj2wnohnozgerWJzMA_8k1GVffNO14-CrA58Y8IzKQackQCC9gfBN_tXFIwYTzyIO0dNI3m6AGNERfa1jDmiCRkPV8mJjCIWwd203WpYyQEzza2rOwDGwPXTcAomuG5JVVOWHYZ4xtFKp4tIgbhF5I7lXa1f_-2EAwqqnfCfzl409SBqzPZVpg1BKV2umcVikk6AMPmCN63F5vtrddEfIZLq6Ri3xvjHIzbW0kkRYU6_CgL5f6dos',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuARO2jIGQaPoS1GT3kDYWLj8fEnXAtFJcyNH4ODIa0tnT8wearUW59uVbRz1-YV5lLZ2_5OjOGbTu4smlYVAenQelWR3VmKhS2tstphnupXvVSJPEwE-VbnuSdEQpft11zLANXWW-HHSDMcyaLaoIENvqoZS2Cu6UaIMerfnNor6llskkc2iG-ff-5EXnW-nVswAl7U4sDgONVYII1Yg5YB7ELKkr41yD3hjjfCLK4f-8maMGJ0lb9Bz4LzAlcz2aYS2UDh-L97zijl',
  ];

  // Phase 3 images
  static const _phase3Photos = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCrR74Q1HwaA4KPY099up3Hq2sX88lxUkGNsPwbAb80rD2NQ7L2VRwsSqKV_0F7NDcH_ESBcQOJLr6IDhUpzDXp2INHOyxFRnrkIJtomd1PrXVEkDRPjCN5RC8rQ0WNMOZFY03tLFpFI8Cu5Nc03mDAdHrGH2Vmx2P78RuNBrSO4o0qLDv3lo8fRu_XfyQCrvPDkzi4-s43R4IggLDZMw0oCfjwLd8OhKRmS0hSGTDYMLzgISkWNcXnq3Hqy0ZQ0znXtIhjzfDSX4bK',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD5ZXwbeTlgytYiLkBJfWAJq7SDdEPc4xOXqgJpCPmZcx4-UuDGLkGeFFe6hchGRHxkkQ0M5ftWYCYUwykxbSjjIbvOV4NWq6_ZMcHD2Oee1gEm-xDmMF8_PgwA9_W4K-EbT16fQ-J9MaWOVyaD7MjxYZUZxjN3NpgiTKKQpxsPxFZMI3w1QIV5VVB58MzkyirMUqlyVPYSJbstgYdNDjIXqRiBWg0DeDTFaES4XMGj-wn7SPnZTGHDg0_6dAMmcox_OeipJzv1Mq9f',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAk3BnG3UTQaKniLvfMOXcuM0jWnRXuXuO-oCtLRDu1Wy6EODYJt__XED_BJ-Zux2C9jpOPsLpFyeQgHXahDy4f-i0Bcf3eoYyLBRZckRNw2V6IlmtJTgMLXcBkwi_Uo4N4bw7E3tGLKOigviF9qPHKEUNBogjgKWQt4fmRjOpx4NLpCpMXg2wBmgTb4aptuorexQ5SmBd6mJWFrlRZFam3SrxPRjoOVLVuIUhrsoScNUbtR55ESvcYflBi93KfFZppVUKlvBWkIOHI',
  ];

  static const _phase3Video =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDbmtx3j5fJC0T2L5gsWhctF17wiC6YLXqg61f7u5Yv_v8TlVieV0qGRJwZ21ffNLQqRup0bXSCqeIpGx_CCGXH08Zax_jYY9vWDm5oCuTgrRQ4DdtaEI56ah_oPs7z3J23RnPrlfK9K-MHnfVAMs6h4OBsNiaMEoUnKg_E1ww4Eu_V_Sjq777YNwt5aJrtDo-_eBF95I1In5wI5Qgck225RJJZHYW4mtFm800veXpGNG5YjhxYBOE7mYArrSBz2YFCHcGrKr8wnC6F';

  // Phase 2 images
  static const _phase2Photos = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCTtkgGNWbybBo274UM8QJiauJHv3dHZBYpYV5q1kY4ueNHI17XmOk5TkwIYKse0HFU2HQxTR4VDIYnfgYv5wC785GbqrBuezrWYbqwz1dkA0ZX00jGST2ZHdr0BUhXqwi0_ODbHcju6vU5pAjtJIlXv2ONc7cGdBF2AStaqVSv3heyqmWnIkVuWwXFUnZ3bhTt7GMoQaA0DAzcIhwKib94jvIiYbFBPvsQz0AFK-QxfCY_xZzb-LIXMikRkwgn2rxDzfWTP8v-H3nA',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBknQlQ9SqEJCCj1kXxuOCg4NSKYIfG6yX_PXPbA6jbZrWXn_2MNvcM7o64uImC5fnoBoPlMZKmEABTbFzx7IFYfVSlM51P2Sz_DqLC1M19CryU01o6tDBmsdYSZp01Q5iiLNjIouoJA8LNDF0ZDKC-0Ou603Gxhnl4KVnVuF8Eo9ARru_ucETP0AINhv1hCCGdneYkFodRfoR682zX-H_0_Xa0BfvyKh9HCCEO9gKTBJAvWlY7_1pAik-yHiUY3wEfQ7_u4V6VpzAa',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAumj2romfrtipfIwDUINxlN1RvPHZGbxKVYgmJGcOzCcCFPV2pPemnN8nHsW3CcyqPmM52ClPDYTFhTYb7b04vPDJJsO5QrW48cufkGwi1N1dcTXHsZQwMcKWK08tI_Djp62KC-h6KbBQ9VZK5cD02iMRBp424EEC-Z64Pcom7ZdQTtiAAEXidEbU_NXOvmK7UvRZMczYxUhBPMzOQ3Ld8PiNGYASI5_L6b-oMLeoN-Gk4QT8Ju9PoXaWIhAFlltkWs_QodMLZEtS7',
  ];

  // Phase 1 images
  static const _phase1Photos = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCvkH5AR7Tjm-Yqz6_9n16I3HO3dfAthv30JtYMEgydpsmhVMfQKhsp5i-vD8BFhx26zxBTmnwUJIhbyt_OIhTLfqJeDAJPPGnzXORU2uEqOc84WUjcS--1EGqlPOElOrLBJbAGS_lDspoTAbwbFOhFF1Fy1dhDLQqlDbz4K2tclaJneBVb4Zk3Wx0YUEbzg6obdN2fLc81MGUDVhJwdvEdhW0tNAokkNYOIG4JYoGrmKE2pf1N2V3gaqRQjWxqNk0EAxtE0-E4l9eV',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCxUyoiypR3BU7PhUWoOY7Nmv1QSk7c0sWbUJ2HR7KrHGynWnzXb3ZeAnAkfMJqNIDzAWQ_GB1CwYOGBcS840wxGzB3HqCN1VB5cj6DZGWw_m3M6_mJPIQipUfP52Iw7Fo20rRGmmwt19-btSXrdyWWh3St5WmtF9RB9gFnHgx3v6SDNOyC-arbXLmReZTFiUDaRKR8aHi1FAlH8qJxUS5FtJDlzh9NbbTqowsEbHoOuacdKHpi2cLY5CwZ29kueDFS81Zk-yMQ-4lE',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD9IZwQTCwhhxZqpbe-9CCGUZFZphJG9QPop4iMELPvaWOv-acmgFf8SUnXKCjVyHRZQXMgUgVyvKTzUuEqFlwXsNmRBgMVORJ9113H6zNpYcQSLEfNfVel4xpG3u_2_j1RKUuERbP9r3mSd_DOZGi756sE6-klCOxh89S3UEXHsDEaVMWAe5DI1r6uNEG0MkYW0HZ-u_g6Es7-IZP9do-ucOys8U63-VpWTt-BTVIJN-K3k8cqConQuWpKHs9MfgkXhR_QCrT8_XHd',
  ];

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
              icon: Icon(Icons.menu, color: cs.primaryContainer),
              onPressed: () => context.go('/my-project/$projectId'),
            ),
            title: Text(
              'Fauma',
              style: GoogleFonts.newsreader(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            centerTitle: true,
          ),

          // -- Hero Mosaic --
          SliverToBoxAdapter(
            child: SizedBox(
              height: 224,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Row(
                    children: _heroImages
                        .map((url) => Expanded(
                              child: FaumaImage(
                                imageUrl: url,
                                fit: BoxFit.cover,
                                height: 224,
                              ),
                            ))
                        .toList(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          cs.onSurface.withValues(alpha: 0.8),
                          cs.onSurface.withValues(alpha: 0.2),
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
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: cs.primary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'NIVEL AMIGO',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Oceanografic',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Desarrollo de huevos de Pintarroja',
                          style: GoogleFonts.newsreader(
                            fontSize: 22,
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
            delegate: _GalleryTabBarDelegate(
              child: Container(
                color: cs.surface,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: const Color(0xFFF3EDE7)),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _NavTab(label: 'Timeline', active: false),
                      const SizedBox(width: 24),
                      _NavTab(label: 'Profundizando', active: false),
                      const SizedBox(width: 24),
                      _NavTab(label: 'Equipo', active: false),
                      const SizedBox(width: 24),
                      _NavTab(label: 'Resultados', active: false),
                      const SizedBox(width: 24),
                      _NavTab(label: 'Galeria', active: true),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // -- Stats Strip --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(count: '47', label: 'FOTOS'),
                    Container(
                        width: 1, height: 24, color: cs.outlineVariant.withValues(alpha: 0.3)),
                    _StatItem(count: '8', label: 'VIDEOS'),
                    Container(
                        width: 1, height: 24, color: cs.outlineVariant.withValues(alpha: 0.3)),
                    _StatItem(count: '3', label: 'DOCUMENTOS'),
                  ],
                ),
              ),
            ),
          ),

          // -- Filter Chips --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Expanded(
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
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Recientes',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                        ),
                      ),
                      Icon(Icons.expand_more, size: 16, color: cs.primary),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // -- Phase 3 --
          SliverToBoxAdapter(
            child: _PhaseSection(
              title: 'Fase 3 \u2014 Monitorizacion',
              fileCount: '17 archivos en esta etapa',
              badge: 'Nueva',
              photos: _phase3Photos,
              videoUrl: _phase3Video,
              videoDuration: '4:12',
              videoLabel: 'Time-lapse: 30 dias',
              showDocument: true,
            ),
          ),

          // -- Phase 2 --
          SliverToBoxAdapter(
            child: _PhaseSection(
              title: 'Fase 2 \u2014 Incubacion',
              fileCount: '18 archivos en esta etapa',
              photos: _phase2Photos,
            ),
          ),

          // -- Phase 1 --
          SliverToBoxAdapter(
            child: _PhaseSection(
              title: 'Fase 1 \u2014 Recoleccion',
              fileCount: '12 archivos en esta etapa',
              photos: _phase1Photos,
            ),
          ),

          // -- Phase 4 (Locked) --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Opacity(
                opacity: 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Fase 4 \u2014 Eclosion',
                              style: GoogleFonts.newsreader(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cs.onSurface,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.lock, size: 14),
                          ],
                        ),
                        Text(
                          'PROXIMAMENTE',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: cs.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3EDE7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: cs.outlineVariant,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Contenido bloqueado hasta el inicio de fase',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: cs.secondary,
                          ),
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
class _PhaseSection extends StatelessWidget {
  const _PhaseSection({
    required this.title,
    required this.fileCount,
    required this.photos,
    this.badge,
    this.videoUrl,
    this.videoDuration,
    this.videoLabel,
    this.showDocument = false,
  });

  final String title;
  final String fileCount;
  final String? badge;
  final List<String> photos;
  final String? videoUrl;
  final String? videoDuration;
  final String? videoLabel;
  final bool showDocument;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.newsreader(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurface,
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4847A),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            badge!,
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    fileCount,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: cs.secondary,
                    ),
                  ),
                ],
              ),
              if (badge != null)
                Icon(Icons.grid_view, color: cs.primary),
            ],
          ),
          const SizedBox(height: 12),

          // Photo grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FaumaImage(
                  imageUrl: photos[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),

          // Video
          if (videoUrl != null) ...[
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FaumaImage(
                        imageUrl: videoUrl!, fit: BoxFit.cover),
                    Container(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                    Center(
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                        child: const Icon(Icons.play_arrow,
                            color: Colors.white, size: 32),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          videoLabel ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          videoDuration ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          // Document card
          if (showDocument) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3EDE7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: cs.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.description,
                        color: cs.primary, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\ud83d\udcc4 Informe preliminar Fase 3',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface,
                          ),
                        ),
                        Text(
                          'PDF \u00b7 2.4 MB',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            color: cs.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.download, color: cs.primary),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _NavTab extends StatelessWidget {
  const _NavTab({required this.label, required this.active});
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
            color: active ? cs.primary : cs.secondary,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: cs.primary,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: active ? cs.primary : const Color(0xFFF3EDE7),
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
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: active ? Colors.white : cs.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _StatItem extends StatelessWidget {
  const _StatItem({required this.count, required this.label});
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: cs.onSurface,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: cs.secondary,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
class _GalleryTabBarDelegate extends SliverPersistentHeaderDelegate {
  _GalleryTabBarDelegate({required this.child});
  final Widget child;

  @override
  double get maxExtent => 52;
  @override
  double get minExtent => 52;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _GalleryTabBarDelegate oldDelegate) => false;
}
