import 'package:flutter/material.dart';
import '../../core/theme/edu_connect_colors.dart';
import '../../core/theme/edu_connect_text_styles.dart';

/// Tarjeta reutilizable que muestra una materia asignada a un estudiante,
/// junto con su profesor a cargo y el progreso académico.
/// (Figma: "Subject Card", node-id: 2308:1607)
class SubjectCard extends StatelessWidget {
  final String title;
  final String professorName;
  final int progressPercent;
  final String imageAsset;
  final VoidCallback? onTap;

  const SubjectCard({
    super.key,
    required this.title,
    required this.professorName,
    required this.progressPercent,
    required this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: EduConnectColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: EduConnectColors.cardBorder),
            boxShadow: const [
              BoxShadow(
                color: EduConnectColors.cardShadow,
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _MediaArea(imageAsset: imageAsset),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: EduConnectTextStyles.subjectTitle),
                    const SizedBox(height: 2),
                    Text(
                      professorName,
                      style: EduConnectTextStyles.professorName,
                    ),
                    const SizedBox(height: 10),
                    _ProgressSection(progressPercent: progressPercent),
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

class _MediaArea extends StatelessWidget {
  final String imageAsset;

  const _MediaArea({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: EduConnectColors.accentGreen,
              child: const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          Container(color: EduConnectColors.mediaOverlay),
        ],
      ),
    );
  }
}

class _ProgressSection extends StatelessWidget {
  final int progressPercent;

  const _ProgressSection({required this.progressPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progreso académico',
              style: EduConnectTextStyles.progressLabel,
            ),
            Text('$progressPercent%', style: EduConnectTextStyles.progressPercent),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: (progressPercent.clamp(0, 100)) / 100,
            minHeight: 6,
            backgroundColor: EduConnectColors.progressTrackBackground,
            valueColor: const AlwaysStoppedAnimation<Color>(
              EduConnectColors.accentGreen,
            ),
          ),
        ),
      ],
    );
  }
}
