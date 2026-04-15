import 'package:fauma_app/widgets/fauma_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
// go_router available for future navigation needs
// ignore: unused_import
import 'package:go_router/go_router.dart';

/// Image URL extracted from 25-perfil.html
const _kProfileAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCuv1K_-ZqYSiIhlNmj66XHczDdGny7EpnL04hG28rA8w_OWWbk_lQ1hpvxaf-g5QdHtRJXzp9mW7eWjLGHJG0mSbJneFsRJnf5EY4MexZV_3R-_f9w_9RuyOpVOi8tYQ0rpz9QUKXbKQjsHLc11N4Yj2XEDSBxMSOC5AaXGIxYuaGlbMxiX642RtAw3kCBzqb9SHcDTtl16d14UvqdMsflNA1Thgd7hndo50orRyaPxQCdcHXw-Rh_TIL7MIWuvxVRVwRZv3OUwrUt';

const _kCoral = Color(0xFFF4847A);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.menu, color: cs.primaryContainer),
                  const Spacer(),
                  Text(
                    'The Living Archive',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: cs.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.settings, color: cs.primaryContainer),
                ],
              ),
            ),
          ),

          // ── Scrollable Body ─────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Profile Header ──────────────────────────
                  _buildProfileHeader(cs),
                  const SizedBox(height: 40),

                  // ── Subscriptions Section ───────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8),
                    child: Text(
                      'Mis Suscripciones',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSubscriptionCard(
                    cs,
                    icon: Icons.egg,
                    name: 'Tortuga Caretta caretta',
                    levelLabel: 'HERMANO',
                    levelColor: cs.primaryContainer,
                    levelTextColor: const Color(0xFFA1E9F1),
                    renewDate: 'Renueva: 15 Mar 2027',
                    ctaText: 'Subir a Heroe',
                  ),
                  const SizedBox(height: 24),
                  _buildSubscriptionCard(
                    cs,
                    icon: Icons.pets,
                    name: 'Pinguino Papua',
                    levelLabel: 'AMIGO',
                    levelColor: cs.surfaceContainerHighest,
                    levelTextColor: cs.onSurfaceVariant,
                    renewDate: 'Renueva: 22 Jun 2027',
                    ctaText: 'Subir nivel',
                  ),
                  const SizedBox(height: 40),

                  // ── Gifts Section ───────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8),
                    child: Text(
                      'Mis Regalos (2)',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildGiftCard(
                    cs,
                    title: '\uD83C\uDF81 Tortuga Caretta para Lucia',
                    date: '10 Dic 2026',
                    status: 'Activado \u2713',
                    statusBg: const Color(0xFFDCFCE7),
                    statusFg: const Color(0xFF15803D),
                  ),
                  const SizedBox(height: 12),
                  _buildGiftCardPending(
                    cs,
                    title: '\uD83C\uDF81 Pinguino Papua para Pablo',
                    date: 'Enviado hoy',
                    status: 'Pendiente',
                    statusBg: const Color(0xFFFEF3C7),
                    statusFg: const Color(0xFFB45309),
                  ),
                  const SizedBox(height: 40),

                  // ── Settings Section ────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8),
                    child: Text(
                      'Configuracion',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSettingsGroup(cs),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Profile Header ────────────────────────────────────────────
  Widget _buildProfileHeader(ColorScheme cs) {
    return Center(
      child: Column(
        children: [
          // Avatar
          Container(
            width: 128,
            height: 128,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: cs.primary.withValues(alpha: 0.1),
                width: 4,
              ),
            ),
            child: ClipOval(
              child: FaumaImage(
                imageUrl: _kProfileAvatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Name
          Text(
            'Maria Garcia',
            style: GoogleFonts.newsreader(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 8),

          // Rank badge
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: cs.primary.withValues(alpha: 0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: cs.primaryContainer.withValues(alpha: 0.1),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Text(
              '\uD83C\uDFC5 Heroina de la Conservacion',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
                color: cs.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Edit profile link
          GestureDetector(
            onTap: () {},
            child: Text(
              'Editar perfil',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: cs.secondary,
                decoration: TextDecoration.underline,
                decorationColor:
                    cs.secondary.withValues(alpha: 0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Subscription Card ─────────────────────────────────────────
  Widget _buildSubscriptionCard(
    ColorScheme cs, {
    required IconData icon,
    required String name,
    required String levelLabel,
    required Color levelColor,
    required Color levelTextColor,
    required String renewDate,
    required String ctaText,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: cs.primary, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.newsreader(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: levelColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        levelLabel,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: levelTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: cs.onSurface.withValues(alpha: 0.05),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  renewDate,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: cs.secondary,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        ctaText,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _kCoral,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward,
                          color: _kCoral, size: 16),
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

  // ── Gift Card ─────────────────────────────────────────────────
  Widget _buildGiftCard(
    ColorScheme cs, {
    required String title,
    required String date,
    required String status,
    required Color statusBg,
    required Color statusFg,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: cs.secondary.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: statusBg,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              status,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: statusFg,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Gift Card Pending (with resend button) ────────────────────
  Widget _buildGiftCardPending(
    ColorScheme cs, {
    required String title,
    required String date,
    required String status,
    required Color statusBg,
    required Color statusFg,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color:
                            cs.secondary.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: statusFg,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.forward_to_inbox,
                      color: _kCoral, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Reenviar codigo',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: _kCoral,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Settings Group ────────────────────────────────────────────
  Widget _buildSettingsGroup(ColorScheme cs) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _settingsItem(
              cs, Icons.payments, 'Metodos de pago'),
          _settingsItem(
              cs, Icons.receipt_long, 'Historial de donaciones'),
          _settingsItem(
              cs, Icons.notifications, 'Notificaciones'),
          _settingsItem(cs, Icons.help, 'Ayuda y contacto'),
          // Logout (no chevron, coral color)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: _kCoral),
                    const SizedBox(width: 16),
                    Text(
                      'CERRAR SESION',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: _kCoral,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsItem(
      ColorScheme cs, IconData icon, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 20),
          child: Row(
            children: [
              Icon(icon, color: cs.secondary),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: cs.onSurface,
                  ),
                ),
              ),
              Icon(Icons.chevron_right,
                  color: cs.secondary.withValues(alpha: 0.4)),
            ],
          ),
        ),
      ),
    );
  }
}
