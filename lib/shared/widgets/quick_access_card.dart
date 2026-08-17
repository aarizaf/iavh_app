import 'package:flutter/material.dart';
import '../../core/theme/edu_connect_colors.dart';
import '../../core/theme/edu_connect_text_styles.dart';

/// Tarjeta reutilizable para la sección "Accesos rápidos" del dashboard.
class QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const QuickAccessCard({
    super.key,
    required this.icon,
    required this.label,
    required this.iconBackgroundColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: EduConnectColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: EduConnectColors.cardBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000), // rgba(0,0,0,0.04)
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(height: 12),
            Text(label, style: EduConnectTextStyles.cardTitle),
          ],
        ),
      ),
    );
  }
}
