import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edu_connect_colors.dart';

/// Estilos tipográficos extraídos del diseño de Figma "EduConnect"
/// (frame: student-dashboard, node-id: 2308:1458)
class EduConnectTextStyles {
  static TextStyle get brandTitle => GoogleFonts.tiroGurmukhi(
        fontSize: 18,
        color: EduConnectColors.brandGreen,
      );

  static TextStyle get helloLabel => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: EduConnectColors.textGray,
      );

  static TextStyle get userName => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: EduConnectColors.textDark,
      );

  static TextStyle get greetingLight => GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: EduConnectColors.textDark,
      );

  static TextStyle get greetingBold => GoogleFonts.sora(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: EduConnectColors.brandGreen,
      );

  static TextStyle get greetingSubtitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: EduConnectColors.textGray,
      );

  static TextStyle get heroTitle => GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );

  static TextStyle get heroSubtitle => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white.withValues(alpha: 0.9),
      );

  static TextStyle get sectionTitle => GoogleFonts.sora(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: EduConnectColors.accentGreen,
      );

  static TextStyle get cardTitle => GoogleFonts.sora(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: EduConnectColors.textDark,
      );

  // Estilos de la pantalla "Mis Materias" (Subject Card - node-id: 2308:1606)
  static TextStyle get pageTitle => GoogleFonts.sora(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: EduConnectColors.textDark,
      );

  static TextStyle get subjectTitle => GoogleFonts.sora(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: EduConnectColors.textDark,
      );

  static TextStyle get professorName => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: EduConnectColors.textGray,
      );

  static TextStyle get progressLabel => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: EduConnectColors.textGray,
      );

  static TextStyle get progressPercent => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: EduConnectColors.accentGreen,
      );
}
