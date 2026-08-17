import 'package:flutter/material.dart';
import '../../../../core/theme/humboldt_colors.dart';
import '../../../dashboard/presentation/pages/student_dashboard_page.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dimensiones de diseño base en Figma para el iPhone 14 (393 x 852 aprox o ancho real renderizado 390-410)
    // Usaremos un LayoutBuilder y SingleChildScrollView para asegurar la responsividad en móviles reales
    return Scaffold(
      body: Stack(
        children: [
          // Fondo Verde Base (Rectangle 5 - fondo completo)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: HumboldtColors.backgroundGreen,
          ),

          // Capa de opacidad verde oscuro para ambientación (Rectangle 6)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: HumboldtColors.darkGreenSemiTransparent,
          ),

          // Imagen de ambientación Humboldt 1 (Fondo con opacidad, en Figma se superpone al fondo)
          // Medidas de Figma: x: -24, y: -10, width: 440, height: 432
          Positioned(
            left: -24,
            top: -10,
            width: 440,
            height: 432,
            child: Opacity(
              opacity: 0.15, // Añadimos una opacidad sutil para no interferir con las lecturas
              child: Image.asset(
                'assets/images/humboldt_1.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox();
                },
              ),
            ),
          ),

          // Contenido Principal Scrolleable
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 393, // Centramos el ancho de referencia del iPhone 14
                  height: 852, // Altura de referencia
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Encabezado ¡Bienvenido! (Figma X: 78, Y: 127 - restando safeArea top de ~40-50, lo aproximamos a 80)
                      const Positioned(
                        left: 78,
                        top: 80,
                        child: LoginHeader(),
                      ),

                      // Tarjeta de Formulario (Figma X: 35, Y: 264)
                      Positioned(
                        left: 35,
                        top: 264,
                        child: LoginForm(
                          onLogin: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const StudentDashboardPage(),
                              ),
                            );
                          },
                        ),
                      ),

                      // Footer Decorativo Verde Oscuro Inferior (Rectangle 9)
                      // Figma X: -19, Y: 604, Width: 524, Height: 209 (superpuesto abajo del todo)
                      Positioned(
                        left: -19,
                        top: 644, // Subimos sutilmente para balancear visualmente la pantalla
                        width: 524,
                        height: 210,
                        child: Container(
                          decoration: BoxDecoration(
                            color: HumboldtColors.footerGreen,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),

                      // Eslogan "¡De camino a la excelencia!" (Figma X: 99, Y: 809 dentro del área del footer)
                      const Positioned(
                        left: 99,
                        top: 790,
                        child: Text(
                          '¡De camino a la excelencia!',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HumboldtColors.textWhite,
                          ),
                        ),
                      ),
                    ],
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
