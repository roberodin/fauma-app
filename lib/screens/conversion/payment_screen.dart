import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

const _kCoral = Color(0xFFF4847A);

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top App Bar ─────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(Icons.arrow_back,
                            color: cs.onSurface),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Confirmar pago',
                        style: GoogleFonts.newsreader(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Order Summary Card ─────────────────────
                    _buildOrderSummary(cs),
                    const SizedBox(height: 32),

                    // ── Payment Method Section ─────────────────
                    Text(
                      'SELECCIONAR METODO DE PAGO',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: cs.secondary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Wallet options row
                    Row(
                      children: [
                        Expanded(
                          child: _walletButton(
                            cs,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(Icons.apple,
                                    color: cs.onSurface, size: 24),
                                const SizedBox(width: 4),
                                Text(
                                  'Pay',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: cs.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _walletButton(
                            cs,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata,
                                    color: cs.onSurface, size: 28),
                                Text(
                                  'Google Pay',
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

                    // PayPal button
                    _walletButton(
                      cs,
                      fullWidth: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance_wallet,
                              color: const Color(0xFF003087)),
                          const SizedBox(width: 8),
                          Text(
                            'PayPal',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF003087),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Credit card input
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Tarjeta de credito',
                        suffixIcon:
                            Icon(Icons.credit_card, color: cs.secondary),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Date and CVV
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'MM / AA',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'CVV',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // ── Primary CTA ────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            context.go('/conversion/success'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _kCoral,
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20),
                          elevation: 8,
                          shadowColor:
                              cs.onSurface.withValues(alpha: 0.05),
                        ),
                        child: Text(
                          'Confirmar pago \u00B7 \u20AC15',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Terms text
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32),
                        child: Text(
                          'Al confirmar, aceptas los terminos y condiciones',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: cs.outline,
                            height: 1.5,
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
    );
  }

  // ── Order Summary Card ────────────────────────────────────────
  Widget _buildOrderSummary(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge row
              Row(
                children: [
                  Icon(Icons.egg,
                      color: cs.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'APOYO UNICO',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: cs.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Tortuga Caretta caretta',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 24),

              // Level and price
              Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Nivel: Hermano',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cs.primary,
                      ),
                    ),
                  ),
                  Text(
                    '\u20AC15',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Gift info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLowest
                      .withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.redeem,
                        color: cs.secondary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Incluye regalo (Merchan 1)',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: cs.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Decorative blob
          Positioned(
            right: -32,
            bottom: -32,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cs.primary.withValues(alpha: 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Wallet Button ─────────────────────────────────────────────
  Widget _walletButton(ColorScheme cs,
      {required Widget child, bool fullWidth = false}) {
    return Container(
      width: fullWidth ? double.infinity : null,
      height: fullWidth ? 56 : 64,
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.transparent),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Center(child: child),
        ),
      ),
    );
  }
}
