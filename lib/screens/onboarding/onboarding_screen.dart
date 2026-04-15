import 'dart:math' as math;

import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// Design-system constants (matching Stitch HTML)
// ---------------------------------------------------------------------------
const _livingCoral = Color(0xFFF4847A);
const _surfaceColor = Color(0xFFFFF8F2);
const _onSurface = Color(0xFF1E1B18);
const _primaryColor = Color(0xFF005258);
const _primaryContainer = Color(0xFF1A6B72);
const _secondaryColor = Color(0xFF535F71);
const _outlineVariant = Color(0xFFBEC8C9);
const _outlineColor = Color(0xFF6F797A);
const _onSurfaceVariant = Color(0xFF3F484A);
const _surfaceContainerLow = Color(0xFFF9F2EC);
const _surfaceContainerHigh = Color(0xFFEEE7E1);
const _surfaceContainerLowest = Color(0xFFFFFFFF);
const _surfaceVariant = Color(0xFFE8E1DC);
const _tertiaryFixed = Color(0xFFFFDAD6);
const _tertiaryColor = Color(0xFF822D28);

// ---------------------------------------------------------------------------
// OnboardingScreen
// ---------------------------------------------------------------------------

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToLogin() => context.go('/login');

  void _nextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surfaceColor,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (i) => setState(() => _currentPage = i),
          children: [
            _Slide1(
              currentPage: _currentPage,
              onSkip: _goToLogin,
              onNext: _nextPage,
            ),
            _Slide2(
              currentPage: _currentPage,
              onSkip: _goToLogin,
              onNext: _nextPage,
              onBack: () => _controller.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              ),
            ),
            _Slide3(
              currentPage: _currentPage,
              onSkip: _goToLogin,
              onStart: _goToLogin,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SLIDE 1 -- Hero image with floating data plate
// ---------------------------------------------------------------------------

class _Slide1 extends StatelessWidget {
  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const _Slide1({
    required this.currentPage,
    required this.onSkip,
    required this.onNext,
  });

  static const _imageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDfSM1J6fyt7YYpMAlUmw-38KYOjtiWq3-QY15OBI24mEpQgm-Fgkmz7IWARSTTVS5HGfr3tFGDzRZ6ro_y4xzc6ZTNq31hzHHmOKXR1J8eGRE2qOqlaBq5DHo9VBmL1siBJy0w7YPH7t_PtKLUBJILupoJ8qwFrizZ1-lQae4fpDMAPevMMXQNWAS4GHJAUNt1d_g1xNsbPmyVWKuC3Ct7HO0hrsrc3QRMFWz8AjuhZsMbgsP9BRAIZDoK0EBqoiQbWfxfXfykhd4v';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -- Header: FAUMA + Saltar --
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FAUMA',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: _primaryColor,
                  letterSpacing: -0.6,
                ),
              ),
              GestureDetector(
                onTap: onSkip,
                child: Text(
                  'SALTAR',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: _secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        // -- Scrollable content --
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 8),

              // Hero image with gradient + data plate
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 4 / 5,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          FaumaImage(imageUrl: _imageUrl, fit: BoxFit.cover),
                          // Gradient overlay (from-on-surface/40 to-transparent)
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    _onSurface.withValues(alpha: 0.40),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Floating data plate
                  Positioned(
                    right: 16,
                    bottom: -16,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 180),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.10),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ESPECIE DESTACADA',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: _secondaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Chelonia mydas',
                            style: GoogleFonts.newsreader(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: _primaryColor,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Headline: "Elige tu especie."
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.newsreader(
                      fontSize: 44,
                      fontWeight: FontWeight.w800,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: _onSurface,
                    ),
                    children: [
                      const TextSpan(text: 'Elige tu '),
                      TextSpan(
                        text: 'especie',
                        style: GoogleFonts.newsreader(
                          fontSize: 44,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          height: 1.0,
                          color: _primaryColor,
                        ),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Body text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Explora nuestro cat\u00e1logo de animales y proyectos de conservaci\u00f3n real. Cada uno con contenido \u00fanico.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    height: 1.6,
                    color: _onSurfaceVariant.withValues(alpha: 0.9),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // -- Footer --
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Siguiente',
          onPressed: onNext,
          useCoral: false,
          showArrow: false,
          footnote: 'DESCUBRE EL ARCHIVO VIVO \u2022 2024',
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// SLIDE 2 -- Rotated subscription cards
// ---------------------------------------------------------------------------

class _Slide2 extends StatelessWidget {
  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const _Slide2({
    required this.currentPage,
    required this.onSkip,
    required this.onNext,
    required this.onBack,
  });

  static const _lionUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAWbntou49bqqvt0dKhoRzcYQHOCoV0InJHExfpqcpLa4h_4XQL9wa1qiN32PdjnYDWwo6POXTh3HFRa86TPO-gRG87rzGIvAdEYuBiC58oGDO_frQX3SJFQM4MsOLxEPCpXYPbCzg6Y5Yv14cnVqWhqnYRjvrrj8DR7RE9bVCGaSjclx8FiarUdgbQosag0zUK-aaQzCxIFLObXrYhsy-GZ2IEOueWufEd_1j9s1SMafSMndrwdYDh82bCYzn62ngsdBo9f09pV8D4';

  static const _redPandaUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAJjuNFsyHvJwL57NqQ4ggOXssym6Od9liGGTeL-UJCGi8qMAsb4j8kERX8gqtB9vjHm8thooLBIA2zGRNQh-BER69N3sH9uZdKJX70R9NrummGfftkfn6dBTrZS1D9EAta8PFWQ9gBE06OHRq_sPVSlepsbXXsfdfwIxQzNZqUbzymnfRIgO9kwCtz6dr93H6gewj4K7dwNSnGbCr_y_BPFMhzfOQEq4tjCLSQZe2TWp-7XugSndiUimPoPWLbKbvNTLoNiIPgfwNk';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -- Header: back arrow + FAUMA centered + spacer --
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            children: [
              // Back arrow circle
              GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: _surfaceContainerLow,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: _onSurface,
                    size: 20,
                  ),
                ),
              ),
              // FAUMA centered
              Expanded(
                child: Center(
                  child: Text(
                    'FAUMA',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      color: _primaryColor,
                      letterSpacing: -0.6,
                    ),
                  ),
                ),
              ),
              // Spacer for symmetry
              const SizedBox(width: 40),
            ],
          ),
        ),

        // -- Scrollable content --
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 16),

              // Card stack
              Center(
                child: SizedBox(
                  width: 280,
                  height: 360,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Back card (Hermano) -- rotated +6deg
                      Positioned(
                        top: 16,
                        right: -16,
                        width: 280,
                        height: 360,
                        child: Transform.rotate(
                          angle: 6 * math.pi / 180,
                          child: const _SubscriptionCard(
                            imageUrl: _lionUrl,
                            levelLabel: 'Nivel Superior',
                            tierName: 'Hermano',
                            backgroundColor: _surfaceContainerHigh,
                            showPrice: false,
                            elevation: 1,
                          ),
                        ),
                      ),
                      // Front card (Amigo) -- rotated -3deg
                      Positioned(
                        top: 0,
                        right: 0,
                        width: 280,
                        height: 360,
                        child: Transform.rotate(
                          angle: -3 * math.pi / 180,
                          child: const _SubscriptionCard(
                            imageUrl: _redPandaUrl,
                            levelLabel: 'Nivel Base',
                            tierName: 'Amigo',
                            backgroundColor: _surfaceContainerLowest,
                            showPrice: true,
                            elevation: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Headline
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'T\u00fa decides c\u00f3mo ayudar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.newsreader(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                      color: _onSurface,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Body
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    'Elige tu nivel de compromiso y transforma tu donaci\u00f3n en una experiencia con contenido de los animales que proteges.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      height: 1.6,
                      color: _onSurfaceVariant,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // -- Footer --
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Siguiente',
          onPressed: onNext,
          useCoral: false,
          showArrow: true,
          skipLabel: 'Omitir por ahora',
          onSkip: onSkip,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Subscription card used in Slide 2
// ---------------------------------------------------------------------------

class _SubscriptionCard extends StatelessWidget {
  final String imageUrl;
  final String levelLabel;
  final String tierName;
  final Color backgroundColor;
  final bool showPrice;
  final double elevation;

  const _SubscriptionCard({
    required this.imageUrl,
    required this.levelLabel,
    required this.tierName,
    required this.backgroundColor,
    required this.showPrice,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06 * elevation / 4),
            blurRadius: elevation * 3,
            offset: Offset(0, elevation),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                child: FaumaImage(imageUrl: imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Label
          Text(
            levelLabel.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: _secondaryColor,
            ),
          ),
          const SizedBox(height: 4),
          // Tier name
          Text(
            tierName,
            style: GoogleFonts.newsreader(
              fontSize: showPrice ? 24 : 20,
              fontWeight: FontWeight.w500,
              color: _primaryColor,
            ),
          ),
          // Price (only on front card)
          if (showPrice) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  '5\u20AC',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _primaryColor,
                  ),
                ),
                // pago único (sin /mes)
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SLIDE 3 -- Bento content grid + coral CTA
// ---------------------------------------------------------------------------

class _Slide3 extends StatelessWidget {
  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onStart;

  const _Slide3({
    required this.currentPage,
    required this.onSkip,
    required this.onStart,
  });

  static const _heroImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBhwBAi9r31_YqYmH28KhKf9PCKXY-gkRGDVe_Lk33z0VWWs81n6oOdo5Q5nqPQBn-cK7D0PviYYOoEqZ4JVrvqB7VdfUhqMOmYx7sshYuNR9blhw3A5ZHlr3sqKWvy7PHhz4hsJDJfftwQWK1k4ngIkU8Fj2WxtFrHmz2Ek5OWv8N2MAuRgpIJ9EBxeyvJesFDYDiOnGYEvLtLkB9c2Spf0FPPTCrO5Jz_FVVC4X3ClOW-tcsLZu3nwvW5TdnFwP31h7X48LRt40y2';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -- Header: FAUMA + menu icon --
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FAUMA',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: _primaryColor,
                  letterSpacing: -0.6,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: _surfaceContainerHigh,
                ),
                child: const Icon(
                  Icons.menu_open,
                  color: _primaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),

        // -- Scrollable content --
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              // Headline: "Descubre contenido exclusivo."
              Padding(
                padding: const EdgeInsets.only(right: 48),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.newsreader(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      height: 1.1,
                      letterSpacing: -0.5,
                      color: _onSurface,
                    ),
                    children: [
                      const TextSpan(text: 'Descubre contenido '),
                      TextSpan(
                        text: 'exclusivo.',
                        style: GoogleFonts.newsreader(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          height: 1.1,
                          color: _primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // -- Bento grid --
              // LARGE card (full width)
              const _BentoLargeCard(imageUrl: _heroImageUrl),

              const SizedBox(height: 12),

              // Small cards row
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SMALL LEFT (7/12)
                  Expanded(
                    flex: 7,
                    child: _BentoSmallLeft(),
                  ),
                  SizedBox(width: 12),
                  // SMALL RIGHT (5/12)
                  Expanded(
                    flex: 5,
                    child: _BentoSmallRight(),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Body text
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    height: 1.6,
                    color: _onSurfaceVariant,
                  ),
                  children: [
                    TextSpan(
                      text: 'Un v\u00ednculo que va m\u00e1s all\u00e1 ',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                        color: _onSurface,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'Elige el merchandising que te acompa\u00f1ar\u00e1 en tu d\u00eda a d\u00eda y sum\u00e9rgete en el contenido multimedia y cient\u00edfico.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // -- Footer (coral CTA) --
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Empezar',
          onPressed: onStart,
          useCoral: true,
          showArrow: true,
          skipLabel: 'Omitir introducci\u00f3n',
          onSkip: onSkip,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Bento: Large card (documentary video preview)
// ---------------------------------------------------------------------------

class _BentoLargeCard extends StatelessWidget {
  final String imageUrl;

  const _BentoLargeCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FaumaImage(imageUrl: imageUrl, fit: BoxFit.cover),
            // Gradient overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.60),
                    ],
                  ),
                ),
              ),
            ),
            // Play button + labels
            Positioned(
              left: 16,
              bottom: 16,
              child: Row(
                children: [
                  // Play circle (white/20 backdrop-blur)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.20),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'DOCUMENTAL',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'El rugido del Serengueti',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.80),
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
}

// ---------------------------------------------------------------------------
// Bento: Small left card (analytics / metric)
// ---------------------------------------------------------------------------

class _BentoSmallLeft extends StatelessWidget {
  const _BentoSmallLeft();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _outlineVariant.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: icon + label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.analytics_outlined, color: _primaryColor, size: 20),
              Text(
                'M\u00c9TRICA BIO',
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: _secondaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Title
          Text(
            'Migraci\u00f3n estacional detectada',
            style: GoogleFonts.newsreader(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              height: 1.2,
              color: _onSurface,
            ),
          ),
          const SizedBox(height: 6),
          // Stat
          Text(
            '+12% Actividad en zona norte',
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.4,
              color: _secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bento: Small right card (merch VIP)
// ---------------------------------------------------------------------------

class _BentoSmallRight extends StatelessWidget {
  const _BentoSmallRight();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _tertiaryFixed,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Decorative rotated icon in top-right
          Positioned(
            top: -4,
            right: -4,
            child: Transform.rotate(
              angle: 12 * math.pi / 180,
              child: Icon(
                Icons.checkroom,
                size: 36,
                color: _tertiaryColor.withValues(alpha: 0.30),
              ),
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.redeem, size: 28, color: _tertiaryColor),
                const SizedBox(height: 8),
                Text(
                  'MERCH VIP',
                  style: GoogleFonts.inter(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: _tertiaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared footer: dots + gradient/coral button + optional skip link + footnote
// ---------------------------------------------------------------------------

class _OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool useCoral;
  final bool showArrow;
  final String? skipLabel;
  final VoidCallback? onSkip;
  final String? footnote;

  const _OnboardingFooter({
    required this.currentPage,
    required this.buttonLabel,
    required this.onPressed,
    required this.useCoral,
    this.showArrow = false,
    this.skipLabel,
    this.onSkip,
    this.footnote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- Progress dots --
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              final isActive = i == currentPage;
              if (isActive) {
                // Active dot: page 0 = circle with ring, pages 1-2 = elongated pill
                if (i == 0) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: _primaryColor.withValues(alpha: 0.20),
                          blurRadius: 0,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 36,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: _primaryColor,
                    ),
                  );
                }
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == 0 && currentPage > 0
                        ? _surfaceVariant
                        : _outlineVariant,
                  ),
                );
              }
            }),
          ),

          const SizedBox(height: 28),

          // -- CTA button --
          SizedBox(
            width: double.infinity,
            height: 58,
            child: useCoral
                ? ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _livingCoral,
                      foregroundColor: Colors.white,
                      shadowColor: _livingCoral.withValues(alpha: 0.4),
                      elevation: 6,
                      shape: const StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonLabel,
                          style: GoogleFonts.newsreader(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (showArrow) ...[
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward, size: 20),
                        ],
                      ],
                    ),
                  )
                : DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [_primaryColor, _primaryContainer],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: [
                        BoxShadow(
                          color: _primaryColor.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonLabel,
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                          if (showArrow) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 20),
                          ],
                        ],
                      ),
                    ),
                  ),
          ),

          // -- Skip link (slides 2 & 3) --
          if (skipLabel != null && onSkip != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onSkip,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  skipLabel!.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: _onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
          ],

          // -- Footnote (slide 1) --
          if (footnote != null) ...[
            const SizedBox(height: 14),
            Text(
              footnote!,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                color: _outlineColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
