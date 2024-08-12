
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/material.dart';

/// **Clase CustomButtonForm**
/// 
/// Este widget representa un botón personalizado que se puede usar en formularios.
/// El botón tiene un borde redondeado y un fondo azul. El texto del botón es blanco y en negrita.
///
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
/// final customButtonForm = CustomButtonForm(
///   buttonText: "Enviar formulario",
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
///         customButtonForm,
///       ],
///     ),
///   ),
/// );
/// ```
/// 
/// Este código creará un widget `CustomButtonForm` con el texto y la devolución de llamada dados. Cuando se presiona el botón, se llamará a la devolución de llamada `onPressed()`.

class CustomButtonForm extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButtonForm({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.fromContext(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Color.fromARGB(255, 255, 4, 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.3,
            fontSize: responsive.dp(responsive.isTablet ? 1.7 : 1.9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}