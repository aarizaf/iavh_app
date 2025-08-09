import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:glassmorphism/glassmorphism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'AFData Estudiantil',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2E7D32),
              brightness: Brightness.light,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
          home: const LoginPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

// Colores de la aplicación
class AppColors {
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF66BB6A);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color cardBackground = Color(0xFFF5F5F5);
  static const Color logoYellow = Color(0xFFFFD700);
  static const Color logoBlue = Color(0xFF1976D2);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF757575);
}

// Pantalla de Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _animationController.forward();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simular llamada de autenticación
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Login exitoso!'),
          backgroundColor: AppColors.primaryGreen,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 3, 97, 50),
              Color.fromARGB(255, 2, 138, 56),
              Color.fromARGB(255, 19, 152, 57),
              Color.fromARGB(255, 13, 86, 39),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h), // Reducido de 60 a 40
                        
                        // Header animado
                        FadeInDown(
                          duration: const Duration(milliseconds: 1000),
                          child: _buildModernHeader(),
                        ),
                        
                        SizedBox(height: 30.h), // Reducido de 50 a 30
                        
                        // Formulario con efecto glassmorphism
                        SlideInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: _buildGlassLoginForm(),
                        ),
                        
                        SizedBox(height: 20.h), // Reducido de 30 a 20
                        
                        // Mensaje de excelencia animado
                        FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            '¡De camino a la excelencia!',
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildModernHeader() {
    return Column(
      children: [        
        // Título moderno
        Text(
          '¡Bienvenido!',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 28.sp, // Reducido de 32 a 28
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 10,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        
        SizedBox(height: 8.h), // Reducido de 10 a 8
        
        Text(
          'Portal Estudiantil AFData',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGlassLoginForm() {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 420.h, // Reducir altura para evitar overflow
      borderRadius: 20.r,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Tamaño mínimo requerido
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo con imagen centrado y bien espaciado
              Pulse(
                infinite: true,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: 100.w, // Aumentado para mayor presencia
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFFFFF), // Fondo blanco para la imagen
                        Color(0xFFF5F5F5), // Gris muy claro
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ClipOval(                      child: Container(
                        padding: EdgeInsets.all(8.w), // Padding interno
                        child: _buildLogoImage(),
                      ),
                  ),
                ),
              ),
              
              SizedBox(height: 28.h), // Reducir espaciado para evitar overflow
              
              // Campo de usuario moderno
              _buildModernTextField(
                controller: _usernameController,
                hintText: 'Usuario',
                icon: Icons.person_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              
              SizedBox(height: 20.h),
              
              // Campo de contraseña moderno
              _buildModernTextField(
                controller: _passwordController,
                hintText: 'Contraseña',
                icon: Icons.lock_outline_rounded,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
              ),
              
              SizedBox(height: 30.h),
              
              // Botón moderno
              _buildModernButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontSize: 14.sp,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryGreen,
              size: 20.sp,
            ),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.primaryGreen,
              width: 2.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernButton() {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightGreen,
            AppColors.primaryGreen,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Entrar',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  // Método para construir el logo con múltiples formatos soportados
  Widget _buildLogoImage() {
    // Por ahora mostrar directamente el logo de respaldo
    // hasta que se agregue una imagen real
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E7D32), // Verde primario
            Color(0xFF66BB6A), // Verde claro
          ],
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: 32.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            'AF',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    
    /* Código comentado para cargar imagen personalizada
    // Lista de posibles nombres de archivo para el logo
    const List<String> logoFiles = [
      'assets/images/logo.png',
      'assets/images/logo.jpg',
      'assets/images/logo.jpeg',
      'assets/images/afdata_logo.png',
      'assets/images/afdata_logo.jpg',
    ];

    // Intentar cargar la primera imagen disponible
    return Image.asset(
      logoFiles[0], // Por defecto intenta logo.png
      width: 80.w,
      height: 80.w,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Widget de respaldo mostrado arriba
        return Container(...);
      },
    );
    */
  }
}

// Pantalla de Dashboard
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightGreen,
              AppColors.primaryGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Saludo de bienvenida moderno
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    '¡Hola, Estudiante!',
                    style: GoogleFonts.poppins(
                      color: AppColors.textWhite,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    'Bienvenido a tu dashboard académico',
                    style: GoogleFonts.poppins(
                      color: AppColors.textWhite.withOpacity(0.9),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                
                // Grid de opciones moderno
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1.0,
                    children: [
                      SlideInLeft(
                        delay: const Duration(milliseconds: 300),
                        child: _buildModernDashboardCard(
                          icon: Icons.schedule_rounded,
                          title: 'Horarios',
                          subtitle: 'Ver mis clases',
                          color: AppColors.logoBlue,
                          gradientColors: [
                            Colors.blue.shade300,
                            Colors.blue.shade600,
                          ],
                        ),
                      ),
                      SlideInRight(
                        delay: const Duration(milliseconds: 400),
                        child: _buildModernDashboardCard(
                          icon: Icons.grade_rounded,
                          title: 'Calificaciones',
                          subtitle: 'Mis notas',
                          color: AppColors.logoYellow,
                          gradientColors: [
                            Colors.orange.shade300,
                            Colors.orange.shade600,
                          ],
                        ),
                      ),
                      SlideInLeft(
                        delay: const Duration(milliseconds: 500),
                        child: _buildModernDashboardCard(
                          icon: Icons.book_rounded,
                          title: 'Materias',
                          subtitle: 'Mis cursos',
                          color: AppColors.primaryGreen,
                          gradientColors: [
                            Colors.green.shade300,
                            Colors.green.shade600,
                          ],
                        ),
                      ),
                      SlideInRight(
                        delay: const Duration(milliseconds: 600),
                        child: _buildModernDashboardCard(
                          icon: Icons.person_rounded,
                          title: 'Perfil',
                          subtitle: 'Mi información',
                          color: AppColors.darkGreen,
                          gradientColors: [
                            Colors.purple.shade300,
                            Colors.purple.shade600,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernDashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required List<Color> gradientColors,
  }) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: double.infinity,
      borderRadius: 20.r,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: () {
            // Aquí puedes agregar navegación a otras pantallas
          },
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono con gradiente
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors.first.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    size: 32.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
