
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// **Widget CustomText**
/// 
/// Este widget representa un texto personalizado que se puede usar en cualquier lugar de la aplicación.
///  El texto tiene una fuente específica (Urbanist), un tamaño de fuente configurable, un color configurable y un estilo de fuente configurable (negrita o normal).
///
/// Parámetros:
///
/// * `text`: El texto que se mostrará.
/// * `fontSize`: El tamaño de la fuente del texto.
/// * `textColor`: El color del texto.
/// * `isBold`: Un valor booleano que indica si el texto debe ser en negrita o no.
/// * `textAlign`: La alineación del texto.
///
/// Métodos:
///
/// * `build()`: Crea la interfaz del widget.
///
/// Ejemplo de cómo usar el widget CustomText:
///
/// ```dart
/// final customText = CustomText(
///   text: "Este es un texto personalizado.",
///   fontSize: 2.0,
///   textColor: Colors.black,
///   isBold: true,
///   textAlign: TextAlign.center,
/// );

/// return Scaffold(
///   appBar: AppBar(
///     title: Text("Texto personalizado"),
///   ),
///   body: Center(
///     child: customText,
///   ),
/// );
/// ```
///
/// Este código creará un widget `CustomText` con el texto, el tamaño de la fuente, el color de la fuente, el estilo de la fuente y la alineación dados.
class CustomText extends StatelessWidget {
 
  final String text;
  final double fontSize;
  final Color textColor;
  final bool isBold;
  final TextAlign? textAlign;

 
  CustomText({
    required this.text,
    required this.fontSize,
    required this.textColor,
    this.isBold = false,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.fromContext(context);

    return Text(
      text,
      style: GoogleFonts.urbanist(
        textStyle: Theme.of(context).textTheme.headlineMedium,
        fontSize: responsive.dp(fontSize),
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}
