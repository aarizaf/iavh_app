import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Widget para crear el fondo degradado de la aplicación
class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors ?? [
            AppColors.lightGreen,
            AppColors.primaryGreen,
            AppColors.darkGreen,
          ],
        ),
      ),
      child: child,
    );
  }
}
