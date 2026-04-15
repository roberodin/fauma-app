import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key, required this.projectId});

  final String projectId;

  static const _directorImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAjmKd-DVnjh-V5AnHqnyhLs_ayp1geTmMuzGyu8jy_mztMHFDZxG8vsOfOEGUlc529kV1Dmmn_e6k4IuWQwi0rpvtw8OZBZA7NnEJBYEumEvpz41xUo2bq4Fmag89Rs6s5U0M5lQ4Q3tMTIbljB1CvCjdqzxQn1O_esQ_i47ezgKRDUjb-gbI8mCDRY6kh5wZ-Yx9KSVHO7r3s1Ws3SwABJEUqvpQiHDNk63YLrvsLa-bk_phsEUanoVdnZOCVoLg31P0S5njGOJmJ';
  static const _elenaImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB-MqSnQWDaxkMckXeVLorISfazJt9E7hqMppVPExpZqjkonbe0XnA-Iagl8V-gwBmmKhVOnJI7-JNMtHRl-kQnsAlnb07CJDna-mYJCQvdQFk1hNnxvcVgXLdKBs3fivbiUR4zobHY9tgrdW7KpLVyi4ipvkRqauV3CLKObQplrOPvKH8pbU3Kv-iXncdzy_Vjy0aDe3tMDB7htabYu7KJhCCm8YqtLPkwAf3YbkFz9mtYfsScJsilWUbHnGSNWFYc0wrwXiubEmTE';
  static const _avatar1 =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCjAJOaKKTYfULuhm_QpvKv804zAsSciQhEG5eF-7JHey1ow293xt6ElMYAa8wFDnpw-JFOois9fif5XJfckh6pYBj3_FMMDu0rDXaXS4IC5UwqH1KqPgAK7DM2Loxthca9kYDMhquOS1lt5wYHicNeo_RqpgOVYPKlvyYHHtw7C8ZNUOWT1EtSmybouxvx2CkLpREuN3NV_tZXhjdlRQXBIpJyBwUc_gJcww0bk5ifeZzsE1-ksFVNSBr6uEseyPSk69Frs_AKO4L3';
  static const _avatar2 =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuC6s3zFYcGgtNGAEOsNQAKTL-6bnFu2vvFF-56T_goW9IC-Ydj2OjJNDTpzcQtGUX7FAiPh_5sBQm-oI91PChrBHOBHGu0o-85CkMLKinYVemkJGURiFnHRAwVKyYzpmzHK89b5T9KRQbGFGqug9BPtXZjyTtBEAyEiMT9v0S95B-TR8GrjKnmFT6b8a8oBgjvi5UXbg4l40QTz_Nd2xKPEBjxOvKeZDZFGpooqiU5H0Vwq4QgoMCrhqAgA3mvXlmaERtkNVlMJEWIh';

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
              'Nuestro Equipo',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: cs.primaryContainer),
                onPressed: () {},
              ),
            ],
          ),

          // -- Header --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conoce a los expertos',
                    style: GoogleFonts.newsreader(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: cs.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'El equipo multidisciplinar detras del proyecto de conservacion marina Pintarroja.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Team Cards --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _TeamMemberCard(
                imageUrl: _directorImage,
                role: 'DIRECTOR DEL PROYECTO',
                name: 'Dr. Carlos Fuentes',
                description:
                    'Especialista en biologia marina con mas de 20 anos investigando los ecosistemas de arrecifes mediterraneos.',
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _TeamMemberCard(
                imageUrl: _elenaImage,
                role: 'CONSERVACION TERRESTRE',
                name: 'Dra. Elena Rivas',
                description:
                    'Ecologa dedicada a la proteccion de dunas costeras y la fauna local que habita en los margenes marinos.',
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // -- CTA + Q&A Section --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: Colors.white, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'PROXIMO EVENTO',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Sesiones Abiertas',
                      style: GoogleFonts.newsreader(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Unete a nuestra sesion de debate en vivo con los directores del proyecto. Resolvemos dudas sobre el futuro de la reserva.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Fecha programada',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    Text(
                      '5 de Abril, 2027',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDAD6),
                          foregroundColor: const Color(0xFF7E2A25),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Reservar plaza',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // -- Q&A Card --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E1DC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comunidad Q&A',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: cs.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDAD6),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            '3 nuevas',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF93000A),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: cs.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: cs.outlineVariant.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        '\u00bfComo afectara el aumento de temperatura al desove de la Pintarroja este ano?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: cs.onSurfaceVariant,
                        ),
                        children: const [
                          TextSpan(text: 'Hay '),
                          TextSpan(
                            text: '3 preguntas sin responder',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                              text:
                                  ' esperando por la opinion de los expertos.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD7E3F9),
                          foregroundColor: const Color(0xFF3C4859),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ver Q&A',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.arrow_forward, size: 16),
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

          // -- Quick Stats --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INVESTIGADORES',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          '12 Activos',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: cs.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _OverlappingAvatar(imageUrl: _avatar1),
                        Transform.translate(
                          offset: const Offset(-12, 0),
                          child: _OverlappingAvatar(imageUrl: _avatar2),
                        ),
                        Transform.translate(
                          offset: const Offset(-24, 0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0F2F1),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                '+10',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: cs.primaryContainer,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
class _TeamMemberCard extends StatelessWidget {
  const _TeamMemberCard({
    required this.imageUrl,
    required this.role,
    required this.name,
    required this.description,
  });
  final String imageUrl;
  final String role;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FaumaImage(
              imageUrl: imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: cs.tertiary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: GoogleFonts.newsreader(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.mail, size: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: cs.secondary,
                        shape: BoxShape.circle,
                      ),
                      child:
                          const Icon(Icons.language, size: 14, color: Colors.white),
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
}

// ---------------------------------------------------------------------------
class _OverlappingAvatar extends StatelessWidget {
  const _OverlappingAvatar({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipOval(
        child: FaumaImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: 36,
          height: 36,
        ),
      ),
    );
  }
}
