import 'package:app_videoplayerpitch/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

/// **Página de inicio de sesión (`LoginPage`).**
///
/// La página `LoginPage` es la interfaz principal para que los usuarios inicien sesión en la aplicación.
/// Contiene un formulario de inicio de sesión (`LoginForm`) y elementos visuales atractivos.
///
/// Widget Adicionales Utilizados:
///
/// * `build`: Construye el árbol de widgets y crea la interfaz de usuario de la página.
/// * `GestureDetector`: Detecta gestos del usuario para manejar eventos de toque.
/// * `SingleChildScrollView`: Permite el desplazamiento vertical de los elementos.
/// * `CustomText`: Widget personalizado para mostrar texto con estilos específicos.
/// * `CustomTextField`: Widget personalizado para un campo de entrada de texto.
/// * `CustomButtonForm`: Widget personalizado para un botón en un formulario.

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
   // final Responsive responsive = Responsive.fromContext(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      //GestureDetectos es para quitar el teclado el foco.
      //Single es para que al salir del teclado no se suba.
      //es necesario cambiar el infinito de el containes.
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //formulario de inicio de sesión.
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
