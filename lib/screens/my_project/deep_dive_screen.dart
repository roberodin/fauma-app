import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class DeepDiveScreen extends StatelessWidget {
  const DeepDiveScreen({super.key, required this.projectId});

  final String projectId;

  static const _editorialImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAjFDEkXkfNsrpT5HsFc0VswBbDfs4uH4zbwzFOdm7dUf6NJ75mub5_dkMwb0VBHmvBBOefiQ1eet5c8rRlWnBSNnFgKPhU78xxyj7KmGy3NfK9YsWaEhdkLwta1DV2VIEfgRnCXuPuhbikmSFFIT4MCg1iEh0N7xbuG4QKJsm3nkGhX2UqbO1A1MVFZOtVU1IqJ33Z6C1Ura6v0W7diZznv450cvOuSts9Qsh8M4ADXFBm0H6DvM54nHqgBYEREHNS4_1XgtGYn-n2';
  static const _mapImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuC4SSPRSKwyEJHhYsXOjQiKqEuVRa0_4O3bslV5UIBdlTB7QWNkvE44kYAJrjP_SZhDHe9-90HVBPPgbPSh-omAYp0IdcPfq8RnNtweYbqBrDOP3MCIMZ99KPNNRMp5v1nNJBQiTZ-z7rNJEcQzvnO7DPCjqQIfdKhbJ2f9UkLrf-Mf3_MbDFoTytYE2hroRaZMVP6bFzew_gIOtcTlmSI7nEzeoBavJbfEWFQzMc43TdM6dzWTHAIm-91hAh9r8nutxwgD0WEdVLUa';
  static const _microscopeImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD0sIPR4E8nIwDZoY-6_XJWsmBZoELHz6amuac6H-VNuP68KUggUen3sCaF0EqNIng53jOE_V5hPDEN9oWeqvDNVJQWyj91xnAEVqk7m1pdQU5FWTgG2O-D3MdkaB3iUg8FMUKSAK3Ip6n8NfMiM3ZqoAXfLHdc4B70OJxxTrbh0neHDY5-HRYsZAbKEFlkGNMuY_-zC0CX0uRGjMSlKws1QARXk6iJPHrZsdIqTu1lccyWG6tv50xsSoA6i5Rj_1sFZDrhQeCCJCXn';
  static const _incubatorImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDsMPYjYgydSkMgTwm4BCUWJPMcUSmxASWmHor9u5LWYuX0eSLiWjoE_Wg5tZaeWz7O-B59pdDaUg_7GAvKgMneHwozEbqaVxp7SRMIFFCYQRvUX0v9qSQvD9YGiVjQ3l7DiORZNVKtqUytWVdvjrATU5VfAf7BdpVnCXjDJyTyLETNaNaoDWR3VVeMAG7Oc41CwZNQwEHhjh6tqf5GRpdl-elG-YgLzBhQTNaMg-zaqCyLWJSe3AGjpK7WYqCwgj7tllIzFGeI0bLq';
  static const _cameraImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB_EfYSg0TYvL652h6Et1l6lb0OQ8XnnPqHWjVcF28OI6yq5FY4iXkGPhj1Pl8KRbDMREaNqiZf5ZXYcSdWksC5fN4G8chBk-9S1KddRpe1PHzqunxEAm8dMaFeSA-_GgG2NVxz1iEtn6z-UeHsP-F7bcVOj9G7y_h-9w-mvpZ3W_uPRpnlGmN4MCtHXHSgvi9rH4ynH__nwjFSiPVj3WnuRUWwQVbj_6RQjIaY6GcTY1xqaUHA33SqunFof7fpxKYc0jaUkQkUg3E0';
  static const _geneticKitImage =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuC0zsqQdApN9NE22PBoAybHsOYntVfZfbSn_HeEdEpqqquvIisDsKv8jni0gw51mdprYN7phkXJE4syPUkskOtWdJXy-I9AuocXr_Ug4JB_v-4heA2zJvhQHEL-0qNjhgw7ZL1Jqv-y0sXT8byuWxI_LC5Xw6RrarOpNYJ3Kn7NMXLsHyyNevJ_cBC097bLGFk9i9Op1KviQQbDVcaMn7TNSofeaLPs6H5o2tJLxGjajvs9WQVVGqEVFavaPu0jbbIb4JXyANFzWtXj';

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
              'Profundizando',
              style: GoogleFonts.newsreader(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: cs.primaryContainer,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu, color: cs.primaryContainer),
                onPressed: () {},
              ),
            ],
          ),

          // -- Editorial Section --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: FaumaImage(
                        imageUrl: _editorialImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'El estudio del Scyliorhinus canicula, comunmente conocido como pintarroja, representa un pilar fundamental en la comprension de los ecosistemas marinos del Mediterraneo. Este pequeno escualo, caracterizado por su piel moteada y su resistencia, es el protagonista de nuestra investigacion actual en las costas levantinas.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: cs.onSurfaceVariant,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nuestra metodologia combina el marcaje tradicional con analisis geneticos de vanguardia para trazar las rutas migratorias y los patrones de cria de esta especie vital para el equilibrio oceanico.',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: cs.onSurfaceVariant,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Map Section --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: cs.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Ubicacion del Proyecto',
                        style: GoogleFonts.newsreader(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: cs.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 256,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          FaumaImage(
                            imageUrl: _mapImage,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE0F2F1),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: cs.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.apartment,
                                        color: cs.onPrimary, size: 18),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Acuario Valencia',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: cs.primary,
                                        ),
                                      ),
                                      Text(
                                        'Centro de Investigacion Marina',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -- Equipment Grid --
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Material y equipamiento',
                        style: GoogleFonts.newsreader(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: cs.primary,
                        ),
                      ),
                      Text(
                        '4 Elementos',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: cs.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    children: [
                      _EquipmentCard(
                          imageUrl: _microscopeImage, label: 'Microscopio'),
                      _EquipmentCard(
                          imageUrl: _incubatorImage, label: 'Incubadoras'),
                      _EquipmentCard(
                          imageUrl: _cameraImage, label: 'Camaras'),
                      _EquipmentCard(
                          imageUrl: _geneticKitImage, label: 'Kit Genetico'),
                    ],
                  ),
                ],
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
class _EquipmentCard extends StatelessWidget {
  const _EquipmentCard({required this.imageUrl, required this.label});
  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E1DC)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FaumaImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: cs.primary,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
