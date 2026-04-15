import 'dart:math' as math;

import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// Living coral accent used on the final slide CTA
// ---------------------------------------------------------------------------
const _livingCoral = Color(0xFFF4847A);

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
// SLIDE 1 – Hero image with floating data plate
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
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        // ── Header: FAUMA + Saltar ─────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FAUMA',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: cs.primary,
                  letterSpacing: -0.6,
                ),
              ),
              TextButton(
                onPressed: onSkip,
                child: Text(
                  'Saltar',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: cs.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── Scrollable content ─────────────────────────────────
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
                          // Gradient overlay
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.05),
                                    Colors.black.withValues(alpha: 0.40),
                                  ],
                                  stops: const [0.3, 0.6, 1.0],
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
                        color: cs.surfaceContainerLow,
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
                              color: cs.secondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Chelonia mydas',
                            style: GoogleFonts.newsreader(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: cs.primary,
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

              // Headline
              RichText(
                text: TextSpan(
                  style: GoogleFonts.newsreader(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    height: 1.05,
                    letterSpacing: -0.5,
                    color: cs.onSurface,
                  ),
                  children: [
                    const TextSpan(text: 'Elige tu '),
                    TextSpan(
                      text: 'especie',
                      style: GoogleFonts.newsreader(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        height: 1.05,
                        color: cs.primary,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Body text
              Text(
                'Explora nuestro catálogo de animales y proyectos de conservación real. Cada uno con contenido único.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.6,
                  color: cs.onSurfaceVariant.withValues(alpha: 0.9),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // ── Footer ─────────────────────────────────────────────
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Siguiente',
          onPressed: onNext,
          useCoral: false,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// SLIDE 2 – Rotated subscription cards
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
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        // ── Header: back arrow + FAUMA centered + spacer ───────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              // Back arrow circle
              GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.surfaceContainerLow,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: cs.onSurface,
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
                      color: cs.primary,
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

        // ── Scrollable content ─────────────────────────────────
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
                      // Back card (Hermano) – rotated +6deg
                      Positioned(
                        top: 16,
                        right: -16,
                        width: 280,
                        height: 360,
                        child: Transform.rotate(
                          angle: 6 * math.pi / 180,
                          child: _SubscriptionCard(
                            imageUrl: _lionUrl,
                            levelLabel: 'Nivel Superior',
                            tierName: 'Hermano',
                            backgroundColor: cs.surfaceContainerHigh,
                            showPrice: false,
                            elevation: 1,
                          ),
                        ),
                      ),
                      // Front card (Amigo) – rotated -3deg
                      Positioned(
                        top: 0,
                        right: 0,
                        width: 280,
                        height: 360,
                        child: Transform.rotate(
                          angle: -3 * math.pi / 180,
                          child: _SubscriptionCard(
                            imageUrl: _redPandaUrl,
                            levelLabel: 'Nivel Base',
                            tierName: 'Amigo',
                            backgroundColor: cs.surfaceContainerLowest,
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
                child: Text(
                  'Tú decides cómo ayudar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.newsreader(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    color: cs.onSurface,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Body
              Center(
                child: Text(
                  'Elige tu nivel de compromiso y transforma tu donación en una experiencia con contenido de los animales que proteges.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    height: 1.6,
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // ── Footer ─────────────────────────────────────────────
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Siguiente',
          onPressed: onNext,
          useCoral: false,
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
    final cs = Theme.of(context).colorScheme;

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
              color: cs.secondary,
            ),
          ),
          const SizedBox(height: 4),
          // Tier name
          Text(
            tierName,
            style: GoogleFonts.newsreader(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: cs.primary,
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
                    color: cs.primary,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  '/mes',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: cs.primary.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SLIDE 3 – Bento content grid + coral CTA
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
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        // ── Header: FAUMA + menu icon ──────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FAUMA',
                style: GoogleFonts.newsreader(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  color: cs.primary,
                  letterSpacing: -0.6,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cs.surfaceContainerHigh,
                ),
                child: Icon(
                  Icons.menu_open,
                  color: cs.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ),

        // ── Scrollable content ─────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              // Headline
              Padding(
                padding: const EdgeInsets.only(right: 48),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.newsreader(
                      fontSize: 38,
                      fontStyle: FontStyle.italic,
                      height: 1.1,
                      letterSpacing: -0.5,
                      color: cs.onSurface,
                    ),
                    children: [
                      const TextSpan(text: 'Descubre contenido '),
                      TextSpan(
                        text: 'exclusivo.',
                        style: GoogleFonts.newsreader(
                          fontSize: 38,
                          fontStyle: FontStyle.italic,
                          height: 1.1,
                          color: cs.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Bento grid ───────────────────────────────────
              // LARGE card (full width)
              _BentoLargeCard(imageUrl: _heroImageUrl),

              const SizedBox(height: 12),

              // Small cards row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SMALL LEFT (7/12)
                  Expanded(
                    flex: 7,
                    child: _BentoSmallLeft(cs: cs),
                  ),
                  const SizedBox(width: 12),
                  // SMALL RIGHT (5/12)
                  Expanded(
                    flex: 5,
                    child: _BentoSmallRight(cs: cs),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Body text
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    height: 1.6,
                    color: cs.onSurfaceVariant,
                  ),
                  children: [
                    TextSpan(
                      text: 'Un vínculo que va más allá. ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.6,
                        color: cs.onSurface,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'Elige el merchandising que te acompañará en tu día a día y sumérgete en el contenido multimedia y científico.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // ── Footer (coral CTA) ────────────────────────────────
        _OnboardingFooter(
          currentPage: currentPage,
          buttonLabel: 'Empezar',
          onPressed: onStart,
          useCoral: true,
          skipLabel: 'Omitir introducción',
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
                  // Play circle
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
  final ColorScheme cs;

  const _BentoSmallLeft({required this.cs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: icon + label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.analytics_outlined, color: cs.primary, size: 20),
              Text(
                'MÉTRICA BIO',
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: cs.secondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Title
          Text(
            'Migración estacional detectada',
            style: GoogleFonts.newsreader(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              height: 1.2,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          // Stat
          Text(
            '+12% Actividad en zona norte',
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.4,
              color: cs.secondary,
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
  final ColorScheme cs;

  const _BentoSmallRight({required this.cs});

  @override
  Widget build(BuildContext context) {
    // tertiary-fixed from the design system = #ffdad6
    const tertiaryFixed = Color(0xFFFFDAD6);

    return Container(
      height: 176,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tertiaryFixed,
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
                color: cs.tertiary.withValues(alpha: 0.30),
              ),
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.redeem, size: 28, color: cs.tertiary),
                const SizedBox(height: 8),
                Text(
                  'MERCH VIP',
                  style: GoogleFonts.inter(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: cs.tertiary,
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
// Shared footer: dots + gradient/coral button + optional skip link
// ---------------------------------------------------------------------------

class _OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool useCoral;
  final String? skipLabel;
  final VoidCallback? onSkip;

  const _OnboardingFooter({
    required this.currentPage,
    required this.buttonLabel,
    required this.onPressed,
    required this.useCoral,
    this.skipLabel,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Progress dots ────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              final isActive = i == currentPage;
              if (isActive) {
                // Active: on page 0 = filled circle with ring,
                //         on pages 1-2 = elongated pill
                if (i == 0) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cs.primary,
                      boxShadow: [
                        BoxShadow(
                          color: cs.primary.withValues(alpha: 0.20),
                          blurRadius: 0,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 32,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: cs.primary,
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
                    color: cs.outlineVariant,
                  ),
                );
              }
            }),
          ),

          const SizedBox(height: 24),

          // ── CTA button ───────────────────────────────────────
          SizedBox(
            width: double.infinity,
            height: 56,
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
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  )
                : DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [cs.primary, cs.primaryContainer],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: [
                        BoxShadow(
                          color: cs.primary.withValues(alpha: 0.3),
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
                        foregroundColor: cs.onPrimary,
                        shape: const StadiumBorder(),
                        textStyle: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                      child: Text(buttonLabel),
                    ),
                  ),
          ),

          // ── Skip link (only on slides 2 & 3) ────────────────
          if (skipLabel != null && onSkip != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onSkip,
              child: Text(
                skipLabel!.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: cs.onSurfaceVariant.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],

          // Footnote on slide 1 (when no skip label)
          if (skipLabel == null) ...[
            const SizedBox(height: 14),
            Text(
              'DESCUBRE EL ARCHIVO VIVO',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                color: cs.outline,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
