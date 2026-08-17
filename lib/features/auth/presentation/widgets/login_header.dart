import 'package:flutter/material.dart';
import '../../../../core/theme/humboldt_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '¡Bienvenido! ',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: HumboldtColors.textWhite,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 118), // Espaciador hasta el inicio del formulario/escudo según coordenadas y=127 -> y=264 o similar
      ],
    );
  }
}
