import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';

// ── Image URLs extracted from Stitch HTML ──────────────────────────────────
const _heroImageUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBvrMAuPNZ6CKpEBqJly-Dlg92QxJvl77_iC9c4y8C3FMjBzwYstaD4QVrLUvx_Ipjk_PRurJwHAMTp5RtX1IgH8OjPgRn_H0kIypt0ClN-mPzv7poUIlRXV_TFmS7r5aiN6WG6YzF1R4msmLSyVuypdqATfKP5dbGsFq0BpCfEl4U7uThuyoVoCWzAnNa241kmCbx8YvF_fKNKWlBj-AjLAByHi9ndlhF050dYyxkANrx6JT3MClZHUBk4rNP2dyAHkW4dGrUHGfEz';

const _volunteerImageUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBvGjWEUif9YYyP_pOq4kpbDHanAsVw8pX6Xj6vGkVjigYNskUgE0wgasBTIglhddOe6QxvsBxE0d29x_62iUrZHF2C56IFISeTXzBoPDZhMgLZntaKj5aFSpIj3jXSS-T9C50WCp2KEFyF0xwNcLFjinRkss4zPv6aaCUay_a4IX8ZW3ipr1bTCLfwEd6iy7vdFDqQYxLbLWV4G4iIFMueL0KmnKV--AkSI-xUV7eTniUniuf8TX_UEkj4DWLwNv82YWxzqQ9qx1es';

const _avatar1Url =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBZTVthyRbawu8f2BXz3Nj4v72mIM3bln9__yG6kFaDADwNyuGzD78qcyGg2KN3MdeRNXlYgxVwnUpFTCUmyjtgai1aKRM5pNV_gfWuDC9Vf2El9ib2aLe0_TJDzsL1Gx4xJ6KOyU1fnP4qCBW0K7nE6sUvVV7mtcuhuavGAUpmx5NLYrqcRgez2SvBhTK31sPM4ZT65ke8EUHwY-7AK1HfS7NT9u36Ci-5bBmUP-ay-jgWIziraO8BgtnlY6suW-Qct26ON0zvzP3X';

const _avatar2Url =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuADopYPZwLXTmmqercbboNkyTlUQ2D_YBxK1nt490LOX9QU1MBpEkWotslbnCxSown6lD_yPKMZyCcwEiCJRC79gRMBMvJE2pnG619hCJnwUpTOp6OVC3XgMcJnWVFf_J57KLFzRzBaP5XlGaF3mMKmzIeTZ-mCwE9ufs4nXx4v5eXAvKO21sybo9cAvBRGPCb8Agw4E_Af_okKn6h-xAn694D7LTGVp9CxG3HxwVkjj8h2wLTtNbv8PZwUBt89pfhA5myh4PCbabe6';

const _avatar3Url =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBr2ONEZ0H1DYizVZ8n_ZEQZaErIrZhUQBmTfI7lwDc1a2OOq-v1Bzo5y7EWb6GSrJ-DqsdHeEnt--xSLZvpCmc8z5hh4BQlyXRqogPJuC3pYXPOFJ_GL0evgdlnuBplRMwYLn_JBuoq9qrDhzukRcpptz3mo4Ps7MycaWnwmO-W0cleWH3fYa4Agz_qY4oB1qjETsbf4iH3wbeOjCVRE45p9Z47E26_JfALXD2UyIM1FMgEYP3OZu693EpV4xfippuwjDOKI3mucmS';

/// Public species presentation screen -- shown before subscription.
///
/// Design reference: 55-especie-presentacion-publica.html
class SpeciesDetailScreen extends StatelessWidget {
  const SpeciesDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: Stack(
        children: [
          // ── Scrollable content ──
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeroSection(context),
                _buildContentBody(context),
                // Extra bottom padding so content clears the sticky CTA
                const SizedBox(height: 120),
              ],
            ),
          ),

          // ── Top action buttons (over hero) ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleIconButton(
                  icon: Icons.arrow_back,
                  onTap: () => context.go('/explore'),
                ),
                _CircleIconButton(
                  icon: Icons.share,
                  onTap: () {},
                ),
              ],
            ),
          ),

          // ── Sticky bottom CTA ──
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: _buildCtaButton(context),
            ),
          ),
        ],
      ),
    );
  }

  // ── Hero Section ─────────────────────────────────────────────────────────
  // Matches: 751px hero with gradient from transparent -> 20% black -> 90% primaryContainer

  Widget _buildHeroSection(BuildContext context) {
    return SizedBox(
      height: 560,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          FaumaImage(
            imageUrl: _heroImageUrl,
            fit: BoxFit.cover,
          ),
          // Gradient overlay: transparent -> 20% black at 60% -> 90% primaryContainer
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000), // transparent
                  Color(0x33000000), // ~20% black
                  Color(0xE61A6B72), // ~90% primaryContainer
                ],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          ),
          // Title overlay at bottom of hero
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tagline pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: FaumaColors.tertiary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    'Protege su regreso a casa.',
                    style: GoogleFonts.newsreader(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Scientific name (light italic)
                Text(
                  'Caretta caretta',
                  style: GoogleFonts.newsreader(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                // Common name (bold large)
                Text(
                  'Tortuga Boba',
                  style: GoogleFonts.newsreader(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.05,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Content Body ─────────────────────────────────────────────────────────

  Widget _buildContentBody(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -48),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildIntroQuote(),
            const SizedBox(height: 32),
            _buildPresentationAndStats(),
            const SizedBox(height: 40),
            _buildWhyProtectSection(),
            const SizedBox(height: 40),
            _buildWhySupportSection(),
            const SizedBox(height: 48),
            _buildImpactBanner(),
          ],
        ),
      ),
    );
  }

  // ── Intro Quote ──────────────────────────────────────────────────────────
  // White card with left-8 primary border, decorative quote mark, italic headline text

  Widget _buildIntroQuote() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(
            color: FaumaColors.primary,
            width: 8,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: FaumaColors.whisperShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative quotation mark (top-right, large, 10% primary)
          Positioned(
            top: -8,
            right: 0,
            child: Text(
              '\u201C',
              style: GoogleFonts.newsreader(
                fontSize: 96,
                fontStyle: FontStyle.italic,
                color: FaumaColors.primary.withValues(alpha: 0.1),
                height: 1,
              ),
            ),
          ),
          // Quote text
          Text(
            'Navegante de distancias infinitas, la tortuga boba es el puente vivo entre los oc\u00e9anos y nuestras costas.',
            style: GoogleFonts.newsreader(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: FaumaColors.primary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // ── Mini Presentation + 2x2 Stats Grid ──────────────────────────────────

  Widget _buildPresentationAndStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Mini presentation card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: FaumaColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: FaumaColors.tertiary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Cr\u00f3nica de un gigante',
                    style: GoogleFonts.newsreader(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: FaumaColors.onSurfaceVariant,
                    height: 1.8,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Su nombre cient\u00edfico, ',
                    ),
                    TextSpan(
                      text: 'Caretta',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: FaumaColors.primary,
                        height: 1.8,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ', hace referencia a su rasgo m\u00e1s distintivo: una cabeza desproporcionadamente grande y robusta. Esta caracter\u00edstica no es casualidad; alberga unas mand\u00edbulas potentes que le permiten triturar presas duras como grandes caracoles y cangrejos. Con su inconfundible color marr\u00f3n rojizo, es la gran especialista en limpiar y equilibrar los fondos marinos.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // 2x2 Stats grid
        _buildStatsGrid(),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Column(
      children: [
        // Row 1: IUCN + Tendencia
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.warning_amber_rounded,
                iconColor: FaumaColors.tertiary,
                label: 'Estado IUCN',
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDAD6), // tertiary-fixed
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Vulnerable',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color:
                          const Color(0xFF7E2A25), // on-tertiary-fixed-variant
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.trending_down,
                iconColor: const Color(0xFFBA1A1A), // error
                label: 'Tendencia',
                child: Text(
                  'En descenso',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Row 2: Habitat + Peso
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.public,
                iconColor: FaumaColors.primary,
                label: 'H\u00e1bitat',
                child: Text(
                  'Oc\u00e9anos templados y subtropicales',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.onSurface,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.scale,
                iconColor: FaumaColors.primary,
                label: 'Peso medio',
                child: Text(
                  '135 kg',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: FaumaColors.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Why Protect Section ──────────────────────────────────────────────────
  // Dark red background (on-tertiary-fixed = #410003), decorative blur circle

  Widget _buildWhyProtectSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF410003), // on-tertiary-fixed
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative blurred circle (top-right)
          Positioned(
            top: -64,
            right: -64,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: FaumaColors.tertiary.withValues(alpha: 0.2),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.home_outlined,
                    color: Color(0xFFFFB4AC), // tertiary-fixed-dim
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '\u00bfPor qu\u00e9 protegerla?',
                      style: GoogleFonts.newsreader(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFFDAD6), // tertiary-fixed
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFFFFDAD6)
                        .withValues(alpha: 0.9), // tertiary-fixed at 90%
                    height: 1.7,
                  ),
                  children: [
                    const TextSpan(text: 'Solo '),
                    TextSpan(
                      text: '1 de cada 1.000',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFDAD6),
                        height: 1.7,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' cr\u00edas logra llegar a la edad adulta. El cambio clim\u00e1tico est\u00e1 provocando feminizaci\u00f3n masiva. Al ser migratoria, su protecci\u00f3n es un reto internacional: de nada sirve proteger una playa si muere en una red en otro pa\u00eds.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Why Support Section ──────────────────────────────────────────────────
  // Volunteer image (tilted), "Accion Colectiva" label, headline, body, avatar stack

  Widget _buildWhySupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Volunteer image with slight rotation + shadow
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Transform.rotate(
              angle: 0.035, // ~2 degrees rotation per HTML
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FaumaImage(
                    imageUrl: _volunteerImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // "Accion Colectiva" label with line
        Row(
          children: [
            Container(
              width: 40,
              height: 2,
              color: FaumaColors.primary,
            ),
            const SizedBox(width: 8),
            Text(
              'Acci\u00f3n Colectiva',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: FaumaColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Headline
        Text(
          '\u00bfPor qu\u00e9 apoyar?',
          style: GoogleFonts.newsreader(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: FaumaColors.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        // Body text
        Text(
          'No estamos intentando simplemente rescatar a la Tortuga Boba; estamos invirtiendo en ella para que siga siendo la gran viajera de nuestros mares. Tu apoyo permite que los centros de recuperaci\u00f3n se adelanten a las amenazas.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: FaumaColors.onSurfaceVariant,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 24),
        // Supporter avatars row
        Row(
          children: [
            SizedBox(
              width: 136,
              height: 44,
              child: Stack(
                children: [
                  _buildAvatarCircle(_avatar1Url, 0),
                  _buildAvatarCircle(_avatar2Url, 28),
                  _buildAvatarCircle(_avatar3Url, 56),
                  Positioned(
                    left: 84,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFA6EFF6), // primary-fixed
                        border: Border.all(
                          color: FaumaColors.surface,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+1.2k',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: const Color(
                                0xFF004F55), // on-primary-fixed-variant
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Personas ya est\u00e1n apoyando este proyecto',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: FaumaColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarCircle(String url, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: FaumaColors.surface, width: 3),
        ),
        child: ClipOval(
          child: FaumaImage(
            imageUrl: url,
            fit: BoxFit.cover,
            width: 44,
            height: 44,
          ),
        ),
      ),
    );
  }

  // ── Impact Banner ────────────────────────────────────────────────────────
  // Centered italic headline with top+bottom border

  Widget _buildImpactBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: FaumaColors.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Protege un viaje milenario',
          style: GoogleFonts.newsreader(
            fontSize: 32,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: FaumaColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // ── Sticky CTA Button ───────────────────────────────────────────────────
  // Coral gradient pill with two lines: headline + price

  Widget _buildCtaButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.go('/conversion/level/$id'),
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF4847A), // coral start
                Color(0xFFD66D64), // coral end
              ],
            ),
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF4847A).withValues(alpha: 0.4),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Apoyar esta especie',
                style: GoogleFonts.newsreader(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'desde 5\u20ac',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Reusable private widgets ───────────────────────────────────────────────

/// Translucent circle button used over the hero image.
class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

/// White stat card with icon, uppercase label, and custom value widget.
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.child,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: FaumaColors.outlineVariant.withValues(alpha: 0.4)),
        boxShadow: const [
          BoxShadow(
            color: FaumaColors.whisperShadow,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: FaumaColors.secondary,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          child,
        ],
      ),
    );
  }
}
