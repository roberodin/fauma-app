import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

// ---------------------------------------------------------------------------
// Image URLs extracted from Stitch HTML designs
// ---------------------------------------------------------------------------
const _heroUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCick2KO_grfJ2c0_FaIn9CMUuKaI_S7qHsv25K89XtQCSZYIpLMNE3oCZ15638AMwVvj3rKRjnOiZreuU3cqff8GN7XFGqgGQ1vRGvxUZUfTsGLwWWsJIJFxdQ3jG1gjlRc5ueXKH4D-H09_2dSpkDE3DCvUN6sWzjxY9dKBiBA6w8pDnCA7cQLSnMke9DNgIJwXKKkTZwcaORUhnUQeRNvsSeNX8-imlTtK4ub8Vd0MA-6rZJYuowSwIFa8UzKppXx2lTkiZENH8I';

// Gallery images
const _galleryVideoThumb =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBkv02WukIV-LtFFZ3UNnoJjAUbvBK1H2ylsnnbL0CcPpgdHSneTI0AdyaDhpynYzRADgN8msJiJUonY0a-m4-KUf-Dvm8OpvaE-9yxdHLsPcEcNdsX9y5Yu_dwP_MdLtKj1OJQy9q7zV63AUoLO-vXD3Bq2k-BTjUlGo1t8dCOfE7AC3lqHRsPRNHOciAWa7tjzwiNIXqkyNLAImYkcxFNqL_c5fbqSTdq-aQkVc8snLv87rdP-IY3FCuCGzlY5UHE5HAfONHWIvYV';
const _galleryPhoto1 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDLkLQFGZwoTeASMES5QzDOHV-R0641JY927Xjy0GTP2PjLyaoBq6Iu6eQWJkFS1SwN84zR8lDuVm2Jyy3zn_Splkh6P2h4QJI74CHriggs5tB_OvR6bnVj_Vp_hTKA2i1M3_vXNLylMB2hOAC4jFpC5uDVIf4vDaTHknwHpQXRKMOe6oXwPBIl50d7wANMHHKfdBvxCs69-9Q0ZIEo4WcqyvXBxkpqHqvgWs3f0SxvkDGg8fPVxq7pn3F-q3bsD6AFQ1kJRLL6EB8Q';
const _galleryPhoto2 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCQ5SUcLBSXXwbmuj4Xu74VlYIZX1r5WfzHdVfAmU816u6s2MZ4nKj2n5dhE2jw65bwVQ6rSBZuKkZyZw54bf0Bgq1TBjEnsfFNG1gagtVvT4sj9JFvR4V35oH1Vt9aLZDmKx2CL-mglfhMmCJgZw1Tp3bQmPCOg1fOiR6V5tknUimymwtfJsGPX1TC8HQAICV3zTWfuPuHAG37cnaC7gRI2IeP-aph3BloavYGMbREc9A1yMKauPoZTuGwDLsgIGJtyPqU1ftAjRJL';
const _galleryPhoto3 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAtUOwlfaZzxOtxe_afteRQGzKpQG3hpCRzlH2Ofim7PLk_woZzB-kdp1BUsMaD3eEILc45YyHlGWgCpMed0IEo7dw_29q05UDs2wDP1UvvHnlZ-8VpxIIVZje8WtQwC3-qnJ7EfERceY_uGX9NsBcCGRx43taJzIXxdoZhUaeay4OKFwlKYvWkNO6sssDmrp3OpFGXtKVjfxrc3_Jop2DRXwnTDU33LvFNDsuQ19tp7qJkgE5fD4DPmDD2nPHJTL7dq2V9Yfju0tzx';
const _galleryPhoto4 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzvZVwd3Fbx3Yi1-cVwrtyD8bJ407OmAn8QoUlZY9dnPQcYFJloHEoBvLh_NksfBdeRoF3Ejwrzqun0LH00gnGqgAu1rE62XfB60t2RWLSnd4BXDe5MHSYQMp4LdrCy64sV3mk0UUa3H9dv8n6DZ8kNIbX18_-qS8aaIvfrV6KNtnaskO4zcBLpKgkSHmn8wacVogdthW_1ze-eAbMKn_cJgq36xMMzEIcGmumxsn6QfcFXzxFDQn_PVCRypZJl-zNwW6v5xB63dhz';
const _galleryPhoto5 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBhpMtTWw3X6J6py8sHWqt3xLk2VJTKonOhWl6P0udK2rbXHs_rkY5zXnrdtY87qd7QvzmCa0MMt9wZgF_dywGULp8-yzoi8dfUntZs_ESTfGD1eLI1iRrMrGPhAalGz7lIhCOLNsUuLt1tpNIVgM-z62RO5cVS800gaVKMJqIxBEBKsX3VdnIVCl637-Mu2sU6l6pnqZDAy_PPAcrYA_ycMaRQMK70XWrZoLdgKoRayIvvCCK0WsACou9ncdzBuGAPcdcEKpigPfU4';
const _galleryPhoto6 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCBkPfLHNrdKmGO0Hz7lG4GyOYoe4s0BVMeKJkk4O8vDqoB9RmdY3MjTSYHGnqk9DV7lk1onDdJcHrhBxHFoQKwQemxmenloANvir5rKhFc1i1Br_726_yeyJjsFUu4JOxQkkrTWz1n_7tq5l0_IZzb0Abc6vhjcGvzlnZ8cFQzCcNCcbNY-KJwBEbmvnZUI5mmvs08mighach77i2dnaYA3Rr0jUJzZm7ZliPSJCwRIF1oC9u54RPHa4dwbSzmgC8lMNXINXpBTqkd';
const _galleryAcompananos =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAsY6qZkd5BSQtKHw18NrmJiON46RN-QG1eaq4SdlJSxTDoLTPe5Sbk-MiEDNw8Zfc9mRjO4e-MYMjLTyLCxaLtEiTAPzbX84-nzAYzWSs8zcRtYynsaD2OImKTIJnCk4R7ZNsVKubgivL7z1Vycd5StCzImUIJizkh9tQuKVck4NZ7T7_igEmu0qHTA4d4zvoLvafO1o52YiOL0aWFfrQYxaIsecYbMAPbX6Hsib1uvkX2tkZimtpk0OvCOx2Pr4w5F0tSertakfoW';
const _galleryCamara24h =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC6DlOX5fY8rpwpQFbeR_ICCwQ0FQ-Cg3MoHOgXIir2VEySA7WKt3QJ5RHTLA9zPcjseMtE-yvEotm7lZoB_Zzjh9DJzG2z2_EjLakD6CkAE1IFJw0VhYb2i9l0anvUlm5Qhr6mOjy0vtHu0UArTMiT64UPxUQLikwRwweFGp6bYOKWi6Z9_HotsQNo18h3PrTcekLu9lRG-0sqQwTPjhqPg4IEkdKAXyOQXhDiI8HG0NPWs00udyF6brXnIV3FZgFbbuT6V-Ka255U';

// Ciclo de vida images
const _cicloVidaMarzo =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAf8mn8Ac-NT0bkja-6CwVjnNvKdTiykKUOJlnFEb38nFtJELGH4X195lVV_7PSXTsqZN96zKkdv_s_p6fFyCI-a95_JnR2gh8XE1XqFQi3RSVl5p9fhVMnT5qLyXqzC7yaagRrM5rUGpAgzBnfZT_VLG9B3xXJK8tyYnTOLZ6552EBEAPcFG_Ic1xWO96KRddgNClQ8HOTjiGKkNkmTs70HDsuLBbqcla1lWUIEZX6AtKP1zedrAL5WwDGole4FTCZj3wbhjtkYBeB';
const _cicloVidaAgosto1 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB8KowRsLZmvIyMKW8PI6iHFx2Nv_pLKhHrLu42mSYZjl-A-LzetgfCWZQE9HRLzYxZ0rVCsa9hvBHVdXRU_fz7cYP0fqaJWg09TcWGBDeTa43sxclxzxfKQ_IOTgI-CDJPLtHIRNBhL_W7vLTpaOIWMKvHvpthvjmXdz6Fq57mArKHHuUcXgkECW5eIb2FqrWgBSxER8qivj4fFZIG110cKqPjbjhcLrt3Mv1qExpHlygYMcpQ_9gD7p56W2wQnM6YGriTAtu78Hqm';
const _cicloVidaAgosto2 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBdh86UEOxfRNc6mAAF7uRyU0eXUFKEsyw3z4XEN9OdgH_7hdx3e9tNAxSpMty1CZhTty0LMVa4EUoJX7f3wwtGg9HfC6oLcA5Isb4ni6zW0BfkOxwIaT02red2tQ2bjnDV1dy0vhAp1Lz4xDUoRmbbjSRqY87arqN8o9Fbz75yyhaMIdZKCAAHRYv6Pi7VxZ4CtoMLCFf-KrA01sH7Qk7JN5vRhisodeCr1dI2RRUvy1HRAYj47QsoqTwwHyKDu8JsjMjYAgsa_-xi';

// Sabias que image
const _sabiasQueImage =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBx6_vpQfpfLSmGJzzpJZ1khEg3HUxygaC_d36CFXfr33ZijP-Fwc1hyCeR3J56lAwdRs3PyyymoXJvOgYMnrkhju4D5uG4nrFaKaujbm5MFVw-9NG1_VUMbuxKqV8joquSINs3QYsQa9TATtmeNrIIuDn4fHRTfdVotk63CJj-DGbzDxnki_bC6__nLNFYPSDJ_VFqE4V1bVYaHueLPITzLEcMxOTqlYz0AU_ZwpNBZh3yXzNdDcnJhmz1vUruzc_yiyS6s81Kb8uC';

// Preguntas avatars
const _preguntasAvatar1 =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAySKREfMcOmat6q6lwJPcSL0BZ7hsBZbb-LZPyLtOe1sy5pcYr4fiVVYdnimUBeCF1yRVjC_T13tNEb_RtuMAbCPB80yiaoVCC3mKayIIoLPDzlJGktsfK2rjzJu4dJH1jo7VUXLTkakJ9A9HhPMeUcUfFB6QTPEfjjbH9-Zu7bweOCpFuERKbl27cf31AVBqctfLZ2gN7RrmkN9B8Sh5J39BPWzft4re9JzbI7yX0g4sP_B2PNGM6CAToAxvo628veaFIgd4BCIKR';
const _preguntasScientist =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC49GGc6a3Ks03ID5dqRhaEbaWJjRu_D0-rFvgrgdbnsf6q2iEmszj7hGehfykd6Gsqujd0B3nzE_pN4iLuL8DTwotCs4-cdnLhxaGA1AfK9nk3Gu8KK_BJ6HpmjoQnEXUEKDWLDiz6fQPje6XoRmiJCmow4Xv703JuLwq2s8Hv4douWsQztIVNHpvL_Oz5WiGHNlOiEZJ8mzydza7380ZIa4RCk5-_Lk8dfEsJ5vqTPbTzUuz2wr7XfML6wWML54RofMCSWd_uvkQS';

// Diario veterinaria images
const _vetDraElena =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBdhfrlIspCLu7H_6iqXpaatHHVLp9PmIAjTKkMhV2fA9XImGa9zf2jmGo-6OF9iZdO-hIXb0WVjNa6lGTXMaGcsXntoNQM2kAZHiiYavcjmiHrW-Rmo42t8ynSNsVS2sWO2a7yWZbD63WNt4OAYflydc0Nesm24kb0KE0FirWgOiiOv3_OwpUVWaAOUqVAntbA6vJCQuKjJi8QTrWmZp3mkoyJyDSRx-itaTyv3_eZfhouN4Q1zzTN0r_QJQoW9Ml-d5fbtBe1rYFv';
const _vetTankImage =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCLZ8qhO4mReG5kjN7P09Lc42kDhufIRGhsa09y5ykrAz5XlTdfc3u_kH0x0AXK6yJsrzjhERX5M-GmJfXOwLB8fW4NSfa9xVrcNVid91RxxjC2cJAN18RJD_dnFLVxKvNuOjqTlCHrnirdQ5pElPZWd2PbrMtqXjU7HEpE5W3lNnxAUXcFRVYiucCmh0jjRL4yO16rJD16wGOO7iwFyov3Y5GojyJPMzLOnKCh3N9FI5njvuYVl672SvMvS36YcEKxYHloUeMfbof3';
const _vetProfileImage =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuANsFpqtjBB9mAjk2LGFC-Kp6qwalYtCxjM20Kj7SLlLAUlP6JgSwjfnQGwRkOQJdkqUsFcw_aS4xVcCqFR3DeoD4xJ-vSwegmThpZxxWsrGyoB1w0HewV--WM4SibJEFwauAXOsByUmlvyprqbvKdNfAsKjAIT6KIQVa_36pn5v6gqGoWs3k4K8lN3tWNx2Se7pmyt2lq5DROzRkjqiMgBwm2HWqX4cfosTCpCwCDcm2UeeiZ83BFYLwJbO8j8NMV5DMn0oUIf5g5l';

// ── Color constants not in FaumaColors ─────────────────────────────
const _surfaceContainer = Color(0xFFF3EDE7);
const _surfaceContainerHigh = Color(0xFFEEE7E1);
const _onSecondaryContainer = Color(0xFF596577);
const _errorColor = Color(0xFFBA1A1A);

/// Subscriber-level species detail screen.
///
/// Shows the full subscriber experience after payment, with a hero section,
/// sticky section navigation bar (botonera), and four content sections:
/// Ficha Tecnica, Galeria, Curiosidades, and Diario de Salud.
class SpeciesSubscriberScreen extends StatefulWidget {
  const SpeciesSubscriberScreen({super.key, required this.id});

  final String id;

  @override
  State<SpeciesSubscriberScreen> createState() =>
      _SpeciesSubscriberScreenState();
}

class _SpeciesSubscriberScreenState extends State<SpeciesSubscriberScreen> {
  // Main section index: 0=Ficha, 1=Galeria, 2=Curiosidades, 3=DiarioSalud
  int _selectedSection = 0;

  // Gallery filter: 0=Todo, 1=Fotos, 2=Videos, 3=Acompananos, 4=Camara24h
  int _galleryFilter = 0;

  // Curiosidades sub-tab: 0=Ciclo, 1=Sabias, 2=Mitos, 3=Preguntas
  int _curiosidadesTab = 0;

  // Diario de Salud sub-tab: 0=Enciclopedia, 1=Diario Veterinaria
  int _saludTab = 0;

  // Ficha tecnica accordion open states
  final List<bool> _fichaSections =
      [true, false, false, false, false, false, false];

  final ScrollController _scrollController = ScrollController();

  static const _sectionLabels = [
    'Ficha T\u00e9cnica',
    'Galer\u00eda',
    'Curiosidades',
    'Diario de Salud',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // ── Hero Section ──
          SliverToBoxAdapter(child: _buildHero(context)),

          // ── Sticky Botonera ──
          SliverPersistentHeader(
            pinned: true,
            delegate: _BotoneraDelegate(
              selectedIndex: _selectedSection,
              onSelected: (i) => setState(() {
                _selectedSection = i;
                _galleryFilter = 0;
                _curiosidadesTab = 0;
                _saludTab = 0;
              }),
              labels: _sectionLabels,
            ),
          ),

          // ── Content Area ──
          SliverToBoxAdapter(
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // HERO SECTION
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildHero(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: 420,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          FaumaImage(imageUrl: _heroUrl, fit: BoxFit.cover),

          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x33000000),
                  Colors.transparent,
                  Color(0xCC000000),
                ],
                stops: [0.0, 0.35, 1.0],
              ),
            ),
          ),

          // Back + Share buttons
          Positioned(
            top: topPadding + 8,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleButton(
                  icon: Icons.arrow_back,
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/explore');
                    }
                  },
                ),
                _buildCircleButton(icon: Icons.share, onTap: () {}),
              ],
            ),
          ),

          // Hero badges (VULNERABLE + MARINA)
          Positioned(
            top: topPadding + 60,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBadge('VULNERABLE', FaumaColors.coralCta),
                const SizedBox(height: 8),
                _buildBadge('MARINA', FaumaColors.primaryContainer),
              ],
            ),
          ),

          // Subscriber badge
          Positioned(
            bottom: 64,
            right: 24,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: FaumaColors.primaryContainer,
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    'Nivel: Hermano',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Species name overlay at bottom of hero
          Positioned(
            bottom: 16,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Caretta caretta',
                  style: GoogleFonts.newsreader(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tortuga Boba',
                  style: GoogleFonts.newsreader(
                    fontSize: 32,
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
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // CONTENT DISPATCHER
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildContent(BuildContext context) {
    switch (_selectedSection) {
      case 0:
        return _buildFichaTecnica();
      case 1:
        return _buildGaleria();
      case 2:
        return _buildCuriosidades();
      case 3:
        return _buildDiarioSalud();
      default:
        return const SizedBox.shrink();
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 0: FICHA TECNICA (screen 26)
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildFichaTecnica() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
      child: Column(
        children: [
          // 1. Taxonomia
          _buildAccordion(
            index: 0,
            title: '1. Taxonom\u00eda',
            color: FaumaColors.primary,
            child: _buildTaxonomiaContent(),
          ),
          const SizedBox(height: 12),

          // 2. Biometria
          _buildAccordion(
            index: 1,
            title: '2. Biometr\u00eda',
            color: FaumaColors.primary,
            child: _buildBiometriaContent(),
          ),
          const SizedBox(height: 12),

          // 3. Ecologia
          _buildAccordion(
            index: 2,
            title: '3. Ecolog\u00eda',
            color: FaumaColors.primary,
            child: _buildEcologiaContent(),
          ),
          const SizedBox(height: 12),

          // 4. Comportamiento
          _buildAccordion(
            index: 3,
            title: '4. Comportamiento',
            color: FaumaColors.primary,
            child: _buildComportamientoContent(),
          ),
          const SizedBox(height: 12),

          // 5. Alimentacion
          _buildAccordion(
            index: 4,
            title: '5. Alimentaci\u00f3n',
            color: FaumaColors.primary,
            child: _buildAlimentacionContent(),
          ),
          const SizedBox(height: 12),

          // 6. Reproduccion
          _buildAccordion(
            index: 5,
            title: '6. Reproducci\u00f3n',
            color: FaumaColors.primary,
            child: _buildReproduccionContent(),
          ),
          const SizedBox(height: 12),

          // 7. Amenazas
          _buildAccordion(
            index: 6,
            title: '7. Amenazas',
            color: FaumaColors.tertiary,
            bgColor: FaumaColors.tertiary.withValues(alpha: 0.05),
            child: _buildAmenazasContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxonomiaContent() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTaxField('Nombre Com\u00fan', 'Tortuga boba'),
            ),
            Expanded(
              child: _buildTaxField('Familia', 'Cheloniidae'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTaxField('Linaje', '100M years'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ESTATUS IUCN',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.secondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Vulnerable',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.tertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTaxField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: FaumaColors.secondary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: FaumaColors.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildBiometriaContent() {
    return Column(
      children: [
        // Length row with icon
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.straighten, color: FaumaColors.primary, size: 24),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Longitud Caparaz\u00f3n',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.secondary,
                    ),
                  ),
                  Text(
                    '90 - 100 cm',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peso Promedio',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    Text(
                      '100 - 150 kg',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Esperanza de vida',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    Text(
                      '70 - 80 a\u00f1os',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEcologiaContent() {
    return Text(
      '\u201CHabita en pr\u00e1cticamente todos los oc\u00e9anos del mundo. Son consideradas guardianas del mar y aut\u00e9nticas islas flotantes de vida, albergando docenas de especies comensales en su caparaz\u00f3n.\u201D',
      style: GoogleFonts.inter(
        fontSize: 15,
        fontStyle: FontStyle.italic,
        color: _onSecondaryContainer,
        height: 1.6,
      ),
    );
  }

  Widget _buildComportamientoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: FaumaColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.explore,
                  color: FaumaColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAVEGACI\u00d3N GPS',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Utilizan un sofisticado sistema de navegaci\u00f3n basado en el campo magn\u00e9tico terrestre para regresar a su playa de nacimiento (filopatr\u00eda natal).',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: _onSecondaryContainer,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: FaumaColors.primary.withValues(alpha: 0.2),
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Es una especie eminentemente solitaria durante la mayor parte de su ciclo vital.',
              style: GoogleFonts.inter(
                fontSize: 13,
                color: _onSecondaryContainer,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlimentacionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: FaumaColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Dieta principalmente carn\u00edvora.',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: FaumaColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildBulletItem(
            'Presas principales: cangrejos, moluscos y medusas.'),
        const SizedBox(height: 8),
        _buildBulletItem(
            'Consumo diario: 1.5 - 3% de su peso corporal.'),
      ],
    );
  }

  Widget _buildBulletItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: FaumaColors.tertiary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: _onSecondaryContainer,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReproduccionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      '80-120',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.primary,
                      ),
                    ),
                    Text(
                      'HUEVOS POR PUESTA',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      '29\u00b0C',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.primary,
                      ),
                    ),
                    Text(
                      'T\u00aa DETERMINACI\u00d3N SEXO',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 13,
              color: _onSecondaryContainer,
              height: 1.6,
            ),
            children: [
              const TextSpan(
                text:
                    'Alcanzan la madurez sexual tard\u00edamente, entre los ',
              ),
              TextSpan(
                text: '20 y 35 a\u00f1os',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.primary,
                ),
              ),
              const TextSpan(
                text:
                    '. El sexo de las cr\u00edas se determina por la temperatura de la arena durante la incubaci\u00f3n (TSD).',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmenazasContent() {
    return Column(
      children: [
        _buildThreatRow(
          Icons.emergency,
          'Pesca accidental:',
          'El palangre y las redes de arrastre son su mayor peligro en mar abierto.',
        ),
        const SizedBox(height: 16),
        _buildThreatRow(
          Icons.delete_outline,
          'Contaminaci\u00f3n:',
          'Confunden pl\u00e1sticos con medusas, causando bloqueos digestivos fatales.',
        ),
        const SizedBox(height: 16),
        _buildThreatRow(
          Icons.thermostat,
          'Cambio Clim\u00e1tico:',
          'El aumento de temperatura en las playas altera la proporci\u00f3n de sexos, naciendo casi exclusivamente hembras.',
        ),
      ],
    );
  }

  Widget _buildThreatRow(IconData icon, String boldText, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: FaumaColors.tertiary, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.inter(
                fontSize: 13,
                color: _onSecondaryContainer,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: boldText,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: ' $text'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 1: GALERIA (screen 27)
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildGaleria() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(0, 'Todo'),
                const SizedBox(width: 8),
                _buildFilterChip(1, 'Fotos'),
                const SizedBox(width: 8),
                _buildFilterChip(2, 'V\u00eddeos'),
                const SizedBox(width: 8),
                _buildFilterChip(3, 'Acomp\u00e1\u00f1anos'),
                const SizedBox(width: 8),
                _buildFilterChipLive(4, 'C\u00e1mara 24h'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Featured video card
          if (_galleryFilter == 0 || _galleryFilter == 2)
            _buildFeaturedVideo(),

          if (_galleryFilter == 0 || _galleryFilter == 2)
            const SizedBox(height: 32),

          // Photo grid
          if (_galleryFilter == 0 || _galleryFilter == 1) ...[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Momentos ',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      color: FaumaColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'vividos',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildPhotoGrid(),
          ],

          // Acompananos
          if (_galleryFilter == 0 || _galleryFilter == 3) ...[
            const SizedBox(height: 32),
            _buildAcompananos(),
          ],

          // Camara 24h
          if (_galleryFilter == 0 || _galleryFilter == 4) ...[
            const SizedBox(height: 32),
            _buildCamara24h(),
          ],
        ],
      ),
    );
  }

  Widget _buildFeaturedVideo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FaumaImage(imageUrl: _galleryVideoThumb, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xCC000000)],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
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
                    'Documental: Un d\u00eda con la tortuga boba',
                    style: GoogleFonts.newsreader(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.schedule,
                          color: Colors.white70, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '12:34',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
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

  Widget _buildPhotoGrid() {
    final photos = [
      _galleryPhoto1,
      _galleryPhoto2,
      _galleryPhoto3,
      _galleryPhoto4,
      _galleryPhoto5,
      _galleryPhoto6,
    ];

    // Two-column masonry-like layout
    final leftCol = <String>[];
    final rightCol = <String>[];
    for (var i = 0; i < photos.length; i++) {
      if (i.isEven) {
        leftCol.add(photos[i]);
      } else {
        rightCol.add(photos[i]);
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: leftCol
                .map((url) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FaumaImage(imageUrl: url, fit: BoxFit.cover),
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: rightCol
                .map((url) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FaumaImage(imageUrl: url, fit: BoxFit.cover),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAcompananos() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            FaumaColors.primary,
            const Color(0xFF80CBC4),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with play button
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10)),
                    child: FaumaImage(
                        imageUrl: _galleryAcompananos, fit: BoxFit.cover),
                  ),
                  Center(
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: FaumaColors.primary.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow,
                          color: Colors.white, size: 28),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ESPECIAL SUSCRIPTORES',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.tertiary,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Acomp\u00e1\u00f1anos: Un d\u00eda en el centro de recuperaci\u00f3n',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      color: FaumaColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Descubre el trabajo diario de nuestros bi\u00f3logos cuidando de los ejemplares rescatados este mes.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: FaumaColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCamara24h() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: Opacity(
                opacity: 0.4,
                child: FaumaImage(
                    imageUrl: _galleryCamara24h, fit: BoxFit.cover),
              ),
            ),
            // Live badge
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'EN DIRECTO',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Lock overlay
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
            // Lock content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, color: Colors.white, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Tanque de rehabilitaci\u00f3n',
                  style: GoogleFonts.newsreader(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: FaumaColors.tertiaryContainer,
                    borderRadius: BorderRadius.circular(999),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.workspace_premium,
                          color: Colors.white, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        'Disponible en nivel H\u00e9roe',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 2: CURIOSIDADES (screens 28-31)
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildCuriosidades() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSubTab(0, 'Ciclo de Vida', _curiosidadesTab,
                    (i) => setState(() => _curiosidadesTab = i)),
                const SizedBox(width: 8),
                _buildSubTab(1, 'Sab\u00edas qu\u00e9', _curiosidadesTab,
                    (i) => setState(() => _curiosidadesTab = i)),
                const SizedBox(width: 8),
                _buildSubTab(2, 'Mitos', _curiosidadesTab,
                    (i) => setState(() => _curiosidadesTab = i)),
                const SizedBox(width: 8),
                _buildSubTab(3, 'Preguntas', _curiosidadesTab,
                    (i) => setState(() => _curiosidadesTab = i)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: _surfaceContainerHigh),
          const SizedBox(height: 16),

          // Content
          if (_curiosidadesTab == 0) _buildCicloDeVida(),
          if (_curiosidadesTab == 1) _buildSabiasQue(),
          if (_curiosidadesTab == 2) _buildMitosRealidad(),
          if (_curiosidadesTab == 3) _buildPreguntas(),
        ],
      ),
    );
  }

  // ── Ciclo de Vida (screen 28) ──────────────────────────────────────────

  Widget _buildCicloDeVida() {
    return Stack(
      children: [
        // Vertical timeline line
        Positioned(
          left: 16,
          top: 0,
          bottom: 0,
          child: Container(
            width: 1,
            decoration: BoxDecoration(
              color: FaumaColors.primaryContainer.withValues(alpha: 0.4),
            ),
          ),
        ),
        Column(
          children: [
            _buildTimelineEntry(
              month: 'ENE',
              title: 'El Letargo Metab\u00f3lico',
              description:
                  'Su coraz\u00f3n late apenas 6 veces por minuto mientras descansa en el fondo marino para conservar energ\u00eda.',
              isHighlighted: false,
            ),
            const SizedBox(height: 24),
            // FEB placeholder
            _buildTimelinePlaceholder('FEB'),
            const SizedBox(height: 24),
            _buildTimelineEntryHighlighted(
              month: 'MAR',
              title: 'El Encendido Solar',
              description:
                  'Emergen a la superficie para el basking. El sol activa la s\u00edntesis de vitamina D3 y marca el despertar biol\u00f3gico antes de la migraci\u00f3n.',
              imageUrl: _cicloVidaMarzo,
            ),
            const SizedBox(height: 24),
            _buildTimelineEntry(
              month: 'JUN',
              title: 'El Marat\u00f3n de la Playa',
              description:
                  'Las hembras regresan a su playa de nacimiento para depositar entre 80 y 120 huevos bajo la arena c\u00e1lida.',
              badge: 'ANIDACI\u00d3N',
            ),
            const SizedBox(height: 24),
            _buildTimelineEntryWithAvatars(
              month: 'AGO',
              title: 'La Carrera por la Vida',
              description:
                  'Nacimientos masivos. La facilitaci\u00f3n social permite que las cr\u00edas salgan del nido juntas, aumentando su probabilidad de supervivencia.',
            ),
            const SizedBox(height: 24),
            _buildTimelineEntry(
              month: 'DIC',
              title: 'El Arrecife Viviente',
              description:
                  'Su caparaz\u00f3n act\u00faa como una isla m\u00f3vil para epibiontes; crust\u00e1ceos y algas viajan miles de kil\u00f3metros con ella.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineEntry({
    required String month,
    required String title,
    required String description,
    bool isHighlighted = false,
    String? badge,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 32,
          child: Text(
            month,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: FaumaColors.secondary,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _surfaceContainerHigh),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (badge != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color:
                              FaumaColors.tertiary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.tertiary,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: FaumaColors.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelinePlaceholder(String month) {
    return Opacity(
      opacity: 0.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: Text(
              month,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: FaumaColors.secondary,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 1,
                color: _surfaceContainerHigh,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineEntryHighlighted({
    required String month,
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 32,
          child: Column(
            children: [
              Text(
                month,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: FaumaColors.primaryContainer,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: FaumaColors.tertiary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: FaumaColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: FaumaColors.primaryContainer, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x15000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.wb_sunny,
                        color: FaumaColors.tertiary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: FaumaColors.onSurface,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(
                          text:
                              'Emergen a la superficie para el '),
                      TextSpan(
                        text: 'basking',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: FaumaColors.primary,
                        ),
                      ),
                      const TextSpan(
                        text:
                            '. El sol activa la s\u00edntesis de vitamina D3 y marca el despertar biol\u00f3gico antes de la migraci\u00f3n.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FaumaImage(
                        imageUrl: imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineEntryWithAvatars({
    required String month,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 32,
          child: Text(
            month,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: FaumaColors.secondary,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border(
                top: BorderSide(color: _surfaceContainerHigh),
                right: BorderSide(color: _surfaceContainerHigh),
                bottom: BorderSide(color: _surfaceContainerHigh),
                left:
                    BorderSide(color: FaumaColors.tertiary, width: 4),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: FaumaColors.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                // Small avatar stack
                SizedBox(
                  height: 32,
                  child: Stack(
                    children: [
                      _buildSmallAvatar(_cicloVidaAgosto1, 0),
                      _buildSmallAvatar(_cicloVidaAgosto2, 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallAvatar(String url, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: FaumaImage(imageUrl: url, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // ── Sabias Que (screen 29) ─────────────────────────────────────────────

  Widget _buildSabiasQue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enero expanded
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enero',
              style: GoogleFonts.newsreader(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: FaumaColors.primary,
              ),
            ),
            Icon(Icons.expand_less, color: FaumaColors.primary),
          ],
        ),
        const SizedBox(height: 16),

        // Card 1
        _buildSabiasQueCard(
          icon: Icons.public,
          title:
              '\u00bfSab\u00edas que el Mediterr\u00e1neo es un albergue internacional para las tortugas?',
          body:
              'Las \'Locales\' del Este (Grecia, Turqu\u00eda) y las \'Turistas\' Atl\u00e1nticas (Florida, Cabo Verde) conviven aqu\u00ed durante el invierno, compartiendo \u00e1reas de alimentaci\u00f3n.',
        ),
        const SizedBox(height: 16),

        // Card 2
        _buildSabiasQueCard(
          icon: Icons.biotech,
          title:
              '\u00bfSab\u00edas que llevan su pasaporte y diario de viaje grabados en el cuerpo?',
          body:
              'Su ADN mitocondrial funciona como un c\u00f3digo de barras de origen, mientras que los is\u00f3topos estables en su caparaz\u00f3n revelan las rutas migratorias que han seguido.',
        ),

        const SizedBox(height: 24),
        const Divider(color: FaumaColors.outlineVariant),
        const SizedBox(height: 8),

        // Collapsed months
        _buildCollapsedMonth('Febrero'),
        const SizedBox(height: 8),
        _buildCollapsedMonth('Marzo'),
        const SizedBox(height: 8),
        _buildCollapsedMonth('Abril'),

        const SizedBox(height: 32),

        // Decorative image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 192,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FaumaImage(
                    imageUrl: _sabiasQueImage, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        FaumaColors.primary.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'Curiosidades marinas',
                    style: GoogleFonts.newsreader(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
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

  Widget _buildSabiasQueCard({
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: FaumaColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(icon, color: FaumaColors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.onSurface,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: FaumaColors.onSurfaceVariant,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: FaumaColors.coralCta,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.share, color: Colors.white, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    'Compartir',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedMonth(String month) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          month,
          style: GoogleFonts.newsreader(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: FaumaColors.secondary,
          ),
        ),
        Icon(Icons.expand_more, color: FaumaColors.secondary),
      ],
    );
  }

  // ── Mitos y Realidad (screen 30) ────────────────────────────────────────

  Widget _buildMitosRealidad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enero expanded
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enero',
              style: GoogleFonts.newsreader(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: FaumaColors.primary,
              ),
            ),
            Icon(Icons.expand_less, color: FaumaColors.primary),
          ],
        ),
        const SizedBox(height: 16),

        // Myth Card 1
        _buildMythCard(
          title: '\u00bfHibernan durante todo el invierno?',
          myth: '\u201CHibernan en el fango marino.\u201D',
          reality:
              'No hibernan, entran en quiescencia. Migran a aguas m\u00e1s c\u00e1lidas para mantener su metabolismo.',
        ),
        const SizedBox(height: 24),

        // Myth Card 2
        _buildMythCard(
          title:
              '\u00bfPueden esconder la cabeza dentro del caparaz\u00f3n?',
          myth:
              '\u201CSe esconden como las tortugas terrestres.\u201D',
          reality:
              'Sus aletas son r\u00edgidas y no hay espacio interno. Han desarrollado una defensa activa y gran agilidad en el agua.',
        ),

        const SizedBox(height: 32),

        // Collapsed months
        _buildCollapsedMonthCard('Febrero'),
        const SizedBox(height: 12),
        _buildCollapsedMonthCard('Marzo'),
        const SizedBox(height: 12),
        _buildCollapsedMonthCard('Abril'),

        const SizedBox(height: 32),

        // Info banner
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: FaumaColors.coralCta.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(color: FaumaColors.coralCta, width: 4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info, color: FaumaColors.coralCta, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u00bfSab\u00edas que...?',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.tertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'El nombre "Caretta" proviene de la palabra veneciana "carretta", que significa carreta, debido a su caparaz\u00f3n lento pero imparable.',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: FaumaColors.onSurfaceVariant,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMythCard({
    required String title,
    required String myth,
    required String reality,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8E1DC).withValues(alpha: 0.3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.newsreader(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: FaumaColors.onSurface,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          // MITO label
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: _errorColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'MITO',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: _errorColor,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            myth,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: FaumaColors.secondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 1,
            color: const Color(0xFFE8E1DC).withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),
          // REALIDAD label
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: FaumaColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'REALIDAD',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            reality,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: FaumaColors.onSurface,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: FaumaColors.surfaceContainerLow,
                shape: BoxShape.circle,
              ),
              child:
                  Icon(Icons.share, color: FaumaColors.secondary, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedMonthCard(String month) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8E1DC).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            month,
            style: GoogleFonts.newsreader(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: FaumaColors.secondary,
            ),
          ),
          Icon(Icons.expand_more,
              color: FaumaColors.secondary.withValues(alpha: 0.6),
              size: 20),
        ],
      ),
    );
  }

  // ── Preguntas (screen 31) ──────────────────────────────────────────────

  Widget _buildPreguntas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pregunta a los expertos',
          style: GoogleFonts.newsreader(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: FaumaColors.primary,
          ),
        ),
        const SizedBox(height: 24),

        // Question input
        Container(
          height: 64,
          padding: const EdgeInsets.only(left: 24, right: 8),
          decoration: BoxDecoration(
            color: _surfaceContainer,
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Escribe tu pregunta...',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFFBBC7DC),
                  ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: FaumaColors.tertiaryContainer,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Q&A Card 1
        _buildQuestionCard(
          avatarUrl: _preguntasAvatar1,
          question:
              '\u00bfCu\u00e1nto tiempo pueden aguantar sin respirar?',
          timeAgo: 'Hace 2 horas',
          answerWidget: _buildAnswerWithScientist(
            scientistAvatar: _preguntasScientist,
            scientistName: 'Dr. Carlos',
            answer: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: FaumaColors.onSurfaceVariant,
                  height: 1.6,
                ),
                children: [
                  const TextSpan(
                    text:
                        'En reposo invernal pueden aguantar hasta ',
                  ),
                  TextSpan(
                    text: '7 horas sumergidas',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                    ),
                  ),
                  const TextSpan(
                    text:
                        '. Sin embargo, en actividad normal para alimentarse suelen emerger cada 15-30 minutos. Su metabolismo es incre\u00edblemente eficiente.',
                  ),
                ],
              ),
            ),
            likes: 24,
          ),
        ),
        const SizedBox(height: 24),

        // Q&A Card 2
        _buildQuestionCard(
          question: '\u00bfEs verdad que lloran?',
          timeAgo: 'Hace 5 horas',
          answerWidget: _buildSimpleAnswer(
            answer: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: FaumaColors.onSurfaceVariant,
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: 'No es llanto emocional, son '),
                  TextSpan(
                    text: 'gl\u00e1ndulas de sal',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ' que expulsan el exceso de sodio de sus ojos. Esto les permite beber agua de mar sin deshidratarse. Es pura adaptaci\u00f3n fisiol\u00f3gica.',
                  ),
                ],
              ),
            ),
            likes: 42,
          ),
        ),
        const SizedBox(height: 24),

        // Q&A Card 3
        _buildQuestionCard(
          question:
              '\u00bfQu\u00e9 hacer si encuentro una varada?',
          timeAgo: 'Ayer',
          answerWidget: _buildEmergencyAnswer(
            answer:
                'Llamar al 112 inmediatamente. No intentes devolverla al agua por tu cuenta, ya que podr\u00eda tener aire en los pulmones o hipotermia y necesita atenci\u00f3n veterinaria experta.',
            likes: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard({
    String? avatarUrl,
    required String question,
    required String timeAgo,
    required Widget answerWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _surfaceContainerHigh),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FaumaColors.primaryContainer,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: avatarUrl != null
                      ? FaumaImage(
                          imageUrl: avatarUrl, fit: BoxFit.cover)
                      : Container(
                          color: const Color(0xFFD7E3F9),
                          child: Icon(Icons.person,
                              color: FaumaColors.primary, size: 24),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: FaumaColors.onSurface,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      timeAgo,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          answerWidget,
        ],
      ),
    );
  }

  Widget _buildAnswerWithScientist({
    required String scientistAvatar,
    required String scientistName,
    required Widget answer,
    required int likes,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      padding: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: FaumaColors.primaryContainer,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: FaumaColors.tertiary, width: 1),
                ),
                child: ClipOval(
                  child: FaumaImage(
                      imageUrl: scientistAvatar, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                scientistName,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.primary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.verified,
                  color: FaumaColors.primary, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          answer,
          const SizedBox(height: 12),
          _buildAnswerActions(likes),
        ],
      ),
    );
  }

  Widget _buildSimpleAnswer({
    required Widget answer,
    required int likes,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      padding: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: FaumaColors.primaryContainer,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          answer,
          const SizedBox(height: 12),
          _buildAnswerActions(likes),
        ],
      ),
    );
  }

  Widget _buildEmergencyAnswer({
    required String answer,
    required int likes,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      padding: const EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: FaumaColors.primaryContainer,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFDAD6).withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _errorColor.withValues(alpha: 0.2),
              ),
            ),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: FaumaColors.onSurfaceVariant,
                  height: 1.6,
                ),
                children: [
                  TextSpan(
                    text: 'Llamar al 112 inmediatamente',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _errorColor,
                    ),
                  ),
                  TextSpan(
                    text:
                        '. No intentes devolverla al agua por tu cuenta, ya que podr\u00eda tener aire en los pulmones o hipotermia y necesita atenci\u00f3n veterinaria experta.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildAnswerActions(likes),
        ],
      ),
    );
  }

  Widget _buildAnswerActions(int likes) {
    return Row(
      children: [
        Icon(Icons.thumb_up_outlined,
            color: FaumaColors.secondary, size: 18),
        const SizedBox(width: 4),
        Text(
          '$likes',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: FaumaColors.secondary,
          ),
        ),
        const SizedBox(width: 24),
        Icon(Icons.share, color: FaumaColors.secondary, size: 18),
        const SizedBox(width: 4),
        Text(
          'Compartir',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: FaumaColors.secondary,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 3: DIARIO DE SALUD (screens 32-33)
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildDiarioSalud() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-tabs (toggle style)
          _buildSaludToggle(),
          const SizedBox(height: 24),

          if (_saludTab == 0) _buildEnciclopedia(),
          if (_saludTab == 1) _buildDiarioVeterinaria(),
        ],
      ),
    );
  }

  Widget _buildSaludToggle() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _saludTab = 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _saludTab == 0
                      ? FaumaColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: _saludTab == 0
                      ? const [
                          BoxShadow(
                            color: Color(0x15000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Enciclopedia',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: _saludTab == 0
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: _saludTab == 0
                          ? Colors.white
                          : const Color(0xFF78909C),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _saludTab = 1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _saludTab == 1
                      ? FaumaColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: _saludTab == 1
                      ? const [
                          BoxShadow(
                            color: Color(0x15000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Diario Veterinaria',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: _saludTab == 1
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: _saludTab == 1
                          ? Colors.white
                          : const Color(0xFF78909C),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Enciclopedia (screen 32) ───────────────────────────────────────────

  Widget _buildEnciclopedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Procedimientos Cl\u00ednicos',
          style: GoogleFonts.newsreader(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: FaumaColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manual t\u00e9cnico especializado para el diagn\u00f3stico y tratamiento de la tortuga boba. Gu\u00edas protocolizadas de intervenci\u00f3n veterinaria.',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: FaumaColors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),

        // Procedure cards grid
        ..._buildProcedureCards(),
      ],
    );
  }

  List<Widget> _buildProcedureCards() {
    final procedures = [
      ('Anal\u00edtica de sangre', Icons.bloodtype,
          'Valores hematol\u00f3gicos y bioqu\u00edmicos de referencia para la evaluaci\u00f3n del estado sist\u00e9mico y metab\u00f3lico.'),
      ('Radiolog\u00eda', Icons.radio_button_checked,
          'Proyecciones diagn\u00f3sticas para la evaluaci\u00f3n \u00f3sea, pulmonar y detecci\u00f3n de cuerpos extra\u00f1os digestivos.'),
      ('Ecograf\u00eda', Icons.radio_button_checked,
          'Visualizaci\u00f3n de \u00f3rganos internos y evaluaci\u00f3n folicular a trav\u00e9s de las ventanas axilares e inguinales.'),
      ('Fluidoterapia', Icons.medical_services,
          'Protocolos de rehidrataci\u00f3n intravenosa e intracel\u00f3mica para pacientes cr\u00edticos y deshidratados.'),
      ('Desbridamiento', Icons.content_cut,
          'Limpieza y eliminaci\u00f3n quir\u00fargica de tejido necr\u00f3tico en lesiones de caparaz\u00f3n y tejidos blandos.'),
      ('Sondaje', Icons.water_drop,
          'T\u00e9cnicas de cateterismo y sondaje esof\u00e1gico para administraci\u00f3n de f\u00e1rmacos y nutrici\u00f3n forzada.'),
      ('Marcaje PIT tags', Icons.nfc,
          'Identificaci\u00f3n electr\u00f3nica mediante transpondedores integrados para seguimiento de poblaciones.'),
      ('Necropsia', Icons.search,
          'Protocolo sistem\u00e1tico post-mortem para determinar la causa de muerte y estudios epidemiol\u00f3gicos.'),
      ('Embolia gaseosa', Icons.bubble_chart,
          'Manejo de la enfermedad descompresiva en tortugas capturadas accidentalmente por redes de arrastre.'),
      ('Alimentaci\u00f3n asistida', Icons.restaurant,
          'Dietas espec\u00edficas y t\u00e9cnicas de alimentaci\u00f3n forzada para ejemplares convalecientes o anor\u00e9xicos.'),
      ('Amputaciones', Icons.healing,
          'Criterios quir\u00fargicos y postoperatorios para amputaciones de aletas debido a enmallamientos severos.'),
      ('Problemas oculares', Icons.visibility,
          'Diagn\u00f3stico y tratamiento de conjuntivitis, \u00falceras corneales y deficiencias de vitamina A.'),
      ('Hembra anidante', Icons.egg,
          'Cuidados especializados y monitorizaci\u00f3n de hembras durante el proceso de desove y anidaci\u00f3n.'),
      ('Neonatos', Icons.child_care,
          'Manejo de cr\u00edas reci\u00e9n nacidas, criterios de liberaci\u00f3n y cuidados en tanques de crecimiento.'),
      ('Determinaci\u00f3n sexo', Icons.biotech,
          'T\u00e9cnicas de sexado laparosc\u00f3pico y an\u00e1lisis hormonales en ejemplares juveniles e inmaduros.'),
      ('Enfermedades infecciosas', Icons.coronavirus,
          'Protocolos de aislamiento y tratamiento para patolog\u00edas virales como la fibropapilomatosis.'),
    ];

    final widgets = <Widget>[];
    for (var i = 0; i < procedures.length; i += 2) {
      final left = procedures[i];
      final right = i + 1 < procedures.length ? procedures[i + 1] : null;
      widgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildProcedureCard(left.$1, left.$2, left.$3)),
            const SizedBox(width: 12),
            Expanded(
              child: right != null
                  ? _buildProcedureCard(right.$1, right.$2, right.$3)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      );
      widgets.add(const SizedBox(height: 12));
    }
    return widgets;
  }

  Widget _buildProcedureCard(String title, IconData icon, String desc) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A6B72).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: FaumaColors.primary, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.newsreader(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: FaumaColors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: FaumaColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ── Diario Veterinaria (screen 33) ─────────────────────────────────────

  Widget _buildDiarioVeterinaria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary card
        _buildVetSummaryCard(),
        const SizedBox(height: 32),

        // Timeline entries
        _buildVetEntry1(),
        const SizedBox(height: 32),
        _buildVetEntry2(),
        const SizedBox(height: 32),
        _buildVetEntry3Locked(),
      ],
    );
  }

  Widget _buildVetSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _surfaceContainer),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ESTADO',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.secondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Recuperaci\u00f3n',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A3A2A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: FaumaColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.medical_services,
                    color: FaumaColors.primary, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PESO ACTUAL',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: FaumaColors.secondary,
                        ),
                      ),
                      Text(
                        '112 kg',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u00daLTIMO CONTROL',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: FaumaColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hace 2 semanas',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: FaumaColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVetEntry1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: FaumaColors.primary,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child:
                  const Icon(Icons.check, color: Colors.white, size: 14),
            ),
            Container(
              width: 2,
              height: 180,
              color: FaumaColors.outlineVariant.withValues(alpha: 0.5),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FaumaColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _surfaceContainer),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MARZO 2027',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.tertiary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Revisi\u00f3n trimestral',
                          style: GoogleFonts.newsreader(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '112kg',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E7D32),
                            ),
                          ),
                          const Icon(Icons.arrow_upward,
                              color: Color(0xFF2E7D32), size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: FaumaImage(
                            imageUrl: _vetDraElena, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Dra. Elena',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Herida aleta posterior cicatrizando correctamente. Anal\u00edtica normal. Se observa buen apetito.',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xFF616161),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 128,
                    width: double.infinity,
                    child: FaumaImage(
                        imageUrl: _vetTankImage, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVetEntry2() {
    return Opacity(
      opacity: 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: FaumaColors.outlineVariant,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.history,
                    color: Colors.white, size: 14),
              ),
              Container(
                width: 2,
                height: 60,
                color: FaumaColors.outlineVariant.withValues(alpha: 0.5),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: FaumaColors.surfaceContainerLowest
                    .withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _surfaceContainer),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DICIEMBRE 2026',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: FaumaColors.secondary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Control post-temporada',
                            style: GoogleFonts.newsreader(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF757575),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '108kg',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF757575),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Recuperaci\u00f3n tras temporada reproductiva. Suplemento vitam\u00ednico administrado. Sin anomal\u00edas detectadas.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFF757575),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVetEntry3Locked() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot locked
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.lock,
              color: Color(0xFF9E9E9E), size: 14),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: FaumaColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFBDBDBD),
                style: BorderStyle.solid,
              ),
            ),
            child: Stack(
              children: [
                // Blurred content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Opacity(
                    opacity: 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OCTUBRE 2026',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.secondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ingreso inicial por pesca',
                          style: GoogleFonts.newsreader(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Evaluaci\u00f3n de traumatismo por red de arrastre...',
                          style: GoogleFonts.inter(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                // Lock overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          _surfaceContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: FaumaColors.tertiaryContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.white, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                'Disponible en nivel H\u00e9roe',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                            color: FaumaColors.primary,
                            borderRadius: BorderRadius.circular(999),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            'Actualizar a H\u00e9roe',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
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
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SHARED WIDGETS
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: FaumaColors.primaryContainer, size: 20),
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildAccordion({
    required int index,
    required String title,
    required Color color,
    Color? bgColor,
    required Widget child,
  }) {
    final isOpen = _fichaSections[index];
    return GestureDetector(
      onTap: () => setState(() => _fichaSections[index] = !isOpen),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? FaumaColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_more, color: color),
                  ),
                ],
              ),
            ),
            if (isOpen)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: child,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(int index, String label) {
    final selected = _galleryFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _galleryFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? FaumaColors.tertiaryContainer
              : _surfaceContainer,
          borderRadius: BorderRadius.circular(999),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : FaumaColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChipLive(int index, String label) {
    final selected = _galleryFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _galleryFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? FaumaColors.tertiaryContainer
              : _surfaceContainer,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color:
                    selected ? Colors.white : FaumaColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTab(
      int index, String label, int current, ValueChanged<int> onTap) {
    final selected = current == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? FaumaColors.primaryContainer
              : Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: selected
              ? null
              : Border.all(color: FaumaColors.outlineVariant),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? Colors.white : FaumaColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// STICKY BOTONERA DELEGATE
// =============================================================================

class _BotoneraDelegate extends SliverPersistentHeaderDelegate {
  _BotoneraDelegate({
    required this.selectedIndex,
    required this.onSelected,
    required this.labels,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<String> labels;

  @override
  double get minExtent => 56;
  @override
  double get maxExtent => 56;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Container(
      decoration: BoxDecoration(
        color: FaumaColors.surface,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFE0E0E0).withValues(alpha: 0.5),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(labels.length, (i) {
            final selected = i == selectedIndex;
            return Padding(
              padding: EdgeInsets.only(right: i < labels.length - 1 ? 12 : 0),
              child: GestureDetector(
                onTap: () => onSelected(i),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected
                        ? FaumaColors.primaryContainer
                        : _surfaceContainer,
                    borderRadius: BorderRadius.circular(999),
                    boxShadow: selected
                        ? const [
                            BoxShadow(
                              color: Color(0x20000000),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    labels[i],
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: selected ? Colors.white : FaumaColors.secondary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ),
    );
  }

  @override
  bool shouldRebuild(covariant _BotoneraDelegate oldDelegate) =>
      selectedIndex != oldDelegate.selectedIndex;
}
