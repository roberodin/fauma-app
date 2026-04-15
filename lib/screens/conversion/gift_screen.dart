import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  String _selectedCountry = 'Espana';
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
                  horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: cs.surface,
                border: Border(
                  bottom: BorderSide(
                    color: cs.surfaceContainerLow.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Icon(Icons.arrow_back,
                          color: cs.primaryContainer),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Configurar Regalo',
                      style: GoogleFonts.newsreader(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: cs.onSurface,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  Icon(Icons.redeem, color: cs.primaryContainer),
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
                  // ── Selected Item Card ──────────────────────
                  _buildSelectedItemCard(cs),
                  const SizedBox(height: 40),

                  // ── Recipient Section ───────────────────────
                  Text(
                    '\u00BFPara quien es?',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre del destinatario',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email del destinatario',
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Delivery Section ────────────────────────
                  Text(
                    'ENVIO DEL MERCHANDISING',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: cs.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Direccion completa',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Ciudad',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Codigo Postal',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCountry,
                        isExpanded: true,
                        icon: Icon(Icons.expand_more,
                            color: cs.outline),
                        items: ['Espana', 'Portugal', 'Francia', 'Italia']
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(
                            () => _selectedCountry = val ?? _selectedCountry),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Personal Message Section ────────────────
                  Text(
                    'Dedicatoria',
                    style: GoogleFonts.newsreader(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
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
                          decoration: InputDecoration(
                            hintText:
                                'Escribe un mensaje personal para acompanar el regalo...',
                            border: InputBorder.none,
                            filled: false,
                            contentPadding:
                                const EdgeInsets.all(24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, bottom: 8),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '$_messageLength/200',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: cs.secondary
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ── Delivery Date Section ───────────────────
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow
                          .withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u00BFCUANDO ENVIAR?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: cs.secondary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Seleccionar fecha',
                            suffixIcon: Icon(Icons.calendar_today,
                                color: cs.outline),
                            fillColor: cs.surfaceContainerLowest,
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
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enviar ahora',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: cs.onSurface,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(
                                  () => _sendNow = !_sendNow),
                              child: AnimatedContainer(
                                duration: const Duration(
                                    milliseconds: 200),
                                width: 48,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(999),
                                  color: _sendNow
                                      ? cs.primary
                                      : cs.surfaceContainerHighest,
                                ),
                                child: AnimatedAlign(
                                  duration: const Duration(
                                      milliseconds: 200),
                                  alignment: _sendNow
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    margin:
                                        const EdgeInsets.symmetric(
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
                  const SizedBox(height: 40),

                  // ── Preview Card ────────────────────────────
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'VISTA PREVIA DE LA TARJETA',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: cs.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildPreviewCard(cs),
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
          color: cs.surface.withValues(alpha: 0.8),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                cs.primary,
                cs.primaryContainer,
              ],
            ),
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: cs.primary.withValues(alpha: 0.2),
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
                    const Icon(Icons.arrow_forward,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Selected Item Card ────────────────────────────────────────
  Widget _buildSelectedItemCard(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: cs.surface, width: 4),
              boxShadow: [
                BoxShadow(
                  color: cs.onSurface.withValues(alpha: 0.05),
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
                  'SUSCRIPCION ACTIVA',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: cs.secondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tortuga Caretta caretta',
                  style: GoogleFonts.newsreader(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nivel: Hermano \u00B7 \u20AC15/mes',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.card_giftcard,
                          size: 14, color: cs.primary),
                      const SizedBox(width: 4),
                      Text(
                        'Incluye peluche',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: cs.primary,
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

  // ── Preview Card ──────────────────────────────────────────────
  Widget _buildPreviewCard(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: cs.onSurface.withValues(alpha: 0.06),
            blurRadius: 40,
            offset: const Offset(0, 40),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text('\uD83C\uDF81', style: TextStyle(fontSize: 36)),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.newsreader(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: cs.onSurface,
                height: 1.5,
              ),
              children: [
                const TextSpan(
                    text: 'Maria te ha regalado la proteccion de una '),
                TextSpan(
                  text: 'Tortuga Caretta caretta',
                  style: GoogleFonts.newsreader(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: cs.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 48,
            height: 1,
            color: cs.surfaceContainerHighest,
          ),
          const SizedBox(height: 16),
          Text(
            '\u201C\u00A1Espero que te guste este pequeno gesto por el planeta!\u201D',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: cs.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
