import 'package:flutter/material.dart';
import '../../../../core/theme/edu_connect_colors.dart';
import '../../../../core/theme/edu_connect_text_styles.dart';
import '../../../../shared/widgets/subject_card.dart';
import '../../models/subject.dart';

/// Pantalla "Mis Materias" del estudiante: lista las asignaturas asignadas
/// junto con su docente y el progreso académico.
/// (Figma: "Subject Cards", node-id: 2308:1606)
class StudentSubjectsPage extends StatelessWidget {
  const StudentSubjectsPage({super.key});

  static const List<Subject> _subjects = [
    Subject(
      title: 'Matemáticas Especiales',
      professorName: 'Prof. Alberto Reyes',
      progressPercent: 82,
      imageAsset: 'assets/images/subject_math.png',
    ),
    Subject(
      title: 'Idiomas y Lenguaje',
      professorName: 'Dra. Carmen Ospina',
      progressPercent: 74,
      imageAsset: 'assets/images/subject_languages.png',
    ),
    Subject(
      title: 'Historia Universal',
      professorName: 'Prof. Jaime Pumarejo',
      progressPercent: 90,
      imageAsset: 'assets/images/subject_history.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EduConnectColors.pageBackground,
      appBar: AppBar(
        backgroundColor: EduConnectColors.pageBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: EduConnectColors.textDark,
        title: Text('Mis Materias', style: EduConnectTextStyles.pageTitle),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        itemCount: _subjects.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final subject = _subjects[index];
          return SubjectCard(
            title: subject.title,
            professorName: subject.professorName,
            progressPercent: subject.progressPercent,
            imageAsset: subject.imageAsset,
          );
        },
      ),
    );
  }
}
