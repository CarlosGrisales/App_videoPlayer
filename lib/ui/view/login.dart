import 'package:app_videoplayerpitch/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

/// **Página de Inicio de Sesión (`LoginPage`)**
///
/// La página `LoginPage` es la interfaz principal para que los usuarios inicien sesión en la aplicación.
/// Contiene un formulario de inicio de sesión (`LoginForm`) y proporciona una interfaz de usuario básica y funcional.
///
/// **Propiedades:**
/// - [key]: Clave opcional para el widget, utilizada para identificar y manipular el widget en el árbol de widgets.
///
/// **Métodos:**
/// - [build]: Construye la interfaz de usuario de la página. Utiliza un `GestureDetector` para ocultar el teclado cuando el usuario toca fuera del campo de entrada.
///   Además, envuelve el contenido en un `SingleChildScrollView` para permitir el desplazamiento vertical si el teclado está visible.
///
/// **Widgets Utilizados:**
/// - [GestureDetector]: Detecta gestos del usuario para manejar eventos de toque y ocultar el teclado al tocar fuera del campo de entrada.
/// - [Padding]: Añade un relleno alrededor del contenedor.
/// - [Container]: Proporciona un contenedor con color de fondo blanco y tamaño ajustable.
/// - [Column]: Organiza los widgets en una columna vertical.
/// - [LoginForm]: Widget personalizado que muestra el formulario de inicio de sesión.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return LoginPage();
/// }
/// ```
class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      // GestureDetector es utilizado para quitar el foco del teclado cuando se toca fuera del campo de entrada.
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Formulario de inicio de sesión.
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
