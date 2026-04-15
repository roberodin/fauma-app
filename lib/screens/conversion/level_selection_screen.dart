import 'package:fauma_app/theme/colors.dart';
import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

/// Image URLs extracted from 09-nivel-merch.html
const _kTurtleAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuARLZROPjEPO6XLDXNFWDT8g6NFSSJQ0cG27K5yu9INVbZdGqOWCTqQwyzTqwd7D9sT6H1f0dtgVi9dIzxvjO63FwWaYuho5cM9fap39rXu4XbNGU9Vn6X-l_d-Q1CK3fnxDWVjx15efF_gh6nvZGI1-bGpCJ4NSbyJRHKMbD0Y2bhkHu1EFLq4GnV2KefKnd1A0CQMh7Ux78hw6cMZIQjEAm8ENK-GtkycfI5nYWTNLFm9tovZ5gqHMpwqjTy7YESeBH7FG3gqvpTT';
const _kPlushToy =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCon1CWqpgyTVYwE-fD96ojF-rxMqIUG1gQ12oXZec4YAXVSVNyxJywMAvpYBvXkvg4KSS3uZXqQ9QNqJC__7sLRcw4KX7QzoTTd58yxbL8AsM46tohtY6BMpr9p8e_rJkfw1wgdIhDWTXSTuEoFxmNzJVPg5f9aXFCdS0AQkxiMkGX0gEeMPRSBlsXHEDkUR8GVbF2mEv66Q5CAW2j6XOCRhWh9qGEduNyewXuNYQx2vy32j70cNnZn_RJBlotQE_nIzPs59HU-y8S';
const _kPlushSmall =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD9i7NJeznzWm84Za8p1kDIiOct_C8dOO_jWqlZRGHEHoTVwVHP61J1DYY5O7T0t_ZS73WWqwHS3vV9nK_IUSPulDX1SYsjfq5rQt5NXSXQcg0CIobLlHDM2x2u8GE1UIKdXAUQrugmse4AfAtZL7NZgmfyHB_0S-3IMmgmysuvnpoY4jE8GHhdLOTZPzN8uHG_cqFRXZdmJ6QmxAWy9zAQdKQUa3WqncFMSI_CBfbngkwXdMwzqgCLOAx9cSSUJ2dQofTIWhKQM98N';
const _kTshirt =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC0XXRQHbuJM7Pl2NqjQdwafzJjWMzVamL26f9vhFMSWwy5PGKO970ip1ogQFHZgnLWpqunlgbh08Cpgl8H_OeXi24eqB-FgVan12G6b4mWVfKI_-POM-1nmrVmcI7gQ5hZu-1URbgUzMmWAGDPo7QVoC4AIye09DobpnOxXxa0OO91ektFof2SSG905q_gY5VkRV3_vd4FC4Ygfq5a5oJpdmQJM5GwHI1vdKe8xecZlTf6KO3YNAOkO4t1n-J0nXw2qvPyaU_5ZXVU';

class LevelSelectionScreen extends StatefulWidget {
  const LevelSelectionScreen({super.key, required this.id});

  final String id;

  @override
  State<LevelSelectionScreen> createState() => _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends State<LevelSelectionScreen> {
  int _selectedTier = 1; // 0=Amigo, 1=Hermano, 2=Heroe
  bool _isGift = false;

  String get _selectedLabel {
    switch (_selectedTier) {
      case 0:
        return 'Amigo';
      case 1:
        return 'Hermano';
      case 2:
        return 'H\u00E9roe';
      default:
        return '';
    }
  }

  String get _selectedPrice {
    switch (_selectedTier) {
      case 0:
        return '\u20AC5';
      case 1:
        return '\u20AC15';
      case 2:
        return '\u20AC25';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: Column(
        children: [
          // ── Top App Bar (sticky header) ────────────────────────────
          SafeArea(
            bottom: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.arrow_back,
                        color: FaumaColors.primaryContainer),
                  ),
                  const Spacer(),
                  Text(
                    'Nivel de Apoyo',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.primaryContainer,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 24),
                ],
              ),
            ),
          ),

          // ── Scrollable Body ───────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 160),
              child: Column(
                children: [
                  // ── Hero section ──────────────────────────────────
                  Text(
                    'Elige tu nivel',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.newsreader(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Scientific plate pill ─────────────────────────
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: FaumaColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: FaumaColors.primary.withValues(alpha: 0.05),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: FaumaColors.surface, width: 2),
                          ),
                          child: ClipOval(
                            child: FaumaImage(
                              imageUrl: _kTurtleAvatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ESPECIE PROTEGIDA',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                    color: FaumaColors.secondary,
                                  ),
                                ),
                                Text(
                                  'Tortuga Caretta caretta',
                                  style: GoogleFonts.newsreader(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    height: 1.2,
                                    color: FaumaColors.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Tier Cards ────────────────────────────────────
                  _buildAmigoCard(),
                  const SizedBox(height: 24),
                  _buildHermanoCard(),
                  const SizedBox(height: 24),
                  _buildHeroeCard(),
                  const SizedBox(height: 48),

                  // ── Gift Toggle ───────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE7E1), // surface-container-high
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.card_giftcard,
                            color: FaumaColors.primary),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            '\u00BFEs un regalo para alguien?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: FaumaColors.onSurface,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _isGift = !_isGift),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 48,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: _isGift
                                  ? FaumaColors.primaryContainer
                                  : FaumaColors.outlineVariant,
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
                              alignment: _isGift
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                width: 16,
                                height: 16,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Bottom Action Bar ─────────────────────────────────────────
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: FaumaColors.surface.withValues(alpha: 0.8),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
          border: Border(
            top: BorderSide(
                color: FaumaColors.primaryContainer.withValues(alpha: 0.1)),
          ),
          boxShadow: [
            BoxShadow(
              color: FaumaColors.onSurface.withValues(alpha: 0.06),
              blurRadius: 40,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RESUMEN',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: FaumaColors.secondary,
                    ),
                  ),
                  Text(
                    '$_selectedLabel \u00B7 $_selectedPrice',
                    style: GoogleFonts.newsreader(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.primary,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.go('/conversion/shipping'),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: FaumaColors.coralCta,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(
                      color: FaumaColors.coralCta.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Finalizar pedido',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward,
                        size: 20, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Amigo Tier Card ───────────────────────────────────────────────
  Widget _buildAmigoCard() {
    final isSelected = _selectedTier == 0;
    return GestureDetector(
      onTap: () => setState(() => _selectedTier = 0),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: FaumaColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border(
                  left:
                      const BorderSide(color: FaumaColors.primary, width: 8),
                  top: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                  right: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                  bottom: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                )
              : Border.all(color: Colors.transparent),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: FaumaColors.onSurface.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amigo',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\u20AC5',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isSelected
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isSelected
                      ? FaumaColors.primary
                      : FaumaColors.outlineVariant,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _featureRow(Icons.check_circle, 'Fotos mensuales'),
            const SizedBox(height: 12),
            _featureRow(Icons.check_circle, 'Ficha t\u00E9cnica interactiva'),
            const SizedBox(height: 12),
            _featureRow(
                Icons.check_circle, 'Curiosidades y Ciclo estacional'),
          ],
        ),
      ),
    );
  }

  // ── Hermano Tier Card ─────────────────────────────────────────────
  Widget _buildHermanoCard() {
    final isSelected = _selectedTier == 1;
    return GestureDetector(
      onTap: () => setState(() => _selectedTier = 1),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: FaumaColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border(
                left:
                    const BorderSide(color: FaumaColors.primary, width: 8),
                top: BorderSide(
                    color: FaumaColors.primary.withValues(alpha: 0.1)),
                right: BorderSide(
                    color: FaumaColors.primary.withValues(alpha: 0.1)),
                bottom: BorderSide(
                    color: FaumaColors.primary.withValues(alpha: 0.1)),
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: FaumaColors.onSurface.withValues(alpha: 0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hermano',
                          style: GoogleFonts.newsreader(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\u20AC15',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: FaumaColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color:
                          isSelected ? FaumaColors.primary : FaumaColors.outlineVariant,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _featureRow(Icons.add_circle, 'Todo de Amigo', bold: true),
                const SizedBox(height: 12),
                _featureRow(
                    Icons.check_circle, 'V\u00EDdeos exclusivos y Galer\u00EDa HD'),
                const SizedBox(height: 12),
                _featureRow(
                    Icons.check_circle, 'Datos cient\u00EDficos y Diario de salud'),
                const SizedBox(height: 32),

                // Merch section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: FaumaColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FaumaColors.primary.withValues(alpha: 0.05),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FaumaImage(
                          imageUrl: _kPlushToy,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\uD83C\uDF81 INCLUYE DE REGALO',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: FaumaColors.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Merchan 1',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: FaumaColors.onSurface,
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
          // "MAS POPULAR" badge
          Positioned(
            top: -12,
            right: 32,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: FaumaColors.coralCta,
                borderRadius: BorderRadius.circular(999),
                boxShadow: [
                  BoxShadow(
                    color: FaumaColors.coralCta.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'M\u00C1S POPULAR',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Heroe Tier Card ───────────────────────────────────────────────
  Widget _buildHeroeCard() {
    final isSelected = _selectedTier == 2;
    return GestureDetector(
      onTap: () => setState(() => _selectedTier = 2),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: FaumaColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border(
                  left:
                      const BorderSide(color: FaumaColors.primary, width: 8),
                  top: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                  right: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                  bottom: BorderSide(
                      color: FaumaColors.primary.withValues(alpha: 0.1)),
                )
              : Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: FaumaColors.coralCta.withValues(alpha: 0.15),
              blurRadius: 40,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'H\u00E9roe',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\u20AC25',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isSelected
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isSelected
                      ? FaumaColors.primary
                      : FaumaColors.outlineVariant,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _featureRow(Icons.add_circle, 'Todo de Hermano', bold: true),
            const SizedBox(height: 12),
            _featureRow(
                Icons.check_circle, 'Q&A con cient\u00EDficos y bi\u00F3logos'),
            const SizedBox(height: 12),
            _featureRow(Icons.check_circle, 'C\u00E1mara en directo 24/7'),
            const SizedBox(height: 12),
            _featureRow(
                Icons.check_circle, 'Tu nombre en el Muro de H\u00E9roes'),
            const SizedBox(height: 32),

            // Merch section multi
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: FaumaColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: FaumaColors.primary.withValues(alpha: 0.05),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\uD83C\uDF81 PACK DE BIENVENIDA H\u00C9ROE',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: FaumaColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _merchThumb(_kPlushSmall),
                      const SizedBox(width: 12),
                      _merchThumb(_kTshirt),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Merchan 1',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: FaumaColors.onSurface,
                            ),
                          ),
                          Text(
                            'Merchan 2',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: FaumaColors.onSurface,
                            ),
                          ),
                        ],
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

  Widget _merchThumb(String url) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FaumaImage(imageUrl: url, fit: BoxFit.contain),
    );
  }

  Widget _featureRow(IconData icon, String text, {bool bold = false}) {
    return Row(
      children: [
        Icon(icon, color: FaumaColors.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
              color: bold
                  ? FaumaColors.onSurface
                  : FaumaColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
