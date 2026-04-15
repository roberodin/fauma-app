import 'package:fauma_app/theme/colors.dart';
import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
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
  String _selectedCountry = 'Espa\u00F1a \uD83C\uDDEA\uD83C\uDDF8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: Column(
        children: [
          // ── Top App Bar ─────────────────────────────────────────
          SafeArea(
            bottom: false,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: FaumaColors.surface,
                border: Border(
                  bottom: BorderSide(
                    color: FaumaColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    icon: const Icon(Icons.arrow_back,
                        color: FaumaColors.primaryContainer),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Shipping Address',
                    style: GoogleFonts.newsreader(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primaryContainer,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),

          // ── Scrollable Body ─────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Progress Indicator ──────────────────────────
                  _buildProgressIndicator(),
                  const SizedBox(height: 32),

                  // ── Order Summary Card ─────────────────────────
                  _buildOrderSummary(),
                  const SizedBox(height: 32),

                  // ── Form Fields ────────────────────────────────
                  _buildLabel('Nombre completo'),
                  _buildTextField('Tu nombre y apellidos'),
                  const SizedBox(height: 16),

                  _buildLabel('Direcci\u00F3n (calle y n\u00FAmero)'),
                  _buildTextField('Ej. Calle Mayor 123'),
                  const SizedBox(height: 16),

                  _buildLabel('Piso / Puerta (opcional)'),
                  _buildTextField('2\u00BA B, \u00C1tico...'),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('C\u00F3digo postal'),
                            _buildTextField('28001'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Ciudad'),
                            _buildTextField('Madrid'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildLabel('Provincia'),
                  _buildDropdown(
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

                  _buildLabel('Pa\u00EDs'),
                  _buildDropdown(
                    _selectedCountry,
                    [
                      'Espa\u00F1a \uD83C\uDDEA\uD83C\uDDF8',
                      'Portugal \uD83C\uDDF5\uD83C\uDDF9',
                      'Francia \uD83C\uDDEB\uD83C\uDDF7',
                    ],
                    (val) => setState(
                        () => _selectedCountry = val ?? _selectedCountry),
                  ),
                  const SizedBox(height: 16),

                  _buildLabel('Tel\u00E9fono de contacto'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '+34 600 000 000',
                      prefixIcon: const Icon(Icons.phone_iphone,
                          color: FaumaColors.secondary),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Delivery Info Card ─────────────────────────
                  _buildDeliveryInfo(),
                  const SizedBox(height: 24),

                  // ── Save Address Toggle ────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Guardar como direcci\u00F3n principal',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: FaumaColors.secondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _saveAddress = !_saveAddress),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 44,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: _saveAddress
                                  ? FaumaColors.primaryContainer
                                  : FaumaColors.outlineVariant,
                            ),
                            child: AnimatedAlign(
                              duration: const Duration(milliseconds: 200),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Sticky CTA ─────────────────────────────────────────────
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              FaumaColors.surface.withValues(alpha: 0),
              FaumaColors.surface,
              FaumaColors.surface,
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.go('/conversion/gift'),
            style: ElevatedButton.styleFrom(
              backgroundColor: FaumaColors.tertiaryContainer,
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

  // ── Progress Indicator ──────────────────────────────────────────
  Widget _buildProgressIndicator() {
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
              color: const Color(0xFFE8E1DC), // surface-variant
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Step 1 - Done
              _progressStep(Icons.check, 'Nivel',
                  isActive: false, isDone: true),
              // Step 2 - Active
              _progressStep(Icons.local_shipping, 'Env\u00EDo',
                  isActive: true),
              // Step 3 - Pending
              _progressStep(Icons.payments, 'Pago', isActive: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressStep(IconData icon, String label,
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
                ? FaumaColors.primaryContainer
                : const Color(0xFFE8E1DC), // surface-variant
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: FaumaColors.primary.withValues(alpha: 0.1),
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
                : FaumaColors.secondary,
            size: isActive ? 24 : 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? FaumaColors.primary : FaumaColors.secondary,
          ),
        ),
      ],
    );
  }

  // ── Order Summary Card ──────────────────────────────────────────
  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8E1DC).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: FaumaColors.primary.withValues(alpha: 0.1),
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
                    color: FaumaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\u20AC15',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: FaumaColors.secondary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: FaumaColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Incluye regalo\uD83D\uDC22',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: FaumaColors.primary,
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

  // ── Delivery Info Card ──────────────────────────────────────────
  Widget _buildDeliveryInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE8E1DC).withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: FaumaColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.inventory_2, color: FaumaColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: FaumaColors.secondary,
                    ),
                    children: [
                      const TextSpan(text: 'Env\u00EDo estimado: '),
                      TextSpan(
                        text: '7-10 d\u00EDas laborables',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: FaumaColors.onSurface,
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
              color: FaumaColors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.verified,
                    color: FaumaColors.primary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Env\u00EDo gratuito incluido en tu suscripci\u00F3n',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: FaumaColors.primary,
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

  // ── Helpers ─────────────────────────────────────────────────────
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: FaumaColors.secondary,
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
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: FaumaColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 4,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: FaumaColors.secondary),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: FaumaColors.onSurface,
          ),
        ),
      ),
    );
  }
}
