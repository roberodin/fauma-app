import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

/// Image URL extracted from 10-direccion-envio.html
const _kTurtlePortrait =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCfrFXxwMFxj8_flVu70NnLO2eP0hT0sSOMlFouNrWXjyS8ax0HaGdBMcM2zdQbOOTE7FRpSPW4yU5txH1nCSgl5KcPepjCEn1cWInHJITaHsCx90m1RIV_agGXZERi-g4H2qJ1-9UAGxlUeHyn9n7lIb-qzlyhvJnvq-eciLRf-gP4Pm9_rJ8BncUpTSxO9ODH5ntjTJ8CMq5dAdchxQMnNdQ81asTBfQM7IGq3N8b6qYyU6W1BISC-ezPjuiiIndJZzp6aXtBbYWa';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool _saveAddress = true;
  String _selectedProvince = 'Selecciona una provincia';
  String _selectedCountry = 'Espana';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Column(
        children: [
          // ── Top App Bar ─────────────────────────────────────
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: cs.surface,
                border: Border(
                  bottom: BorderSide(
                    color: cs.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back,
                        color: cs.primaryContainer),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Shipping Address',
                    style: GoogleFonts.newsreader(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: cs.primaryContainer,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),

          // ── Scrollable Body ─────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Progress Indicator ──────────────────────
                  _buildProgressIndicator(cs),
                  const SizedBox(height: 32),

                  // ── Order Summary Card ─────────────────────
                  _buildOrderSummary(cs),
                  const SizedBox(height: 32),

                  // ── Form Fields ─────────────────────────────
                  _buildLabel(cs, 'Nombre completo'),
                  _buildTextField('Tu nombre y apellidos'),
                  const SizedBox(height: 16),

                  _buildLabel(cs, 'Direccion (calle y numero)'),
                  _buildTextField('Ej. Calle Mayor 123'),
                  const SizedBox(height: 16),

                  _buildLabel(cs, 'Piso / Puerta (opcional)'),
                  _buildTextField('2o B, Atico...'),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            _buildLabel(cs, 'Codigo postal'),
                            _buildTextField('28001'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            _buildLabel(cs, 'Ciudad'),
                            _buildTextField('Madrid'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildLabel(cs, 'Provincia'),
                  _buildDropdown(
                    cs,
                    _selectedProvince,
                    [
                      'Selecciona una provincia',
                      'Madrid',
                      'Barcelona',
                      'Valencia',
                      'Sevilla',
                    ],
                    (val) => setState(
                        () => _selectedProvince = val ?? _selectedProvince),
                  ),
                  const SizedBox(height: 16),

                  _buildLabel(cs, 'Pais'),
                  _buildDropdown(
                    cs,
                    _selectedCountry,
                    ['Espana', 'Portugal', 'Francia'],
                    (val) => setState(
                        () => _selectedCountry = val ?? _selectedCountry),
                  ),
                  const SizedBox(height: 16),

                  _buildLabel(cs, 'Telefono de contacto'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '+34 600 000 000',
                      prefixIcon: Icon(Icons.phone_iphone,
                          color: cs.secondary),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Delivery Info Card ─────────────────────
                  _buildDeliveryInfo(cs),
                  const SizedBox(height: 24),

                  // ── Save Address Toggle ────────────────────
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guardar como direccion principal',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: cs.secondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(
                            () => _saveAddress = !_saveAddress),
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 200),
                          width: 44,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(999),
                            color: _saveAddress
                                ? cs.primaryContainer
                                : cs.outlineVariant,
                          ),
                          child: AnimatedAlign(
                            duration:
                                const Duration(milliseconds: 200),
                            alignment: _saveAddress
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 16,
                              height: 16,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4),
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
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Sticky CTA ─────────────────────────────────────────
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              cs.surface.withValues(alpha: 0),
              cs.surface,
              cs.surface,
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.go('/conversion/gift'),
            style: ElevatedButton.styleFrom(
              backgroundColor: cs.tertiaryContainer,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              elevation: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continuar al pago',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Progress Indicator ────────────────────────────────────────
  Widget _buildProgressIndicator(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background line
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              color: cs.surfaceContainerHighest,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Step 1 - Done
              _progressStep(cs, Icons.check, 'Nivel',
                  isActive: false, isDone: true),
              // Step 2 - Active
              _progressStep(cs, Icons.local_shipping, 'Envio',
                  isActive: true),
              // Step 3 - Pending
              _progressStep(cs, Icons.payments, 'Pago',
                  isActive: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressStep(
      ColorScheme cs, IconData icon, String label,
      {bool isActive = false, bool isDone = false}) {
    final double size = isActive ? 40 : 32;
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isActive || isDone)
                ? cs.primaryContainer
                : cs.surfaceContainerHighest,
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: cs.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      spreadRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            color: (isActive || isDone)
                ? Colors.white
                : cs.secondary,
            size: isActive ? 24 : 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? cs.primary : cs.secondary,
          ),
        ),
      ],
    );
  }

  // ── Order Summary Card ────────────────────────────────────────
  Widget _buildOrderSummary(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cs.primary.withValues(alpha: 0.1),
            ),
            child: ClipOval(
              child: FaumaImage(
                imageUrl: _kTurtlePortrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tortuga Caretta \u00B7 Hermano',
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\u20AC15/mes',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cs.secondary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: cs.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Incluye regalo\uD83D\uDC22',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: cs.primary,
                        ),
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

  // ── Delivery Info Card ────────────────────────────────────────
  Widget _buildDeliveryInfo(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.surfaceContainerHighest.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: cs.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.inventory_2, color: cs.primary),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: cs.secondary,
                    ),
                    children: [
                      const TextSpan(text: 'Envio estimado: '),
                      TextSpan(
                        text: '7-10 dias laborables',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.verified, color: cs.primary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Envio gratuito incluido en tu suscripcion',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cs.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────
  Widget _buildLabel(ColorScheme cs, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: cs.secondary,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(hintText: hint),
    );
  }

  Widget _buildDropdown(
    ColorScheme cs,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: cs.onSurface.withValues(alpha: 0.04),
            blurRadius: 4,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.expand_more, color: cs.secondary),
          items: items
              .map((e) =>
                  DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: cs.onSurface,
          ),
        ),
      ),
    );
  }
}
