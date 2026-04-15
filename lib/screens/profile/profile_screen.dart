import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import '../../widgets/fauma_image.dart';

/// Image URL extracted from 25-perfil.html
const _kProfileAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCuv1K_-ZqYSiIhlNmj66XHczDdGny7EpnL04hG28rA8w_OWWbk_lQ1hpvxaf-g5QdHtRJXzp9mW7eWjLGHJG0mSbJneFsRJnf5EY4MexZV_3R-_f9w_9RuyOpVOi8tYQ0rpz9QUKXbKQjsHLc11N4Yj2XEDSBxMSOC5AaXGIxYuaGlbMxiX642RtAw3kCBzqb9SHcDTtl16d14UvqdMsflNA1Thgd7hndo50orRyaPxQCdcHXw-Rh_TIL7MIWuvxVRVwRZv3OUwrUt';

/// Secondary container color from the design system HTML.
const _kSecondaryContainer = Color(0xFFD7E3F9);

/// On-secondary-container color from the design system HTML.
const _kOnSecondaryContainer = Color(0xFF596577);

/// On-primary-container color from the design system HTML.
const _kOnPrimaryContainer = Color(0xFFA1E9F1);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FaumaColors.surface,
      body: Column(
        children: [
          // -- Top App Bar --
          SafeArea(
            bottom: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.menu, color: FaumaColors.primaryContainer),
                  const Spacer(),
                  Text(
                    'The Living Archive',
                    style: GoogleFonts.newsreader(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: FaumaColors.primaryContainer,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.settings, color: FaumaColors.primaryContainer),
                ],
              ),
            ),
          ),

          // -- Scrollable Body --
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Profile Header --
                  _buildProfileHeader(),
                  const SizedBox(height: 40),

                  // -- Subscriptions Section --
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Mis Suscripciones',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSubscriptionCard(
                    icon: Icons.egg,
                    name: 'Tortuga Caretta caretta',
                    levelLabel: 'HERMANO',
                    levelColor: FaumaColors.primaryContainer,
                    levelTextColor: _kOnPrimaryContainer,
                    renewDate: 'Renueva: 15 Mar 2027',
                    ctaText: 'Subir a Héroe',
                  ),
                  const SizedBox(height: 24),
                  _buildSubscriptionCard(
                    icon: Icons.pets,
                    name: 'Pingüino Papúa',
                    levelLabel: 'AMIGO',
                    levelColor: _kSecondaryContainer,
                    levelTextColor: _kOnSecondaryContainer,
                    renewDate: 'Renueva: 22 Jun 2027',
                    ctaText: 'Subir nivel',
                  ),
                  const SizedBox(height: 40),

                  // -- Gifts Section --
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Mis Regalos (2)',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildGiftCard(
                    title: '🎁 Tortuga Caretta para Lucía',
                    date: '10 Dic 2026',
                    status: 'Activado ✓',
                    statusBg: const Color(0xFFDCFCE7),
                    statusFg: const Color(0xFF15803D),
                  ),
                  const SizedBox(height: 12),
                  _buildGiftCardPending(
                    title: '🎁 Pingüino Papúa para Pablo',
                    date: 'Enviado hoy',
                    status: 'Pendiente',
                    statusBg: const Color(0xFFFEF3C7),
                    statusFg: const Color(0xFFB45309),
                  ),
                  const SizedBox(height: 40),

                  // -- Settings Section --
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Configuración',
                      style: GoogleFonts.newsreader(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: FaumaColors.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSettingsGroup(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -- Profile Header -------------------------------------------------------
  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          // Avatar with ring
          Container(
            width: 128,
            height: 128,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: FaumaColors.primary.withValues(alpha: 0.1),
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
            'María García',
            style: GoogleFonts.newsreader(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: FaumaColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),

          // Rank badge
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: FaumaColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: FaumaColors.primary.withValues(alpha: 0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      FaumaColors.primaryContainer.withValues(alpha: 0.1),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Text(
              '🏅 Heroína de la Conservación',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
                color: FaumaColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Edit profile link
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: FaumaColors.secondary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                'Editar perfil',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: FaumaColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -- Subscription Card ----------------------------------------------------
  Widget _buildSubscriptionCard({
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
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:
                      FaumaColors.primaryContainer.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(icon, color: FaumaColors.primary, size: 28),
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
                        color: FaumaColors.onSurface,
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
                  color: FaumaColors.onSurface.withValues(alpha: 0.05),
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
                    color: FaumaColors.secondary,
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
                          color: FaumaColors.coralCta,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward,
                          color: FaumaColors.coralCta, size: 16),
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

  // -- Gift Card (activated) ------------------------------------------------
  Widget _buildGiftCard({
    required String title,
    required String date,
    required String status,
    required Color statusBg,
    required Color statusFg,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
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
                    color: FaumaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: FaumaColors.secondary.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

  // -- Gift Card (pending, with resend button) ------------------------------
  Widget _buildGiftCardPending({
    required String title,
    required String date,
    required String status,
    required Color statusBg,
    required Color statusFg,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
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
                        color: FaumaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color:
                            FaumaColors.secondary.withValues(alpha: 0.7),
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
                      color: FaumaColors.coralCta, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Reenviar código',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: FaumaColors.coralCta,
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

  // -- Settings Group -------------------------------------------------------
  Widget _buildSettingsGroup() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: FaumaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _settingsItem(Icons.payments, 'Métodos de pago'),
          _settingsItem(Icons.receipt_long, 'Historial de donaciones'),
          _settingsItem(Icons.notifications, 'Notificaciones'),
          _settingsItem(Icons.help, 'Ayuda y contacto'),
          // Logout row -- coral color, no chevron
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: FaumaColors.coralCta),
                    const SizedBox(width: 16),
                    Text(
                      'CERRAR SESIÓN',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: FaumaColors.coralCta,
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

  Widget _settingsItem(IconData icon, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            children: [
              Icon(icon, color: FaumaColors.secondary),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: FaumaColors.onSurface,
                  ),
                ),
              ),
              Icon(Icons.chevron_right,
                  color: FaumaColors.secondary.withValues(alpha: 0.4)),
            ],
          ),
        ),
      ),
    );
  }
}
