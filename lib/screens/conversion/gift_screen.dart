import 'package:fauma_app/theme/colors.dart';
import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

/// Image URL extracted from 11-regalo.html
const _kTurtleGift =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBEdJlNH8rxwQA-q_7SBh5oi70yysyPwq-k2T3gsmwJvPD5Mj7fdld90RYRN3d8FNTFEZGK5Uh3ZzleIUbsTWys6Ge0mXHEOzaytVIknhuKxaZxZueUuGEhpbkL1aLNf-evX5b491-xVh9ww3mQ-hjLZzb6OqBUMT8e5a_2As7C1lgqsOJ3RNe-miaCO74DtoMdktlPBuHpwEQFzYhqn_ORPegibrYnIS90XRCXXvaXiC9ZNdJVn_xHVXOCv2UsxaM-uLkj9S1FCQUL';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  bool _sendNow = true;
  int _messageLength = 0;
  String _selectedCountry = 'Espa\u00F1a';
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() => _messageLength = _messageController.text.length);
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: FaumaColors.surface,
                border: Border(
                  bottom: BorderSide(
                    color: FaumaColors.surfaceContainerLow
                        .withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: FaumaColors.primaryContainer),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Configurar Regalo',
                      style: GoogleFonts.newsreader(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.onSurface,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  const Icon(Icons.redeem, color: FaumaColors.primaryContainer),
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
                  // ── Selected Item Card ──────────────────────────
                  _buildSelectedItemCard(),
                  const SizedBox(height: 40),

                  // ── Recipient Section ──────────────────────────
                  Text(
                    '\u00BFPara qui\u00E9n es?',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombre del destinatario',
                      filled: true,
                      fillColor: FaumaColors.surfaceContainerLow,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email del destinatario',
                      filled: true,
                      fillColor: FaumaColors.surfaceContainerLow,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Delivery Section ───────────────────────────
                  Text(
                    'ENV\u00CDO DEL MERCHANDISING',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: FaumaColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Direcci\u00F3n completa',
                      filled: true,
                      fillColor: FaumaColors.surfaceContainerLow,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ciudad',
                            filled: true,
                            fillColor: FaumaColors.surfaceContainerLow,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(999),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'C\u00F3digo Postal',
                            filled: true,
                            fillColor: FaumaColors.surfaceContainerLow,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(999),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: FaumaColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCountry,
                        isExpanded: true,
                        icon: const Icon(Icons.expand_more,
                            color: Color(0xFF6F797A)), // outline
                        items: [
                          'Espa\u00F1a',
                          'Portugal',
                          'Francia',
                          'Italia',
                        ]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(
                            () => _selectedCountry = val ?? _selectedCountry),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: FaumaColors.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Personal Message Section ───────────────────
                  Text(
                    'Dedicatoria',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: FaumaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: FaumaColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _messageController,
                          maxLines: 4,
                          maxLength: 200,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  required maxLength}) =>
                              null,
                          decoration: const InputDecoration(
                            hintText:
                                'Escribe un mensaje personal para acompa\u00F1ar el regalo...',
                            border: InputBorder.none,
                            filled: false,
                            contentPadding: EdgeInsets.all(24),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16, bottom: 8),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '$_messageLength/200',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: FaumaColors.secondary
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Delivery Date Section ──────────────────────
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: FaumaColors.surfaceContainerLow
                          .withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u00BFCU\u00C1NDO ENVIAR?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: FaumaColors.secondary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Seleccionar fecha',
                            suffixIcon: const Icon(Icons.calendar_today,
                                color: Color(0xFF6F797A)),
                            fillColor: FaumaColors.surfaceContainerLowest,
                          ),
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 365)),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enviar ahora',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: FaumaColors.onSurface,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    setState(() => _sendNow = !_sendNow),
                                child: AnimatedContainer(
                                  duration:
                                      const Duration(milliseconds: 200),
                                  width: 48,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(999),
                                    color: _sendNow
                                        ? FaumaColors.primary
                                        : const Color(0xFFE8E1DC), // surface-container-highest
                                  ),
                                  child: AnimatedAlign(
                                    duration:
                                        const Duration(milliseconds: 200),
                                    alignment: _sendNow
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
                  const SizedBox(height: 40),

                  // ── Preview Card ───────────────────────────────
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'VISTA PREVIA DE LA TARJETA',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: FaumaColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildPreviewCard(),
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
          color: FaumaColors.surface.withValues(alpha: 0.8),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                FaumaColors.primary,
                FaumaColors.primaryContainer,
              ],
            ),
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: FaumaColors.primary.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.go('/conversion/payment'),
              borderRadius: BorderRadius.circular(999),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continuar al pago',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Selected Item Card ──────────────────────────────────────────
  Widget _buildSelectedItemCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: FaumaColors.surface, width: 4),
              boxShadow: [
                BoxShadow(
                  color: FaumaColors.onSurface.withValues(alpha: 0.05),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ClipOval(
              child: FaumaImage(
                imageUrl: _kTurtleGift,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUSCRIPCI\u00D3N ACTIVA',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: FaumaColors.secondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tortuga Caretta caretta',
                  style: GoogleFonts.newsreader(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: FaumaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nivel: Hermano \u00B7 \u20AC15',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: FaumaColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E1DC), // surface-container-highest
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.card_giftcard,
                          size: 14, color: FaumaColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        'Incluye peluche',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: FaumaColors.primary,
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
    );
  }

  // ── Preview Card ────────────────────────────────────────────────
  Widget _buildPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: FaumaColors.outlineVariant.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: FaumaColors.onSurface.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 40),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative blob
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: FaumaColors.primary.withValues(alpha: 0.05),
              ),
            ),
          ),
          Column(
            children: [
              const Text('\uD83C\uDF81', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: FaumaColors.onSurface,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                        text:
                            'Mar\u00EDa te ha regalado la protecci\u00F3n de una '),
                    TextSpan(
                      text: 'Tortuga Caretta caretta',
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: FaumaColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 48,
                height: 1,
                color: const Color(0xFFE8E1DC), // surface-container-highest
              ),
              const SizedBox(height: 16),
              Text(
                '\u201C\u00A1Espero que te guste este peque\u00F1o gesto por el planeta!\u201D',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: FaumaColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
