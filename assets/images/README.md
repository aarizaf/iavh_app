# 🖼️ Carpeta de Imágenes - Logo AFData

## 📋 Para agregar tu logo personalizado:

### Opción 1: Logo personalizado (Recomendado)
1. **Copia tu imagen** a esta carpeta exactamente con el nombre: `logo.png`
2. **Tamaño recomendado**: 256x256 píxeles o mayor (cuadrada)
3. **Formato**: PNG preferiblemente (para transparencia)
4. **Modifica el código** en `lib/main.dart`:
   - Ve al método `_buildLogoImage()`
   - Descomenta el código que está comentado (líneas con /* */)
   - Comenta el código actual que muestra "AF"

### Opción 2: Mantener logo actual
- El logo actual muestra "AF" con un icono de escuela
- Se ve bien y es consistente con el tema de la app
- No necesitas hacer nada adicional

### 🔧 Cómo activar tu imagen personalizada:

1. **Agrega tu imagen** como `logo.png` en esta carpeta
2. **Abre** `lib/main.dart`
3. **Busca** el método `_buildLogoImage()`
4. **Reemplaza** el contenido actual con este código:

```dart
Widget _buildLogoImage() {
  return Image.asset(
    'assets/images/logo.png',
    width: 80.w,
    height: 80.w,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      // Si no encuentra la imagen, muestra el logo por defecto
      return Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2E7D32),
              Color(0xFF66BB6A),
            ],
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school_rounded, color: Colors.white, size: 32),
            SizedBox(height: 4),
            Text('AF', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    },
  );
}
```

### 🎨 Estado actual:
- ✅ **Logo por defecto activo**: Muestra "AF" con icono escolar
- ✅ **Posición perfecta**: Centrado en el formulario de login
- ✅ **Diseño moderno**: Círculo con gradiente verde y animación
- ✅ **Sin errores**: No intenta cargar imágenes inexistentes

### 📱 Resultado:
Tu logo aparece:
- En forma circular dentro del formulario
- Con animación de pulso elegante
- Bien espaciado de los campos de texto
- Con sombras y efectos modernos

---
*El logo actual funciona perfectamente. Solo cambia si tienes una imagen específica que quieres usar.*
