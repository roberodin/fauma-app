import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

// ── Section enum ────────────────────────────────────────────────────────────
enum _Section {
  timeline('Timeline'),
  fichaTecnica('Ficha T\u00E9cnica'),
  galeria('Galer\u00EDa'),
  profundizando('Profundizando'),
  equipo('Equipo'),
  resultados('Resultados'),
  curiosidades('Curiosidades');

  const _Section(this.label);
  final String label;
}

// ── Image URLs from Stitch HTML ─────────────────────────────────────────────
// Timeline
const _timelineRecoleccionUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDgbdU9Zhi5o4wuDJw4V8Lw8AdHgrG6qTuFuj_9wbYVbj_BAxQOhNRtQSRxX2_FdxnjskGH7TJN1OOEpsHNEUmBZB7PvPI6-FGrxBVEs_F5Xyi3vv9smHcezB_kSCN5pgINceqB3djEBvsCCbliqEcxLXJqSmKEOGzh-zIPd5lpFXM7tVIRWDaquDnVmgQnIijbKCB3POg8L_RLDVzcFmyRfR-4mM-uuhc_4U7hDVMSqFoe4IQ3UGBHU7tTB3SXb7lcKOUtvQgQhz4N';
const _timelineSueltaUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDfwDnv5Xaz4xKAszK1eK7EFM5w-hbbjaez62YILJ4Y7WjRuE5vjE50whbZTYWpdbjAtmGFl7iEZxyHvfnFK-NCxRmoa8HNMeqrzIOEG_VSZr4BFHPFblmWbNvCG1y8G0dW4cQbEnbEVc83nikzZE8xDoSLKB87Lu-JFeEUOhKg2E2xhbPq_BxzW8Yj3G8cF7vpGDEo54HQoExiPWko152bMqiGMKWteBXSmIkiJMof-Sj02Az6q-TZ3tmuKneQ96SooEYdBpn4iiGl';

// Ficha tecnica
const _fichaTecnicaHeroUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDiMVP-oiZK8FEbkw38BESRnk3fGnyhy4-IdD_t4_GGUJshOh0VxLT6NkDvo3huucOms0xgAdv5J3hTTje7DDrgJd-z9MHJY0ErxsxEV_Ui8xjnps3NoxW1ieNKviyXppAQ7jAI1xAD9DTac4vmo6NcfDAG7lONzFPFh0avOZ1--FoRK1mr21n5_vBL1UKHE22m1YUqRbDIaM-OtyG0Y37odrzrjPjFnfl4p7wkvFf_BVU4C70QI0_G3L1iIef180obPDHYEYyG3eQO';

// Galeria
const _galeriaLiveCameraUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDGj_ShdFFzHfBO4MZrwAo3vyLLLqMr6f4ZsTjPk9CwR-9cdgWOgG0ov99APLQ4ev_S1O7k8H0190A5Asarkn5ccb-6qNqllZBmfREAZ1gjk9wsReZ_3ugC2h40MgsIkbxA6ceOVGesuPvbxg9S5ZtEIYj2SPBOgl8owuzoTLyJPjVeiPo7c9iJ4vBZo06LcAxO6WiVv06XbKgejw8qHmBF4aA1dNpWgt9ZuIg3APg64RtBeWRQ4VcEzOpQSQw1QsQTbZj4_sfUGGVi';
const _galeriaPhotos = [
  'https://lh3.googleusercontent.com/aida-public/AB6AXuCYkTlhiStq8MNFE26TK1NqW-bsVSJaZ0qQI0VMUbHJxBO3gLLKUGFhv05qAqcMDxXq859Sm4XXYuRTf_qNItxbjLv7JfLLvYzp5p8R8MAKBIOJtWLYy-0ZlMOKGLR1Cngx5PKsXZNL8mqMbnQvhAw4uXC9Xa6sXwTCfQLQjQb-S_2vB4Bo5TfEc5rfGijUVdBYL5sUG1TvDjOBw7keBqq3tSWT7KSZI3fu1Jkv8wGg-eo4ZCdA5L23Dsrg8amsdXjpdpOTJy79neKb',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuB-Pw1DQQ7bqdLkKhV4LKvA0hw02BkDPXyTUTysAacvIGCnz-FxOsEqYegYLf4t5PnCz1eaLyCRGUFJ0IIukjlusLcyHPn2qqtrRGGtrBCMn9l4MwHgSTa04niG7DKgzp8cmRXFSnLX61zGY6e9flzmQ2AioNGZyd51jGYYfgyucK5NDzdycS8ywFiRXWu-arbAdM226QH39b8j6gZ-iHK6-sPItfk_pbjoYwddf6PcE__xUQHmVlrjbaZTbAUvglhdaQbL-nmODtoZ',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuB2aF5wgz1X9ET5_Akzw7h6fgl-6CoFzyzZOaBs2DY5Jt0nCSwV7PILwQ-TCQKpDB6-KavmKnFIzIKESOZpvPVpFHhKkzYsSOrvYFKWgvDFu0JlHP0mYv18oflPm9ppHTwIw38P94S2mLYgdmheLdqonN0cErEvrL1mz7BL4GVgnEK6SChR60WCTOjFmpO5Eo43McuUm5pQQqXj5Uav3Tad1edo5eiicpHHRFA9qDzFvXc9X83iJVj4MIODwcvQfvzJNjxxYa8qsdCp',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuCDX9I_Jo4BG9rygNs7U7EksToWNEsVzKn3dbobtOZxUB61TlfbLGpAAL9MEqeX0qoh98ex26cYn86QwZ7THT1BWEWUJ6Y6Cq-hMUlEFWp9c4d82QcsUExPAp2s6x5MYSnY1VgTeCIjfBf0SRdxRvc6Gk1BQAp6a4smJvitS0mG8TOjZJeHUhlmnnh2-sniQOFXZL6wFXLfmx8zCGZPCf7vKPItW3PCAVW3YZmatIWn0kfoVPpPLO7zjYBHgxapGA9ozxpwl-dLZtjH',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuBdRYuDYB-W1T8aBzSGJioYjBV-eqSpEp3Yfl6iM5-3S-fhz5Y5l1VMVhcLr3bgGdlE4BrBBqzBozkQ_4dXY_uZQPNJ5LY4bUIt-Lk_q_wfxtvk4PFl-1GFd8-_oVSx1ih6TaavhWingNk-sNkcAFaToz8CMX0iRBosNNUEaZwV8qrMTmJZyRWr0X6smsbJRJApbL6V0VPsEWHnmqzbpdsD244myUANT3mT93QMTtBLboOguEjnyB0gzXMLTNTRXu8ufvlYqeKSQ2cl',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDgJpnrS-sg6td2Hdupx4G-ijxkngOvqM2PoBoXUlqurKEwHraTGMmXKbfXiXvnr4RBV3SjOYFLy0kOdgztfv-VvUje1ynWyM_7PqS0efJtTrw_fAxW-VH-vklHNEZMcyUa9y-0rtwatrkZ5Y2PIj5nAf3UJJ3zNHhl1rUQ4eqTzXO7ZAxsH3jMquJRBmdHnsz3rgodRZIMjM02WLQgsyID6LX2zSTwL3qZ4b2YBwe5lchqK50ZHvFMoiPR6qbv1XGatk99-DV1C8LR',
];
const _galeriaVideoThumbs = [
  'https://lh3.googleusercontent.com/aida-public/AB6AXuBCx3PeZxEbZ9QAVAlpZCPz1nCJfD52Qw5JvXufJBT7tSDzMX2snwQeUMEctT4dsY5i_ZDwZxszXJ3ojr13oThaVZNMvajw_ERNq96z6JgvfYCGOsSvaJ5_crcsOc7NBD599LvEN0oHU1ujDiDQCiBfw8cDQy3AJyL3JBNAPFu9_9c8m-drG3ii5zSsn1Kn8tS6cwMpShknaaSvg_660Lqc-SH8t_cyKNhQUyP1Ew_wPFYLheFu5LsHlDJvZHGQK3gz4pmLtkdYGBMz',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuA5PvHjVvxEzw-446VzlNzHx7TaJIQKsMIjVI3L_pPHkNsFqSe9W351WFREpF7ogmI8eo0Us2a9QVDEL3rD6xBrb-8Djm_bO1l7e0ojO7yZ-3eV5oGOQLH3Vg4sPvOWNSuRuyrX4WbxwhuRCosEIGTKaHw4SrepsEdD62L00DX8PIXoZXwyU39qa6n5uGy8YpLMdRy6jQQD3zjLNM4pr-kcIJ97V39yTimeOvtK9HLALYk0Ej719FqhzT_1MtmICM9l_7kUSc0pgFku',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuBLjFZpdKTTG3dnwWomPVc5dpvxGU5qzJ7mABXxoZLOqNbGsqz9T9O4gUZRpmf0XTL_66VjOpkIz7vW-3vcjFKCk0FT9VUeNWyvJ_jTy-uWEHomJzO9ur3tUSWgTeqhuAj8KzBlPJURp3fqgEgGbuOcPuLevE81_nx0Gr6Zx35X1z0zoLLUGNhHC3riZh_-vL2qazarWIh-bGCmjUFIaz_HWs4l0sd60QpswWkaSE4YzIf1wMYuduvGCtbySBwZz1ULEU6WjUYAWYrc',
];

// Equipo
const _equipoVideoUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuA1_LyM7_Wt8TiQLQoF25CDyH3zE4eiyyn3Tebsaf94uzcgMvfqJjwGcOo5lsrpBf3-VFSvlu1BRn26LE9MqxWpvbrE5z3jLceivyKIKi-ckmCZjiomNFFBYxy1iVh_RdeTNMw5CbZI22w_GTYEM-lbhrkFEmZO9Piw_dbEusIDBEQ-Mn4lAFBntW1C9ZSkOJ10X4HCPCHmackoHkpCZmULfNzuYcBWymfLpdTRCbeytWkuUuUHJmhi3jqUYTziErsmIpRLI6wH8SoV';
const _equipoPhotos = [
  'https://lh3.googleusercontent.com/aida-public/AB6AXuCvQ2qbB4vu5x0XZP107qCbF6Z6Gmf3L9NDLyzBhfnTUh49Rga_U_fIBZTpOFPrq_EE3O98gf9vHLg1UdZnWcb5gj_xdg1uin9EPU6D1jqaaZSmi9ojuzytBtLtUF2yT16pSYvM9876lLKnsGgNWNf9YL4NpzlXE5BbDZ8POtQujp8EeNnbSKXy0khMdFgRysWATNkpr11RLAyHKNfaRo7B51GwFgZsJdqgRhpXMTBhWedOQT_4qbW_7fdssBmQFFXiCQViT7m8B8u-',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDrVRSv84_32uOMve-eukhBsTtARTeOvQzoyd7ebmMlGGKoULR2yq8PhKxp59hVk-E4mTtRrfOaZpDW45idi_2XZSPTGBqDMhWQ_cOPyBhRY2B6DblnShZzn21yFT5Ia1wesV9vlKhvfvuc-OzVJs6wLNw0KwaQFc2cSR-kTsEjD4mBpf60WYOK9G1U5QJznBBWjgNUdOFenffrbr-xhYYWUPB9q0O6GrVda7PR6Kqgpra2u6KH-KVPX49fImh7vN9b26dpO5vghxs2',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuD95XYrTxJ6zJp-MYKMnUq-yMKnKU7buWbO3xmBdVLiL2Zvgb6RMLfHmVkpcHDtm1RyY_ApMPI851EZ9a8ir23FkuKh94PoXFHNFNdNO4RJ49Y6O3fP3X_1kluc5VHeV7bbYYyWx5kqv7jcEOfEGLOxztFBzbInr9pn4HCn-4kyAdyq7qGnMHQVvz9AYah_dC1Uu2u2yjy6bU3M2kfh8b5-xYS8H4VoVxy7Szn4h_c7JTAS4xJIaH-77LyaT9XnXF6KxGnvnqsSBnJC',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDf-wE6z1iAkjOSwqoVnsCcn_vzmJwHqfBXMEiAfhLN7SJNDJUjGYTWdJogaaz1DrqeP3wv_D5OmpFPPZ_Qv9cGoTZJG5scIL25Ut1X7GalpNFxmRnfrO9Yfp_q_JVJCSJ1N4KlD8K5VDEplrORi3Sq5VI-EOgtNMlhhJWF0pwIg2yb6PPHS6sh4QFewmj0tjiYeK-qafdkxBWihRBRfOdaCHjhbLYFyhHWPc5156XRfjzMAz5nBjUfYYvpdCESR1eNLY1dvPP0iqVo',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDMLkCCpkgqC8ZhZCXvP0JGwkkzDWZsSTMW-fW0iSG38CHc42vhXUDI4KS1wf2jCzb3lJctP5RzsZPG80g7NJbr0sAr7xn-Edspd8hcPjrxmCWQ2jsBD7F2iTCRvsDKnuHXJ7K8AJJNUcZp2nvBYf2ar75qHLzDAxur_ZEFAMknODvx_TR-QXG5yAlBV-1r2lweY7tgmJjJfpAsHTIDrYhNl_j4d-uDA2jnq5POwhJk88vtMEKAavmT7ebDoHgC6XHC4wI83_I1p4az',
];
const _equipoFishermanUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuATijeybOs4bZgvrhHFhZLss1PjkzxM-yR236gNdcXImGPR9Z4kt6Ff-dxKcQRN1R1OAeWGeDTHdkhkUazSuBSr-fLQX3v2C3YDdLaSB40LUMd8Y6NDIC5v2ZTxq060ztH2csJ6gc3EQHmWjp36uT-WhPh-mbPJPNyrh_-qBIwOemGgW-AJ-iKnzhHHUxvrDCinR7HCV_6Rh3KDMVx5EtUdnxOdzL94IZ9CQqMA5vzkJPdUJ36r2Ie0h2H5CJWEvJ7cF0JtGbbMEEzI';

// Curiosidades
const _curiosidadImages = [
  'https://lh3.googleusercontent.com/aida-public/AB6AXuD1ENmJUTS6cA3lQj_qk-27_MpnXWTqMfh7oSIvDeIEJDyCvfcT9VwJSu76LUzwNVZeMLi061hh7tAW-63xuBi4sDDtP_cO3ElUPAMPROoI6k0rZ4rEU09Z7Fvo3J-i-MBRfRtyhr6_XqAJrHX0q1pVOz4Oa5IC3gJJ1bIdhnOHez6dUgqsbOdNXrg4b28uxGqZwA252DoF3lVRws6UNDeEAZtRumbY_W__CLvLLmrnPJvAPMcOs1zauF0_1o-HaV5lMz5oB1E0GCWw',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDyd7BQiBdKTTckjYcSXfv34cG8SNRLwmc3vBgFdctgLBS__y97LM1f-iddK8Rs3UQaHaCObhUpI9dLyPSy2jMOn8Qv-9EHf2dPC-MQLABamPujMw0kZKnqyioNFvEeb0R6rr1ygbsnZUkIfmAb2HlEOx5LdziEbUd3MPXEc6ovllacQQGW1AatI-FWqU3BwCp6tu6rOotoYnb6lGffZLeLyFQVSUbwwoPvMBymb6Z9hjVFdhwnINuO6T2PJ1mb4-JIb9bVrLim1JI2',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuAWNcKN0TPz_klEI55xW1Bqm_9kokXcLT7JoIGFzkJvmYxE05OcNoCxPI-QsPzNSCDn0_qs_qRohv70wKdePlUP2UJ0gsrEdkBgtrkbvyyDnbMnxOZi0_uiBtsIWYnpCzUUhWfTSLQwEBvHPC75aPBD57z0rrR0zflrDKy4S_jna4IvogX6rulDvnZPFSITfg_P7YU7EpYoPiW0A9HXCDsjSoGOELLVWBmA9904EIAUoezpAeQlLjgceUFLJTIRGUWnbM8vXDuBBQmt',
];

/// Subscriber view of a project with botonera (7 sections).
class ProjectSubscriberScreen extends StatefulWidget {
  const ProjectSubscriberScreen({super.key, required this.id});

  final String id;

  @override
  State<ProjectSubscriberScreen> createState() =>
      _ProjectSubscriberScreenState();
}

class _ProjectSubscriberScreenState extends State<ProjectSubscriberScreen> {
  _Section _activeSection = _Section.timeline;
  int _curiosidadesSubTab = 0; // 0 = Sabias que, 1 = Mitos

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // ── App bar ──
          SliverAppBar(
            pinned: true,
            backgroundColor: cs.surface,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: FaumaColors.primary),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/explore');
                }
              },
            ),
            title: Text(
              'Proyecto Pintarroja',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.share, color: FaumaColors.primary),
                onPressed: () {},
              ),
            ],
          ),

          // ── Botonera (sticky under app bar) ──
          SliverPersistentHeader(
            pinned: true,
            delegate: _BotoneraDelegate(
              activeSection: _activeSection,
              onSectionTap: (section) {
                setState(() => _activeSection = section);
              },
              backgroundColor: cs.surface,
            ),
          ),
        ],
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    switch (_activeSection) {
      case _Section.timeline:
        return _TimelineContent();
      case _Section.fichaTecnica:
        return _FichaTecnicaContent();
      case _Section.galeria:
        return _GaleriaContent();
      case _Section.profundizando:
        return _ProfundizandoContent();
      case _Section.equipo:
        return _EquipoContent();
      case _Section.resultados:
        return _ResultadosContent();
      case _Section.curiosidades:
        return _CuriosidadesContent(
          activeSubTab: _curiosidadesSubTab,
          onSubTabChanged: (i) => setState(() => _curiosidadesSubTab = i),
        );
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// BOTONERA DELEGATE
// ═══════════════════════════════════════════════════════════════════════════

class _BotoneraDelegate extends SliverPersistentHeaderDelegate {
  const _BotoneraDelegate({
    required this.activeSection,
    required this.onSectionTap,
    required this.backgroundColor,
  });

  final _Section activeSection;
  final ValueChanged<_Section> onSectionTap;
  final Color backgroundColor;

  @override
  double get minExtent => 64;
  @override
  double get maxExtent => 64;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _Section.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final section = _Section.values[index];
          final isActive = section == activeSection;
          return GestureDetector(
            onTap: () => onSectionTap(section),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? FaumaColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
                border: isActive
                    ? null
                    : Border.all(
                        color:
                            FaumaColors.primary.withValues(alpha: 0.3)),
              ),
              child: Text(
                section.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive ? Colors.white : FaumaColors.secondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _BotoneraDelegate oldDelegate) =>
      activeSection != oldDelegate.activeSection;
}

// ═══════════════════════════════════════════════════════════════════════════
// 1. TIMELINE
// ═══════════════════════════════════════════════════════════════════════════

class _TimelineContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      children: [
        // Phase 0 — Contexto
        _TimelinePhase(
          number: '0',
          isCompleted: false,
          isCurrent: false,
          isPast: true,
          tag: 'Fase Inicial',
          title: 'CONTEXTO',
          description:
              'Huevos de tibur\u00F3n descartados como subproducto de la pesca (bycatch).',
        ),
        // Phase 1 — Recoleccion
        _TimelinePhase(
          number: '1',
          isCompleted: true,
          isCurrent: false,
          isPast: false,
          tag: 'Log\u00EDstica',
          title: 'RECOLECCI\u00D3N (Puerto)',
          icon: Icons.anchor,
          location: 'Puerto pesquero',
          imageUrl: _timelineRecoleccionUrl,
          imageCaption:
              'Recuperaci\u00F3n de c\u00E1psulas de huevos en redes de arrastre.',
        ),
        // Phase 2 — Triaje
        _TimelinePhase(
          number: '2',
          isCompleted: true,
          isCurrent: false,
          isPast: false,
          tag: 'Ciencia',
          title: 'TRIAJE (Laboratorio)',
          icon: Icons.biotech,
          description:
              'Clasificaci\u00F3n rigurosa por estado embrionario y viabilidad biol\u00F3gica.',
        ),
        // Phase 3 — Incubacion (current)
        _TimelinePhase(
          number: '3',
          isCompleted: false,
          isCurrent: true,
          isPast: false,
          tag: 'Monitorizaci\u00F3n',
          title: 'INCUBACI\u00D3N (Acuarios)',
          icon: Icons.pool,
          subSteps: const [
            _SubStep('3.1 Desinfecci\u00F3n',
                'Protocolo inicial de limpieza profil\u00E1ctica.', true),
            _SubStep('3.2 Asignaci\u00F3n',
                'Ubicaci\u00F3n en tanques controlados por ID.', true),
            _SubStep('3.3 Monitorizaci\u00F3n 24/7', null, false),
            _SubStep('3.6 Biometr\u00EDa final', null, false),
          ],
        ),
        // Phase 4 — Eclosion
        _TimelinePhase(
          number: '4',
          isCompleted: false,
          isCurrent: false,
          isPast: false,
          tag: 'Crecimiento',
          title: 'ECLOSI\u00D3N Y CR\u00CDA',
          icon: Icons.egg,
          description: 'Seguimiento post-eclosi\u00F3n de los alevines.',
          isFuture: true,
        ),
        // Phase 5 — Suelta
        _TimelinePhase(
          number: '5',
          isCompleted: false,
          isCurrent: false,
          isPast: false,
          tag: 'Meta final',
          title: 'SUELTA AL MEDIO',
          icon: Icons.waves,
          imageUrl: _timelineSueltaUrl,
          imageCaption:
              'Reintroducci\u00F3n controlada en \u00E1reas marinas protegidas.',
          isFuture: true,
          isLast: true,
        ),
      ],
    );
  }
}

class _SubStep {
  const _SubStep(this.title, this.description, this.isCompleted);
  final String title;
  final String? description;
  final bool isCompleted;
}

class _TimelinePhase extends StatelessWidget {
  const _TimelinePhase({
    required this.number,
    required this.isCompleted,
    required this.isCurrent,
    required this.isPast,
    this.tag,
    required this.title,
    this.icon,
    this.location,
    this.description,
    this.imageUrl,
    this.imageCaption,
    this.subSteps,
    this.isFuture = false,
    this.isLast = false,
  });

  final String number;
  final bool isCompleted;
  final bool isCurrent;
  final bool isPast;
  final String? tag;
  final String title;
  final IconData? icon;
  final String? location;
  final String? description;
  final String? imageUrl;
  final String? imageCaption;
  final List<_SubStep>? subSteps;
  final bool isFuture;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final dotBg = (isPast || isFuture) && !isCurrent && !isCompleted
        ? FaumaColors.surfaceContainerLow
        : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCurrent
                  ? FaumaColors.tertiary
                  : isCompleted
                      ? FaumaColors.primary
                      : dotBg ?? FaumaColors.surfaceContainerLow,
              border: Border.all(
                  color: FaumaColors.surface, width: 4),
              boxShadow: isCurrent
                  ? [
                      BoxShadow(
                        color:
                            FaumaColors.tertiary.withValues(alpha: 0.3),
                        blurRadius: 12,
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: (isCompleted || isCurrent)
                      ? Colors.white
                      : const Color(0xFF6F797A),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          // Content
          Expanded(
            child: _buildPhaseContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseContent(BuildContext context) {
    final hasCard =
        isCompleted || isCurrent || imageUrl != null;

    if (!hasCard && !isFuture) {
      // Flat display (e.g., Phase 0)
      return Opacity(
        opacity: isPast ? 0.6 : 1.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tag != null)
                Text(
                  tag!.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: const Color(0xFF6F797A),
                  ),
                ),
              if (tag != null) const SizedBox(height: 4),
              Text(
                title,
                style: GoogleFonts.newsreader(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 4),
                Text(
                  description!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF3F4849),
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    // Card display
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isCurrent
            ? Border.all(color: const Color(0xFFFFB4AC), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (tag != null)
                      Row(
                        children: [
                          Text(
                            tag!.toUpperCase(),
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: isCurrent
                                  ? FaumaColors.tertiary
                                  : FaumaColors.secondary,
                            ),
                          ),
                          if (isCurrent) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: FaumaColors.tertiary,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'EN CURSO',
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (icon != null)
                Icon(icon,
                    color: isCurrent
                        ? FaumaColors.tertiary
                        : FaumaColors.primaryContainer),
            ],
          ),
          if (location != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on,
                    size: 14, color: FaumaColors.secondary),
                const SizedBox(width: 4),
                Text(
                  location!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: FaumaColors.secondary,
                  ),
                ),
              ],
            ),
          ],
          if (imageUrl != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 128,
                width: double.infinity,
                child: ColorFiltered(
                  colorFilter: isFuture
                      ? const ColorFilter.mode(
                          Colors.grey, BlendMode.saturation)
                      : const ColorFilter.mode(
                          Colors.transparent, BlendMode.dst),
                  child: Opacity(
                    opacity: isFuture ? 0.5 : 1.0,
                    child: FaumaImage(
                        imageUrl: imageUrl!, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            if (imageCaption != null) ...[
              const SizedBox(height: 8),
              Text(
                imageCaption!,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF3F4849),
                ),
              ),
            ],
          ],
          if (description != null && imageUrl == null) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF3F4849),
                height: 1.5,
              ),
            ),
          ],
          if (subSteps != null) ...[
            const SizedBox(height: 24),
            ...subSteps!.map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Opacity(
                    opacity: s.isCompleted ? 1.0 : 0.4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(top: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: s.isCompleted
                                ? FaumaColors.tertiary
                                : Colors.transparent,
                            border: s.isCompleted
                                ? null
                                : Border.all(
                                    color: const Color(0xFF3F4849)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s.title,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (s.description != null) ...[
                                const SizedBox(height: 2),
                                Text(
                                  s.description!,
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    color: const Color(0xFF3F4849),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 2. FICHA TECNICA
// ═══════════════════════════════════════════════════════════════════════════

class _FichaTecnicaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      children: [
        // Hero image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FaumaImage(imageUrl: _fichaTecnicaHeroUrl, fit: BoxFit.cover),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0x99000000), Colors.transparent],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pintarroja',
                            style: GoogleFonts.newsreader(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        Text('Scyliorhinus canicula',
                            style: GoogleFonts.newsreader(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.9))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Taxonomy
        _FichaCard(
          borderColor: FaumaColors.primary,
          icon: Icons.account_tree,
          iconColor: FaumaColors.primaryContainer,
          title: 'Taxonom\u00EDa y Clasificaci\u00F3n',
          children: [
            _FichaField('Clase', 'Chondrichthyes'),
            _FichaField('Orden', 'Carcharhiniformes'),
            _FichaField('Familia', 'Scyliorhinidae'),
            const Divider(height: 24),
            _FichaField('Nombres comunes',
                'Pintarroja, Lesser spotted catshark.'),
          ],
        ),
        const SizedBox(height: 16),
        // Biology
        _FichaCard(
          borderColor: FaumaColors.secondary,
          icon: Icons.biotech,
          iconColor: FaumaColors.secondary,
          title: 'Biolog\u00EDa y Morfolog\u00EDa',
          children: [
            Row(
              children: [
                Expanded(child: _FichaField('Longitud', '60-80 cm')),
                const SizedBox(width: 32),
                Expanded(child: _FichaField('Peso', '~1 kg')),
              ],
            ),
            const SizedBox(height: 16),
            _FichaField('Color', 'Marr\u00F3n claro con manchas oscuras.'),
            const SizedBox(height: 12),
            _FichaField('Caracter\u00EDsticas', 'Piel \u00E1spera, cuerpo esbelto.'),
          ],
        ),
        const SizedBox(height: 16),
        // Ecology
        _FichaCard(
          borderColor: FaumaColors.primary,
          icon: Icons.eco,
          iconColor: FaumaColors.primary,
          title: 'Ecolog\u00EDa',
          children: [
            _FichaField('H\u00E1bitat',
                'Fondos arenosos y rocosos, 1-400m profundidad.'),
            const SizedBox(height: 16),
            _FichaField('Distribuci\u00F3n',
                'Atl\u00E1ntico NE y Mediterr\u00E1neo.'),
            const SizedBox(height: 16),
            _FichaField('Alimentaci\u00F3n',
                'Crust\u00E1ceos, moluscos, peces peque\u00F1os.'),
          ],
        ),
        const SizedBox(height: 16),
        // Reproduction
        _FichaCard(
          borderColor: const Color(0xFF92D1D8),
          icon: Icons.egg,
          iconColor: FaumaColors.primaryContainer,
          title: 'Reproducci\u00F3n',
          children: [
            Row(
              children: [
                Expanded(child: _FichaField('Tipo', 'Ov\u00EDpara')),
                Expanded(child: _FichaField('Huevos / a\u00F1o', '18-20')),
              ],
            ),
            const SizedBox(height: 16),
            _FichaField('Incubaci\u00F3n',
                '5-11 meses (temperatura dependiente)'),
          ],
        ),
        const SizedBox(height: 16),
        // Conservation
        _FichaCard(
          borderColor: FaumaColors.tertiary,
          icon: Icons.verified_user,
          iconColor: FaumaColors.tertiary,
          title: 'Conservaci\u00F3n',
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('IUCN',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3F4849))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text('Preocupaci\u00F3n menor (LC)',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF166534))),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tendencia',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3F4849))),
                Text('Estable',
                    style: GoogleFonts.inter(fontSize: 14)),
              ],
            ),
            const Divider(height: 24),
            _FichaField(
                'Amenazas principales', 'Bycatch, p\u00E9rdida de h\u00E1bitat.'),
          ],
        ),
      ],
    );
  }
}

class _FichaCard extends StatelessWidget {
  const _FichaCard({
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.children,
  });

  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: const Color(0xFF3F4849),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _FichaField extends StatelessWidget {
  const _FichaField(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF3F4849))),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.inter(fontSize: 14)),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 3. GALERIA
// ═══════════════════════════════════════════════════════════════════════════

class _GaleriaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      children: [
        // Live camera
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FaumaImage(
                        imageUrl: _galeriaLiveCameraUrl, fit: BoxFit.cover),
                    // Live badge
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('EN DIRECTO',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 1.5)),
                          ],
                        ),
                      ),
                    ),
                    // Viewer count
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.visibility,
                                color: Colors.white, size: 14),
                            const SizedBox(width: 6),
                            Text('23',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ],
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
                    Text('Acuario de incubaci\u00F3n \u2014 C\u00E1mara 24h',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary)),
                    const SizedBox(height: 4),
                    Text(
                        'Observaci\u00F3n continua de embriones de Pintarroja',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF3F4849))),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Gallery header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Archivo Multimedia',
                style: GoogleFonts.newsreader(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.primary)),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ver todo',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: FaumaColors.primaryContainer)),
                  const SizedBox(width: 4),
                  Icon(Icons.chevron_right,
                      size: 16, color: FaumaColors.primaryContainer),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Photo grid (asymmetric, 2 columns)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _GalleryImage(
                      url: _galeriaPhotos[0], aspectRatio: 3 / 4),
                  const SizedBox(height: 16),
                  _GalleryImage(
                      url: _galeriaPhotos[1], aspectRatio: 1),
                  const SizedBox(height: 16),
                  _GalleryImage(
                      url: _galeriaPhotos[2], aspectRatio: 4 / 5),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  _GalleryImage(
                      url: _galeriaPhotos[3], aspectRatio: 1),
                  const SizedBox(height: 16),
                  _GalleryImage(
                      url: _galeriaPhotos[4], aspectRatio: 3 / 4),
                  const SizedBox(height: 16),
                  _GalleryImage(
                      url: _galeriaPhotos[5], aspectRatio: 1),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Video highlights
        Text('V\u00EDdeos Destacados',
            style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _galeriaVideoThumbs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final titles = [
                'D\u00EDa de suelta 2025',
                'Proceso de triaje',
                'Conoce al equipo'
              ];
              final subtitles = [
                'Hito del proyecto \u2022 Hace 2 semanas',
                'T\u00E9cnico \u2022 Hace 1 mes',
                'Comunidad \u2022 Hace 2 meses',
              ];
              final durations = ['3:24', '2:15', '4:02'];
              return SizedBox(
                width: 256,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            FaumaImage(
                                imageUrl: _galeriaVideoThumbs[index],
                                fit: BoxFit.cover),
                            Container(
                                color: Colors.black.withValues(alpha: 0.2)),
                            const Center(
                              child: Icon(Icons.play_circle_filled,
                                  color: Colors.white, size: 40),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(durations[index],
                                    style: GoogleFonts.inter(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(titles[index],
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary)),
                    const SizedBox(height: 2),
                    Text(subtitles[index],
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF3F4849))),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({required this.url, required this.aspectRatio});

  final String url;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: FaumaImage(imageUrl: url, fit: BoxFit.cover),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 4. PROFUNDIZANDO
// ═══════════════════════════════════════════════════════════════════════════

class _ProfundizandoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      children: [
        Text('Profundizando',
            style: GoogleFonts.newsreader(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 8),
        Text(
          'Conoce los detalles cient\u00EDficos y t\u00E9cnicos del proyecto.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: FaumaColors.secondary,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 24),

        // Article cards
        _ProfundizandoCard(
          icon: Icons.science,
          title: 'Metodolog\u00EDa de incubaci\u00F3n',
          body:
              'Las c\u00E1psulas de huevo se mantienen en tanques con agua marina filtrada a temperatura controlada entre 15-17\u00B0C. Se monitoriza di\u00E1riamente el pH, salinidad y oxigenaci\u00F3n para replicar las condiciones naturales del Mediterr\u00E1neo occidental.',
        ),
        const SizedBox(height: 16),
        _ProfundizandoCard(
          icon: Icons.analytics,
          title: 'Seguimiento embrionario',
          body:
              'Mediante ecograf\u00EDas peri\u00F3dicas y luz transmitida se registra el desarrollo del embri\u00F3n. Cada huevo tiene un c\u00F3digo QR que permite trazar su historial completo desde la recogida hasta la eclosi\u00F3n.',
        ),
        const SizedBox(height: 16),
        _ProfundizandoCard(
          icon: Icons.water_drop,
          title: 'Protocolo de suelta',
          body:
              'Los juveniles se liberan en zonas de especial protecci\u00F3n marina cuando alcanzan una longitud m\u00EDnima de 12 cm. Se eligen d\u00EDas de mar en calma y se priorizan fondos rocosos con buena cobertura de algas.',
        ),
        const SizedBox(height: 16),
        _ProfundizandoCard(
          icon: Icons.school,
          title: 'Programa educativo',
          body:
              'M\u00E1s de 2.000 estudiantes han participado en talleres de sensibilizaci\u00F3n sobre tiburones y rayas del Mediterr\u00E1neo. El proyecto incluye materiales did\u00E1cticos y visitas guiadas al laboratorio de incubaci\u00F3n.',
        ),
      ],
    );
  }
}

class _ProfundizandoCard extends StatelessWidget {
  const _ProfundizandoCard({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: FaumaColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: FaumaColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title,
                    style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(body,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF3F4849),
                  height: 1.7)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 5. EQUIPO
// ═══════════════════════════════════════════════════════════════════════════

class _EquipoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      children: [
        // Featured video
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FaumaImage(imageUrl: _equipoVideoUrl, fit: BoxFit.cover),
                Container(
                    color: FaumaColors.primary.withValues(alpha: 0.2)),
                Center(
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.play_arrow,
                        color: FaumaColors.primary, size: 32),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Conoce al equipo detr\u00E1s del proyecto',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('4:02',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Team members
        Text('Nuestro Equipo',
            style: GoogleFonts.newsreader(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 16),

        // Grid 2x2
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
          children: const [
            _TeamMemberCard(
              imageUrl: _equipoPhotos,
              imageIndex: 0,
              icon: Icons.science,
              name: 'Dr. Ana Mart\u00EDnez',
              role: 'Directora, Bi\u00F3loga marina',
            ),
            _TeamMemberCard(
              imageUrl: _equipoPhotos,
              imageIndex: 1,
              icon: Icons.medical_services,
              name: 'Carlos Ruiz',
              role: 'Veterinario acu\u00E1tico',
            ),
            _TeamMemberCard(
              imageUrl: _equipoPhotos,
              imageIndex: 2,
              icon: Icons.biotech,
              name: 'Mar\u00EDa L\u00F3pez',
              role: 'T\u00E9cnica de laboratorio',
            ),
            _TeamMemberCard(
              imageUrl: _equipoPhotos,
              imageIndex: 3,
              icon: Icons.map,
              name: 'Pedro S\u00E1nchez',
              role: 'Coordinador de campo',
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Member 5 (full width)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child:
                      FaumaImage(imageUrl: _equipoPhotos[4], fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.biotech,
                            size: 14, color: FaumaColors.secondary),
                        const SizedBox(width: 4),
                        Text('Laura Garc\u00EDa',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('Investigadora principal',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF3F4849))),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Fishermen collaborators
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FaumaImage(
                        imageUrl: _equipoFishermanUrl, fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            FaumaColors.primary.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ALIANZA LOCAL',
                              style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                  color: const Color(0xFFAEEDF4))),
                          const SizedBox(height: 4),
                          Text('12 pescadores colaboradores',
                              style: GoogleFonts.newsreader(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: FaumaColors.surfaceContainerLow,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Pieza fundamental del proyecto. Los pescadores de la cofrad\u00EDa local recuperan los huevos de tibur\u00F3n que quedan atrapados en las redes de arrastre, d\u00E1ndoles una segunda oportunidad en nuestros laboratorios.',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF3F4849),
                      height: 1.7),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Institutions
        Text('Instituciones Aliadas',
            style: GoogleFonts.newsreader(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 16),
        _InstitutionRow(
            icon: Icons.account_balance, name: 'Asociaci\u00F3n LAMNA',
            subtitle: 'Research and coordination'),
        const SizedBox(height: 12),
        _InstitutionRow(
            icon: Icons.water_drop, name: 'Fundaci\u00F3n Oceanogr\u00E0fic',
            subtitle: 'Lab facilities and veterinary support'),
        const SizedBox(height: 12),
        _InstitutionRow(
            icon: Icons.tsunami, name: 'Fundaci\u00F3n Azul Marino',
            subtitle: 'Field logistics and community outreach'),

        const SizedBox(height: 32),

        // Equipment
        Text('Material y equipo t\u00E9cnico',
            style: GoogleFonts.newsreader(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _EquipmentCard(
                  icon: Icons.inventory_2,
                  title: 'Contenedores isot\u00E9rmicos',
                  description:
                      'Para el transporte seguro de huevos desde el puerto.'),
              SizedBox(width: 16),
              _EquipmentCard(
                  icon: Icons.air,
                  title: 'Oxigenadores port\u00E1tiles',
                  description:
                      'Mantenimiento de niveles \u00F3ptimos durante traslados.'),
              SizedBox(width: 16),
              _EquipmentCard(
                  icon: Icons.set_meal,
                  title: 'Acuarios especializados',
                  description:
                      'Tanques de incubaci\u00F3n con flujo controlado.'),
              SizedBox(width: 16),
              _EquipmentCard(
                  icon: Icons.sensors,
                  title: 'Sensores multiparam\u00E9tricos',
                  description:
                      'Monitoreo 24/7 de salinidad y temperatura.'),
            ],
          ),
        ),
      ],
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  const _TeamMemberCard({
    required this.imageUrl,
    required this.imageIndex,
    required this.icon,
    required this.name,
    required this.role,
  });

  final List<String> imageUrl;
  final int imageIndex;
  final IconData icon;
  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: SizedBox(
              width: 80,
              height: 80,
              child: FaumaImage(
                  imageUrl: imageUrl[imageIndex], fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 12),
          Icon(icon, size: 14, color: FaumaColors.secondary),
          const SizedBox(height: 4),
          Text(name,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.2)),
          const SizedBox(height: 2),
          Text(role,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3F4849))),
        ],
      ),
    );
  }
}

class _InstitutionRow extends StatelessWidget {
  const _InstitutionRow({
    required this.icon,
    required this.name,
    required this.subtitle,
  });

  final IconData icon;
  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: FaumaColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: FaumaColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: const Color(0xFF3F4849))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  const _EquipmentCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            Border(left: BorderSide(color: FaumaColors.primary, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: FaumaColors.tertiary, size: 28),
          const SizedBox(height: 12),
          Text(title,
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(description,
              style: GoogleFonts.inter(
                  fontSize: 12, color: const Color(0xFF3F4849))),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 6. RESULTADOS
// ═══════════════════════════════════════════════════════════════════════════

class _ResultadosContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      children: [
        // Campaign header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Campa\u00F1a 2024-2025',
                style: GoogleFonts.newsreader(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.primary)),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: FaumaColors.coralCta,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text('EN CURSO',
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.5)),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Key metrics grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: const [
            _MetricCard(
                icon: Icons.egg_alt, value: '247', label: 'Huevos recolectados'),
            _MetricCard(
                icon: Icons.trending_up, value: '89%', label: 'Tasa de eclosi\u00F3n'),
            _MetricCard(
                icon: Icons.water_drop,
                value: '198',
                label: 'Juveniles liberados'),
            _MetricCard(
                icon: Icons.group, value: '12', label: 'Colaboradores'),
          ],
        ),

        const SizedBox(height: 24),

        // Monthly chart
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: FaumaColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Huevos recolectados por mes',
                  style: GoogleFonts.newsreader(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: FaumaColors.primary)),
              const SizedBox(height: 24),
              SizedBox(
                height: 128,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _BarColumn('Oct', 0.375),
                    _BarColumn('Nov', 0.625),
                    _BarColumn('Dec', 0.875),
                    _BarColumn('Jan', 1.0),
                    _BarColumn('Feb', 0.75),
                    _BarColumn('Mar', 0.5),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Last releases mini-timeline
        Text('\u00DAltimas sueltas',
            style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary)),
        const SizedBox(height: 16),
        _ReleaseTimelineItem('15 Mar 2025', '32 juveniles \u2014 Malvarrosa'),
        _ReleaseTimelineItem('28 Feb 2025', '28 juveniles \u2014 El Saler'),
        _ReleaseTimelineItem('12 Jan 2025', '41 juveniles \u2014 Cullera'),

        const SizedBox(height: 32),

        // Cumulative impact card
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: FaumaColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Impacto acumulado',
                  style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(height: 24),
              _ImpactRow('Total rescatados', '1,247'),
              _ImpactRow('Total liberados', '987'),
              _ImpactRow('Supervivencia', '~72%'),
              _ImpactRow('A\u00F1os activo', '4', showBorder: false),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Download button
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: FaumaColors.primary, width: 2),
            shape: const StadiumBorder(),
          ),
          child: Text('DESCARGAR INFORME COMPLETO',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.primary,
                  letterSpacing: 2)),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: FaumaColors.outlineVariant.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: FaumaColors.primary, size: 28),
          const SizedBox(height: 8),
          Text(value,
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: FaumaColors.primary)),
          const SizedBox(height: 4),
          Text(label.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3F4849),
                  letterSpacing: -0.3)),
        ],
      ),
    );
  }
}

class _BarColumn extends StatelessWidget {
  const _BarColumn(this.label, this.fraction);

  final String label;
  final double fraction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: fraction,
                  child: Container(
                    decoration: BoxDecoration(
                      color: FaumaColors.primary
                          .withValues(alpha: 0.2 + fraction * 0.8),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(label.toUpperCase(),
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF6F797A))),
          ],
        ),
      ),
    );
  }
}

class _ReleaseTimelineItem extends StatelessWidget {
  const _ReleaseTimelineItem(this.date, this.description);

  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: FaumaColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date.toUpperCase(),
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF6F797A),
                        letterSpacing: 1)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(description,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                    Icon(Icons.check_circle,
                        size: 16, color: FaumaColors.secondary),
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

class _ImpactRow extends StatelessWidget {
  const _ImpactRow(this.label, this.value, {this.showBorder = true});

  final String label;
  final String value;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: showBorder
          ? BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Colors.white.withValues(alpha: 0.1))))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label.toUpperCase(),
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.7),
                  letterSpacing: 0.5)),
          Text(value,
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 7. CURIOSIDADES
// ═══════════════════════════════════════════════════════════════════════════

class _CuriosidadesContent extends StatelessWidget {
  const _CuriosidadesContent({
    required this.activeSubTab,
    required this.onSubTabChanged,
  });

  final int activeSubTab;
  final ValueChanged<int> onSubTabChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sub-navigation toggle
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: FaumaColors.outlineVariant.withValues(alpha: 0.15)),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onSubTabChanged(0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: activeSubTab == 0
                              ? FaumaColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Sab\u00EDas qu\u00E9',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: activeSubTab == 0
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: activeSubTab == 0
                            ? FaumaColors.primary
                            : const Color(0xFF3F4849),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onSubTabChanged(1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: activeSubTab == 1
                              ? FaumaColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Mitos',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: activeSubTab == 1
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: activeSubTab == 1
                            ? FaumaColors.primary
                            : const Color(0xFF3F4849),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Content
        Expanded(
          child: activeSubTab == 0
              ? _SabiasQueList()
              : _MitosList(),
        ),
      ],
    );
  }
}

class _SabiasQueList extends StatelessWidget {
  static const _facts = [
    'Las cr\u00EDas reci\u00E9n nacidas raspan la c\u00E1psula del huevo con dent\u00EDculos especiales para salir',
    'Los machos realizan migraciones m\u00E1s largas que las hembras',
    'Sus dientes son sexualmente dim\u00F3rficos: los machos tienen dientes m\u00E1s puntiagudos',
    'Las hembras tienen piel m\u00E1s gruesa como armadura contra las mordeduras de cortejo',
    'Pueden almacenar esperma durante meses antes de fertilizar los huevos',
    'Su dieta cambia radicalmente del juvenil al adulto',
    'Es una de las especies modelo m\u00E1s usadas en investigaci\u00F3n marina',
    'Los ejemplares atl\u00E1nticos son m\u00E1s grandes que los mediterr\u00E1neos',
    'Los embriones pueden detener su desarrollo con temperaturas fr\u00EDas',
    'Cada huevo es un micro-ecosistema con bacterias simbiontes',
    'La reserva de vitelo alimenta al embri\u00F3n durante meses',
    'Usan una enzima especial para disolver la c\u00E1psula al eclosionar',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      itemCount: _facts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        // Special card for #7
        if (index == 6) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: FaumaColors.primaryContainer,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${index + 1}',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 12),
                Text(_facts[index],
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.3)),
                const SizedBox(height: 12),
                Container(
                  height: 4,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB4AC),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          );
        }

        final hasImage = index < 3 && index < _curiosidadImages.length;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: FaumaColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('${index + 1}',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(_facts[index],
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.3)),
              ),
              if (hasImage) ...[
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: FaumaImage(
                        imageUrl: _curiosidadImages[index],
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _MitosList extends StatelessWidget {
  static const _myths = [
    {
      'myth': 'Las pintarrojas son peligrosas para los humanos',
      'truth':
          'Son inofensivas. Su peque\u00F1o tama\u00F1o y h\u00E1bitos nocturnos hacen que rara vez interact\u00FAen con personas.',
    },
    {
      'myth': 'Los tiburones peque\u00F1os no tienen importancia ecol\u00F3gica',
      'truth':
          'Son depredadores clave que regulan las poblaciones de invertebrados en los fondos marinos.',
    },
    {
      'myth': 'Los huevos de tibur\u00F3n son fr\u00E1giles',
      'truth':
          'Las c\u00E1psulas son extremadamente resistentes, dise\u00F1adas para soportar corrientes fuertes y depredadores.',
    },
    {
      'myth': 'No merece la pena conservar especies tan comunes',
      'truth':
          'Las poblaciones locales pueden colapsarse r\u00E1pidamente. La conservaci\u00F3n preventiva es mucho m\u00E1s eficaz que la reactiva.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      itemCount: _myths.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final myth = _myths[index];
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.cancel,
                      color: FaumaColors.tertiary, size: 20),
                  const SizedBox(width: 8),
                  Text('MITO',
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.tertiary,
                          letterSpacing: 1.5)),
                ],
              ),
              const SizedBox(height: 8),
              Text(myth['myth']!,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.check_circle,
                      color: FaumaColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text('REALIDAD',
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.primary,
                          letterSpacing: 1.5)),
                ],
              ),
              const SizedBox(height: 8),
              Text(myth['truth']!,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF3F4849),
                      height: 1.5)),
            ],
          ),
        );
      },
    );
  }
}
