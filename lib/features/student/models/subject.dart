/// Modelo de datos de una materia académica asignada a un estudiante.
class Subject {
  final String title;
  final String professorName;
  final int progressPercent; // Valor entre 0 y 100
  final String imageAsset;

  const Subject({
    required this.title,
    required this.professorName,
    required this.progressPercent,
    required this.imageAsset,
  });
}
