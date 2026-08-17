import 'package:flutter/material.dart';
import '../../../../core/theme/humboldt_colors.dart';
import '../../../../shared/widgets/custom_input_field.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLogin;

  const LoginForm({
    super.key,
    required this.onLogin,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 416,
      decoration: BoxDecoration(
        color: HumboldtColors.formCardBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Escudo del colegio superior (Coordenadas de Figma: x: 163, y: 293 / Card: x: 35, y: 264)
          // Relative X: (163 - 35) = 128. Relative Y: (293 - 264) = 29.
          Positioned(
            left: 128,
            top: 29,
            width: 71,
            height: 81,
            child: Image.asset(
              'assets/images/escudo_colegio.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Respaldo visual si no se encuentra el asset
                return Container(
                  color: Colors.green.shade700,
                  child: const Center(
                    child: Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Campo Usuario (Figma Y en card: 401 - 264 = 137, X: 54 - 35 = 19)
          Positioned(
            left: 19,
            top: 137,
            child: CustomInputField(
              hintText: 'Usuario',
              controller: _usuarioController,
            ),
          ),

          // Campo Contraseña (Figma Y en card: 491 - 264 = 227, X: 54 - 35 = 19)
          Positioned(
            left: 19,
            top: 227,
            child: CustomInputField(
              hintText: 'Contraseña',
              obscureText: true,
              controller: _passwordController,
            ),
          ),

          // Botón Entrar (Figma Y en card: 604 - 264 = 340, X: 112 - 35 = 77, Ancho: 172, Alto: 44)
          Positioned(
            left: 77,
            top: 340,
            child: GestureDetector(
              onTap: widget.onLogin,
              child: Container(
                width: 172,
                height: 44,
                decoration: BoxDecoration(
                  color: HumboldtColors.buttonBgGreen,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: HumboldtColors.textWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
