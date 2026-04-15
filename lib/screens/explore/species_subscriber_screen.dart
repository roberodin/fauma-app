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
  final List<bool> _fichaSections = [true, false, false, false, false, false, false];

  final ScrollController _scrollController = ScrollController();

  static const _sectionLabels = [
    'Ficha Tecnica',
    'Galeria',
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
              onSelected: (i) => setState(() => _selectedSection = i),
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
                  Color(0x1A000000),
                  Colors.transparent,
                  Color(0xFFFFF8F2),
                ],
                stops: [0.0, 0.4, 1.0],
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
            bottom: 80,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

          // Title overlay card
          Positioned(
            bottom: 0,
            left: 24,
            right: 24,
            child: Transform.translate(
              offset: const Offset(0, 28),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ficha Tecnica \u2014 Caretta caretta',
                      style: GoogleFonts.newsreader(
                        fontSize: 28,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: FaumaColors.primary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explora la vida de la tortuga boba, una de las navegantes mas antiguas de nuestros oceanos.',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF596577),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
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
  // SECTION 0: FICHA TECNICA
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildFichaTecnica() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
      child: Column(
        children: [
          // 1. Taxonomia
          _buildAccordion(
            index: 0,
            title: '1. Taxonomia',
            color: FaumaColors.primary,
            child: _buildTaxonomia(),
          ),
          const SizedBox(height: 12),

          // 2. Biometria
          _buildAccordion(
            index: 1,
            title: '2. Biometria',
            color: FaumaColors.primary,
            child: _buildBiometria(),
          ),
          const SizedBox(height: 12),

          // 3. Ecologia
          _buildAccordion(
            index: 2,
            title: '3. Ecologia',
            color: FaumaColors.primary,
            child: _buildEcologia(),
          ),
          const SizedBox(height: 12),

          // 4. Comportamiento
          _buildAccordion(
            index: 3,
            title: '4. Comportamiento',
            color: FaumaColors.primary,
            child: _buildComportamiento(),
          ),
          const SizedBox(height: 12),

          // 5. Alimentacion
          _buildAccordion(
            index: 4,
            title: '5. Alimentacion',
            color: FaumaColors.primary,
            child: _buildAlimentacion(),
          ),
          const SizedBox(height: 12),

          // 6. Reproduccion
          _buildAccordion(
            index: 5,
            title: '6. Reproduccion',
            color: FaumaColors.primary,
            child: _buildReproduccion(),
          ),
          const SizedBox(height: 12),

          // 7. Amenazas
          _buildAccordion(
            index: 6,
            title: '7. Amenazas',
            color: FaumaColors.tertiary,
            bgColor: FaumaColors.tertiary.withValues(alpha: 0.05),
            child: _buildAmenazas(),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxonomia() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildDataField('Nombre Comun', 'Tortuga boba')),
            Expanded(child: _buildDataField('Familia', 'Cheloniidae')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildDataField('Linaje', '100M years')),
            Expanded(
              child: _buildDataField(
                'Estatus IUCN',
                'Vulnerable',
                valueColor: FaumaColors.tertiary,
                isItalic: true,
                isBold: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBiometria() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.straighten, color: FaumaColors.primary),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Longitud Caparazon',
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
                        fontSize: 16,
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
                      '70 - 80 anos',
                      style: GoogleFonts.inter(
                        fontSize: 16,
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

  Widget _buildEcologia() {
    return Text(
      '"Habita en practicamente todos los oceanos del mundo. Son consideradas guardianas del mar y autenticas islas flotantes de vida, albergando docenas de especies comensales en su caparazon."',
      style: GoogleFonts.inter(
        fontSize: 16,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF596577),
        height: 1.6,
      ),
    );
  }

  Widget _buildComportamiento() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: FaumaColors.primary.withValues(alpha: 0.1),
              ),
              child: const Icon(Icons.explore, color: FaumaColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAVEGACION GPS',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Utilizan un sofisticado sistema de navegacion basado en el campo magnetico terrestre para regresar a su playa de nacimiento (filopatria natal).',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF596577),
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
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Color(0x33005258),
                width: 2,
              ),
            ),
          ),
          child: Text(
            'Es una especie eminentemente solitaria durante la mayor parte de su ciclo vital.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF596577),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlimentacion() {
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
            'Dieta principalmente carnivora.',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: FaumaColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildBullet('Presas principales: cangrejos, moluscos y medusas.'),
        const SizedBox(height: 8),
        _buildBullet(
          'Consumo diario: 1.5 - 3% de su peso corporal.',
        ),
      ],
    );
  }

  Widget _buildReproduccion() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3EDE7),
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
                        letterSpacing: 0.5,
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
                  color: const Color(0xFFF3EDE7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      '29\u00B0C',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.primary,
                      ),
                    ),
                    Text(
                      'T\u00AA DETERMINACION SEXO',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.secondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF596577),
              height: 1.6,
            ),
            children: [
              const TextSpan(
                text:
                    'Alcanzan la madurez sexual tardiamente, entre los ',
              ),
              TextSpan(
                text: '20 y 35 anos',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.primary,
                ),
              ),
              const TextSpan(
                text:
                    '. El sexo de las crias se determina por la temperatura de la arena durante la incubacion (TSD).',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmenazas() {
    return Column(
      children: [
        _buildThreatRow(
          Icons.home_work,
          'Pesca accidental:',
          'El palangre y las redes de arrastre son su mayor peligro en mar abierto.',
        ),
        const SizedBox(height: 16),
        _buildThreatRow(
          Icons.delete_outline,
          'Contaminacion:',
          'Confunden plasticos con medusas, causando bloqueos digestivos fatales.',
        ),
        const SizedBox(height: 16),
        _buildThreatRow(
          Icons.thermostat,
          'Cambio Climatico:',
          'El aumento de temperatura en las playas altera la proporcion de sexos, naciendo casi exclusivamente hembras.',
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 1: GALERIA
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
                _buildFilterChip(2, 'Videos'),
                const SizedBox(width: 8),
                _buildFilterChip(3, 'Acompananos'),
                const SizedBox(width: 8),
                _buildFilterChipLive(4, 'Camara 24h'),
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
                    'Documental: Un dia con la tortuga boba',
                    style: GoogleFonts.newsreader(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.schedule, color: Colors.white70, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '12:34',
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: photos.length,
      itemBuilder: (context, i) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FaumaImage(imageUrl: photos[i], fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildAcompananos() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [FaumaColors.primary, Color(0xFF8BD2DA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: FaumaImage(
                      imageUrl: _galleryAcompananos,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: FaumaColors.primary.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ESPECIAL SUSCRIPTORES',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.tertiary,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Acompananos: Un dia en el centro de recuperacion',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      color: FaumaColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Descubre el trabajo diario de nuestros biologos cuidando de los ejemplares rescatados este mes.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF3F484A),
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
                  imageUrl: _galleryCamara24h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Live badge
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
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
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Lock overlay
            Container(color: Colors.black.withValues(alpha: 0.5)),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock, color: Colors.white, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Tanque de rehabilitacion',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: FaumaColors.tertiary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.workspace_premium,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Disponible en nivel Heroe',
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
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 2: CURIOSIDADES
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildCuriosidades() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-tabs
          _buildSubTabs(
            labels: ['Ciclo de Vida', 'Sabias que', 'Mitos', 'Preguntas'],
            selectedIndex: _curiosidadesTab,
            onSelected: (i) => setState(() => _curiosidadesTab = i),
          ),
          const SizedBox(height: 24),

          // Sub-content
          if (_curiosidadesTab == 0) _buildCicloDeVida(),
          if (_curiosidadesTab == 1) _buildSabiasQue(),
          if (_curiosidadesTab == 2) _buildMitos(),
          if (_curiosidadesTab == 3) _buildPreguntas(),
        ],
      ),
    );
  }

  // ── Ciclo de Vida ──
  Widget _buildCicloDeVida() {
    return Column(
      children: [
        _buildTimelineEntry(
          month: 'ENE',
          title: 'El Letargo Metabolico',
          body:
              'Su corazon late apenas 6 veces por minuto mientras descansa en el fondo marino para conservar energia.',
          isHighlighted: false,
        ),
        _buildTimelineSpacer('FEB'),
        _buildTimelineEntry(
          month: 'MAR',
          title: 'El Encendido Solar',
          body:
              'Emergen a la superficie para el basking. El sol activa la sintesis de vitamina D3 y marca el despertar biologico antes de la migracion.',
          isHighlighted: true,
          imageUrl: _cicloVidaMarzo,
        ),
        _buildTimelineEntry(
          month: 'JUN',
          title: 'El Maraton de la Playa',
          body:
              'Las hembras regresan a su playa de nacimiento para depositar entre 80 y 120 huevos bajo la arena calida.',
          isHighlighted: false,
          badge: 'ANIDACION',
        ),
        _buildTimelineEntry(
          month: 'AGO',
          title: 'La Carrera por la Vida',
          body:
              'Nacimientos masivos. La facilitacion social permite que las crias salgan del nido juntas, aumentando su probabilidad de supervivencia.',
          isHighlighted: false,
          hasAvatars: true,
        ),
        _buildTimelineEntry(
          month: 'DIC',
          title: 'El Arrecife Viviente',
          body:
              'Su caparazon actua como una isla movil para epibiontes; crustaceos y algas viajan miles de kilometros con ella.',
          isHighlighted: false,
          isLast: true,
        ),
      ],
    );
  }

  // ── Sabias que ──
  Widget _buildSabiasQue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enero section
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
            const Icon(Icons.expand_less, color: FaumaColors.primary),
          ],
        ),
        const SizedBox(height: 16),

        // Card 1
        _buildSabiasQueCard(
          icon: Icons.public,
          title:
              'Sabias que el Mediterraneo es un albergue internacional para las tortugas?',
          body:
              'Las \'Locales\' del Este (Grecia, Turquia) y las \'Turistas\' Atlanticas (Florida, Cabo Verde) conviven aqui durante el invierno, compartiendo areas de alimentacion.',
        ),
        const SizedBox(height: 16),

        // Card 2
        _buildSabiasQueCard(
          icon: Icons.science,
          title:
              'Sabias que llevan su pasaporte y diario de viaje grabados en el cuerpo?',
          body:
              'Su ADN mitocondrial funciona como un codigo de barras de origen, mientras que los isotopos estables en su caparazon revelan las rutas migratorias que han seguido.',
        ),
        const SizedBox(height: 24),

        const Divider(color: Color(0x33BEC8C9)),
        const SizedBox(height: 8),

        // Collapsed months
        _buildCollapsedMonth('Febrero'),
        _buildCollapsedMonth('Marzo'),
        _buildCollapsedMonth('Abril'),

        // Decorative image
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 192,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FaumaImage(imageUrl: _sabiasQueImage, fit: BoxFit.cover),
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

  // ── Mitos y Realidad ──
  Widget _buildMitos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enero section
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
            const Icon(Icons.expand_less, color: FaumaColors.primary),
          ],
        ),
        const SizedBox(height: 16),

        // Myth 1
        _buildMythCard(
          title: 'Hibernan durante todo el invierno?',
          myth: '"Hibernan en el fango marino."',
          reality:
              'No hibernan, entran en quiescencia. Migran a aguas mas calidas para mantener su metabolismo.',
        ),
        const SizedBox(height: 24),

        // Myth 2
        _buildMythCard(
          title: 'Pueden esconder la cabeza dentro del caparazon?',
          myth: '"Se esconden como las tortugas terrestres."',
          reality:
              'Sus aletas son rigidas y no hay espacio interno. Han desarrollado una defensa activa y gran agilidad en el agua.',
        ),
        const SizedBox(height: 24),

        // Collapsed months
        _buildCollapsedMonthCard('Febrero'),
        const SizedBox(height: 12),
        _buildCollapsedMonthCard('Marzo'),
        const SizedBox(height: 12),
        _buildCollapsedMonthCard('Abril'),

        // Info card
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: FaumaColors.coralCta.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: const Border(
              left: BorderSide(color: FaumaColors.coralCta, width: 4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info, color: FaumaColors.coralCta),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sabias que...?',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.tertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'El nombre "Caretta" proviene de la palabra veneciana "carretta", que significa carreta, debido a su caparazon lento pero imparable.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF3F484A),
                        height: 1.5,
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

  // ── Preguntas ──
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
          decoration: BoxDecoration(
            color: const Color(0xFFF3EDE7),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Escribe tu pregunta...',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFFBBC7DC),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: FaumaColors.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Q&A Cards
        _buildQuestionCard(
          avatarUrl: _preguntasAvatar1,
          question: 'Cuanto tiempo pueden aguantar sin respirar?',
          time: 'Hace 2 horas',
          scientistName: 'Dr. Carlos',
          scientistAvatar: _preguntasScientist,
          isVerified: true,
          answer:
              'En reposo invernal pueden aguantar hasta 7 horas sumergidas. Sin embargo, en actividad normal para alimentarse suelen emerger cada 15-30 minutos. Su metabolismo es increiblemente eficiente.',
          likes: 24,
        ),
        const SizedBox(height: 24),

        _buildQuestionCard(
          question: 'Es verdad que lloran?',
          time: 'Hace 5 horas',
          answer:
              'No es llanto emocional, son glandulas de sal que expulsan el exceso de sodio de sus ojos. Esto les permite beber agua de mar sin deshidratarse. Es pura adaptacion fisiologica.',
          likes: 42,
        ),
        const SizedBox(height: 24),

        _buildQuestionCard(
          question: 'Que hacer si encuentro una varada?',
          time: 'Ayer',
          answer:
              'Llamar al 112 inmediatamente. No intentes devolverla al agua por tu cuenta, ya que podria tener aire en los pulmones o hipotermia y necesita atencion veterinaria experta.',
          likes: 15,
          isEmergency: true,
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SECTION 3: DIARIO DE SALUD
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildDiarioSalud() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-tabs
          _buildSubTabs(
            labels: ['Enciclopedia', 'Diario Veterinaria'],
            selectedIndex: _saludTab,
            onSelected: (i) => setState(() => _saludTab = i),
          ),
          const SizedBox(height: 24),

          if (_saludTab == 0) _buildEnciclopedia(),
          if (_saludTab == 1) _buildDiarioVeterinaria(),
        ],
      ),
    );
  }

  // ── Enciclopedia ──
  Widget _buildEnciclopedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Procedimientos Clinicos',
          style: GoogleFonts.newsreader(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: FaumaColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manual tecnico especializado para el diagnostico y tratamiento de la tortuga boba. Guias protocolizadas de intervencion veterinaria.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFF3F484A),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        ..._buildEnciclopediaCards(),
      ],
    );
  }

  List<Widget> _buildEnciclopediaCards() {
    final procedures = [
      ('Analitica de sangre', Icons.bloodtype,
          'Valores hematologicos y bioquimicos de referencia para la evaluacion del estado sistemico y metabolico.'),
      ('Radiologia', Icons.radio_button_checked,
          'Proyecciones diagnosticas para la evaluacion osea, pulmonar y deteccion de cuerpos extranos digestivos.'),
      ('Ecografia', Icons.radio_button_checked,
          'Visualizacion de organos internos y evaluacion folicular a traves de las ventanas axilares e inguinales.'),
      ('Fluidoterapia', Icons.medical_services,
          'Protocolos de rehidratacion intravenosa e intracelomica para pacientes criticos y deshidratados.'),
      ('Desbridamiento', Icons.content_cut,
          'Limpieza y eliminacion quirurgica de tejido necrotico en lesiones de caparazon y tejidos blandos.'),
      ('Sondaje', Icons.water_drop,
          'Tecnicas de cateterismo y sondaje esofagico para administracion de farmacos y nutricion forzada.'),
      ('Marcaje PIT tags', Icons.nfc,
          'Identificacion electronica mediante transpondedores integrados para seguimiento de poblaciones.'),
      ('Necropsia', Icons.search,
          'Protocolo sistematico post-mortem para determinar la causa de muerte y estudios epidemiologicos.'),
      ('Embolia gaseosa', Icons.bubble_chart,
          'Manejo de la enfermedad descompresiva en tortugas capturadas accidentalmente por redes de arrastre.'),
      ('Alimentacion asistida', Icons.restaurant,
          'Dietas especificas y tecnicas de alimentacion forzada para ejemplares convalecientes o anorexicos.'),
      ('Amputaciones', Icons.healing,
          'Criterios quirurgicos y postoperatorios para amputaciones de aletas debido a enmallamientos severos.'),
      ('Problemas oculares', Icons.visibility,
          'Diagnostico y tratamiento de conjuntivitis, ulceras corneales y deficiencias de vitamina A.'),
      ('Hembra anidante', Icons.egg,
          'Cuidados especializados y monitorizacion de hembras durante el proceso de desove y anidacion.'),
      ('Neonatos', Icons.child_care,
          'Manejo de crias recien nacidas, criterios de liberacion y cuidados en tanques de crecimiento.'),
      ('Determinacion sexo', Icons.science,
          'Tecnicas de sexado laparoscopico y analisis hormonales en ejemplares juveniles e inmaduros.'),
      ('Enfermedades infecciosas', Icons.coronavirus,
          'Protocolos de aislamiento y tratamiento para patologias virales como la fibropapilomatosis.'),
    ];

    final widgets = <Widget>[];
    for (var i = 0; i < procedures.length; i++) {
      final (title, icon, desc) = procedures[i];
      widgets.add(
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0x0D005258),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(icon, color: FaumaColors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
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
                    Text(
                      desc,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF3F484A),
                        height: 1.5,
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
    return widgets;
  }

  // ── Diario Veterinaria ──
  Widget _buildDiarioVeterinaria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: FaumaColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF3EDE7)),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.secondary,
                          letterSpacing: 1,
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
                            'Recuperacion',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0D3B3B),
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
                    child: const Icon(
                      Icons.medical_services,
                      color: FaumaColors.primary,
                    ),
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
                        borderRadius: BorderRadius.circular(12),
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ULTIMO CONTROL',
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
        ),
        const SizedBox(height: 32),

        // Timeline entries
        _buildVetEntry(
          date: 'MARZO 2027',
          title: 'Revision trimestral',
          weight: '112kg',
          weightUp: true,
          doctor: 'Dra. Elena',
          doctorAvatar: _vetDraElena,
          body:
              'Herida aleta posterior cicatrizando correctamente. Analitica normal. Se observa buen apetito.',
          imageUrl: _vetTankImage,
          isCompleted: true,
        ),
        const SizedBox(height: 24),

        _buildVetEntry(
          date: 'DICIEMBRE 2026',
          title: 'Control post-temporada',
          weight: '108kg',
          weightUp: false,
          body:
              'Recuperacion tras temporada reproductiva. Suplemento vitaminico administrado. Sin anomalias detectadas.',
          isCompleted: false,
          isFaded: true,
        ),
        const SizedBox(height: 24),

        // Locked entry
        _buildLockedVetEntry(),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // REUSABLE WIDGET BUILDERS
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withValues(alpha: 0.15),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
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
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildAccordion({
    required int index,
    required String title,
    required Color color,
    required Widget child,
    Color? bgColor,
  }) {
    final isOpen = _fichaSections[index];
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() => _fichaSections[index] = !isOpen);
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
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
          ),
          if (isOpen)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: child,
            ),
        ],
      ),
    );
  }

  Widget _buildDataField(
    String label,
    String value, {
    Color? valueColor,
    bool isItalic = false,
    bool isBold = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: FaumaColors.secondary,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            color: valueColor ?? FaumaColors.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 6, right: 12),
          decoration: const BoxDecoration(
            color: FaumaColors.tertiary,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF596577),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThreatRow(IconData icon, String title, String body) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: FaumaColors.tertiary, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF596577),
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const TextSpan(text: ' '),
                TextSpan(text: body),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(int index, String label) {
    final isActive = _galleryFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _galleryFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? FaumaColors.tertiary : const Color(0xFFF3EDE7),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : const Color(0xFF3F484A),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChipLive(int index, String label) {
    final isActive = _galleryFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _galleryFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? FaumaColors.tertiary : const Color(0xFFF3EDE7),
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
                color: isActive ? Colors.white : const Color(0xFF3F484A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTabs({
    required List<String> labels,
    required int selectedIndex,
    required ValueChanged<int> onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x33BEC8C9)),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(labels.length, (i) {
            final isActive = selectedIndex == i;
            return Padding(
              padding: EdgeInsets.only(right: i < labels.length - 1 ? 8 : 0),
              child: GestureDetector(
                onTap: () => onSelected(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? FaumaColors.primaryContainer
                        : Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: isActive
                        ? null
                        : Border.all(color: FaumaColors.outlineVariant),
                  ),
                  child: Text(
                    labels[i],
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight:
                          isActive ? FontWeight.w700 : FontWeight.w600,
                      color: isActive
                          ? Colors.white
                          : const Color(0xFF3F484A),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // ── Timeline Builders ──

  Widget _buildTimelineEntry({
    required String month,
    required String title,
    required String body,
    required bool isHighlighted,
    String? imageUrl,
    String? badge,
    bool hasAvatars = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month label
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Text(
                  month,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: isHighlighted
                        ? FontWeight.w900
                        : FontWeight.w700,
                    color: isHighlighted
                        ? FaumaColors.primaryContainer
                        : FaumaColors.secondary,
                    letterSpacing: 1,
                  ),
                ),
                if (isHighlighted)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      color: FaumaColors.tertiary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Content card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isHighlighted
                    ? FaumaColors.surface
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isHighlighted
                      ? FaumaColors.primaryContainer
                      : const Color(0xFFEEE7E1),
                  width: isHighlighted ? 2 : 1,
                ),
                boxShadow: isHighlighted
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 4,
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
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: FaumaColors.tertiary.withValues(alpha: 0.1),
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
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.primary,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    body,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF3F484A),
                      height: 1.5,
                    ),
                  ),
                  if (imageUrl != null) ...[
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FaumaImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  if (hasAvatars) ...[
                    const SizedBox(height: 12),
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
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildTimelineSpacer(String month) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Opacity(
        opacity: 0.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              child: Text(
                month,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.secondary,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                height: 1,
                color: const Color(0xFFEEE7E1),
              ),
            ),
          ],
        ),
      ),
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
        color: const Color(0xFFF3EDE7),
        borderRadius: BorderRadius.circular(12),
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
                child: Icon(icon, color: FaumaColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.newsreader(
                    fontSize: 20,
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
              fontSize: 14,
              color: const Color(0xFF3F484A),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                      fontSize: 14,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
          const Icon(Icons.expand_more, color: FaumaColors.secondary),
        ],
      ),
    );
  }

  Widget _buildCollapsedMonthCard(String month) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EDE7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0x33E8E1DC),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            month,
            style: GoogleFonts.newsreader(
              fontWeight: FontWeight.w700,
              color: FaumaColors.secondary,
            ),
          ),
          Icon(
            Icons.expand_more,
            color: FaumaColors.secondary.withValues(alpha: 0.6),
          ),
        ],
      ),
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
          color: const Color(0x4DE8E1DC),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.newsreader(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: FaumaColors.onSurface,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          // MITO
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0x1ABA1A1A),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'MITO',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFBA1A1A),
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            myth,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: FaumaColors.secondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0x66E8E1DC)),
          const SizedBox(height: 16),
          // REALIDAD
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            reality,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: FaumaColors.onSurface,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: FaumaColors.surfaceContainerLow,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.share,
                color: FaumaColors.secondary,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard({
    String? avatarUrl,
    required String question,
    required String time,
    String? scientistName,
    String? scientistAvatar,
    bool isVerified = false,
    required String answer,
    required int likes,
    bool isEmergency = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEEE7E1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question header
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
                      ? FaumaImage(imageUrl: avatarUrl, fit: BoxFit.cover)
                      : Container(
                          color: const Color(0xFFD7E3F9),
                          child: const Icon(
                            Icons.person,
                            color: FaumaColors.primary,
                          ),
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
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: FaumaColors.onSurface,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
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

          // Answer
          Container(
            margin: const EdgeInsets.only(left: 24),
            padding: const EdgeInsets.only(left: 24),
            decoration: const BoxDecoration(
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
                if (scientistName != null) ...[
                  Row(
                    children: [
                      if (scientistAvatar != null)
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FaumaColors.tertiary,
                            ),
                          ),
                          child: ClipOval(
                            child: FaumaImage(
                              imageUrl: scientistAvatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Text(
                        scientistName,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.primary,
                        ),
                      ),
                      if (isVerified) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: FaumaColors.primary,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                if (isEmergency)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x4DFFDAD6),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0x33BA1A1A),
                      ),
                    ),
                    child: Text(
                      answer,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: const Color(0xFF3F484A),
                        height: 1.5,
                      ),
                    ),
                  )
                else
                  Text(
                    answer,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color(0xFF3F484A),
                      height: 1.5,
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 18,
                      color: FaumaColors.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$likes',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Icon(
                      Icons.share,
                      size: 18,
                      color: FaumaColors.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Compartir',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
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

  Widget _buildVetEntry({
    required String date,
    required String title,
    required String weight,
    required bool weightUp,
    String? doctor,
    String? doctorAvatar,
    required String body,
    String? imageUrl,
    required bool isCompleted,
    bool isFaded = false,
  }) {
    return Opacity(
      opacity: isFaded ? 0.8 : 1.0,
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
                  color: isCompleted
                      ? FaumaColors.primary
                      : FaumaColors.outlineVariant,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.history,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Entry card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isFaded
                    ? FaumaColors.surfaceContainerLowest.withValues(alpha: 0.6)
                    : FaumaColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF3EDE7)),
                boxShadow: isFaded
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 4,
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
                            date,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: FaumaColors.tertiary,
                            ),
                          ),
                          Text(
                            title,
                            style: GoogleFonts.newsreader(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: FaumaColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: weightUp
                              ? const Color(0xFFF0FFF4)
                              : const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              weight,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: weightUp
                                    ? const Color(0xFF15803D)
                                    : const Color(0xFF737373),
                              ),
                            ),
                            if (weightUp)
                              const Icon(
                                Icons.arrow_upward,
                                size: 14,
                                color: Color(0xFF15803D),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (doctorAvatar != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: FaumaImage(
                              imageUrl: doctorAvatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          doctor ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF57534E),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 12),
                  Text(
                    body,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontStyle: isFaded ? FontStyle.italic : FontStyle.normal,
                      color: isFaded
                          ? const Color(0xFF57534E)
                          : const Color(0xFF44403C),
                      height: 1.5,
                    ),
                  ),
                  if (imageUrl != null) ...[
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 128,
                        width: double.infinity,
                        child: FaumaImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedVetEntry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFFE8E1DC),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.lock, size: 14, color: Color(0xFF737373)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FaumaColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFD4D4D4),
                style: BorderStyle.solid,
              ),
            ),
            child: Stack(
              children: [
                // Blurred content
                Opacity(
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
                      Text(
                        'Ingreso inicial por pesca',
                        style: GoogleFonts.newsreader(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Evaluacion de traumatismo por red de arrastre...',
                        style: GoogleFonts.inter(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // Overlay
                Positioned.fill(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: FaumaColors.tertiary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Disponible en nivel Heroe',
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
                            horizontal: 24,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: FaumaColors.primary,
                            borderRadius: BorderRadius.circular(999),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            'Actualizar a Heroe',
                            style: GoogleFonts.inter(
                              fontSize: 14,
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
}

// ═══════════════════════════════════════════════════════════════════════════════
// BOTONERA PERSISTENT HEADER DELEGATE
// ═══════════════════════════════════════════════════════════════════════════════

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
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: FaumaColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: List.generate(labels.length, (i) {
            final isActive = selectedIndex == i;
            return Padding(
              padding: EdgeInsets.only(right: i < labels.length - 1 ? 12 : 0),
              child: GestureDetector(
                onTap: () => onSelected(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? FaumaColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                    border: isActive
                        ? null
                        : Border.all(color: FaumaColors.primary),
                  ),
                  child: Text(
                    labels[i],
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          isActive ? Colors.white : FaumaColors.primary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _BotoneraDelegate oldDelegate) {
    return selectedIndex != oldDelegate.selectedIndex;
  }
}
