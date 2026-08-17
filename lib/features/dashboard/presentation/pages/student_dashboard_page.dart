import 'package:flutter/material.dart';
import '../../../../core/theme/edu_connect_colors.dart';
import '../../../../core/theme/edu_connect_text_styles.dart';
import '../../../../shared/widgets/quick_access_card.dart';
import '../../../student/presentation/pages/student_subjects_page.dart';

/// Pantalla principal del estudiante (Home / Dashboard) según el diseño de
/// Figma "EduConnect" (frame: student-dashboard, node-id: 2308:1458).
class StudentDashboardPage extends StatelessWidget {
  final String studentName;

  const StudentDashboardPage({
    super.key,
    this.studentName = 'Andrés Felipe',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EduConnectColors.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(studentName: studentName),
              _GreetingSection(studentName: studentName),
              const _HeroCard(),
              const _QuickAccessSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String studentName;

  const _Header({required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_rounded,
                size: 32,
                color: EduConnectColors.textDark,
              ),
              const SizedBox(width: 12),
              Text('EduConnect', style: EduConnectTextStyles.brandTitle),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('¡Hola!', style: EduConnectTextStyles.helloLabel),
                  const SizedBox(height: 2),
                  Text(studentName, style: EduConnectTextStyles.userName),
                ],
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 36,
                height: 42,
                child: Image.asset(
                  'assets/images/school_logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.school_rounded,
                    color: EduConnectColors.brandGreen,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GreetingSection extends StatelessWidget {
  final String studentName;

  const _GreetingSection({required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('¡Bienvenido,', style: EduConnectTextStyles.greetingLight),
          Text('$studentName!', style: EduConnectTextStyles.greetingBold),
          const SizedBox(height: 4),
          Text(
            'Un paso más a la excelencia académica.',
            style: EduConnectTextStyles.greetingSubtitle,
          ),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/hero_campus.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: EduConnectColors.accentGreen,
                ),
              ),
              Container(color: EduConnectColors.heroOverlay),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '50 Años de Excelencia',
                      style: EduConnectTextStyles.heroTitle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Conoce las actividades programadas para este mes de aniversario.',
                      style: EduConnectTextStyles.heroSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAccessSection extends StatelessWidget {
  const _QuickAccessSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ACCESOS RÁPIDOS', style: EduConnectTextStyles.sectionTitle),
          const SizedBox(height: 12),
          QuickAccessCard(
            icon: Icons.calendar_today_rounded,
            label: 'Mi Horario',
            iconBackgroundColor: EduConnectColors.iconBgGreen,
            iconColor: EduConnectColors.accentGreen,
          ),
          const SizedBox(height: 12),
          QuickAccessCard(
            icon: Icons.menu_book_rounded,
            label: 'Mis Materias',
            iconBackgroundColor: EduConnectColors.iconBgGreen,
            iconColor: EduConnectColors.accentGreen,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudentSubjectsPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          QuickAccessCard(
            icon: Icons.groups_rounded,
            label: 'Mis Compañeros',
            iconBackgroundColor: EduConnectColors.iconBgEmerald,
            iconColor: EduConnectColors.emeraldGreen,
          ),
          const SizedBox(height: 12),
          QuickAccessCard(
            icon: Icons.school_rounded,
            label: 'Mis Notas',
            iconBackgroundColor: EduConnectColors.iconBgEmerald,
            iconColor: EduConnectColors.emeraldGreen,
          ),
        ],
      ),
    );
  }
}
