
import 'package:app_videoplayerpitch/ui/widgets/custom_text.dart';
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/material.dart';

/// **Clase CustomButtonForm**
/// 
/// Este widget representa un botón personalizado que se puede usar en el Stepper.
/// El botón cuando esta activado tiene un borde redondeado y un fondo azul. El texto del botón es blanco y en negrita.
/// El botón cuando esta desactivado tiene un borde redondeado y un fondo gris. El texto del botón es blanco y en negrita.
/// Parámetros:
///
/// * `buttonText`: El texto del botón.
/// * `onPressed`: Un callback que se llama cuando se presiona el botón.
///
/// Métodos:
///
/// * `build()`: Crea la interfaz del widget.
///
///
/// Ejemplo de cómo usar el widget CustomButtonForm:
///
/// ```dart
/// final CustomButtonStepperts = CustomButtonStepperts(
///   buttonText: "Registrar",
///   onPressed: () {
///   },
/// );

/// return Scaffold(
///   appBar: AppBar(
///     title: Text("Formulario"),
///   ),
///   body: Padding(
///     padding: const EdgeInsets.all(15.0),
///     child: Column(
///       mainAxisAlignment: MainAxisAlignment.center,
///       crossAxisAlignment: CrossAxisAlignment.center,
///       children: [
///         CustomButtonStepperts,
///       ],
///     ),
///   ),
/// );
/// ```
/// 
/// Este código creará un widget `CustomButtonForm` con el texto y la devolución de llamada dados. Cuando se presiona el botón, se llamará a la devolución de llamada `onPressed()`.

class CustomButtonSteppert extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color color;
  final double wp;
  final double? sizeTitle;
  final Color? colorTitle;
  final bool? border;
  final double? mp;

  CustomButtonSteppert({
    required this.buttonText,
    required this.onPressed,
    required this.color,
    required this.wp,
    this.sizeTitle = 2.2,
    this.colorTitle = Colors.white, 
    this.border = false,
    this.mp = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.fromContext(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.hp(mp!)),
      width: responsive.wp(wp),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          side: border! ? BorderSide(color: Color(0xff767676), width: 0.5) : BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.symmetric(vertical: responsive.hp(1.4)),
        disabledColor: Colors.grey,
        color: color,
        child: CustomText(
          fontSize: sizeTitle!,
          text: buttonText,
          textColor: colorTitle!,
          isBold: true,
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}
