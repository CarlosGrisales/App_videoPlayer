

import 'package:app_videoplayerpitch/providers/categories_provider.dart';
import 'package:app_videoplayerpitch/ui/view/categories_view.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_button_form.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_text.dart';
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// **Widget LoginForm**
///
/// Este widget representa un formulario de inicio de sesión personalizado.
/// El formulario incluye una conexión con el authentication de microsoft el cual permite mantener la sesion iniciada y un botón de envío el cual conecta con el metodo submit.
///
/// Métodos:
///
/// * `build()`: Crea la interfaz del widget.
/// * `initState()`: Inicia las variables de estado para la autenticación con microsoft.
/// * `_submit()`: llama al controlador de autenticación de microsoft para iniciar sesión.
///
/// Ejemplo de cómo usar el widget LoginForm:
///
/// ```dart
/// final loginForm = LoginForm();
///
/// return Scaffold(
///   appBar: AppBar(
///     title: Text("Iniciar sesión"),
///   ),
///   body: loginForm,
/// );
///```
///
/// Este código creará un widget `LoginForm` con la configuración predeterminada.
class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final Responsive responsive = Responsive.fromContext(context);

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Ingresa a tu cuenta",
                    fontSize: 2.5,
                    textColor: Colors.black,
                    isBold: true,
                  ),
                  SizedBox(
                    height: responsive.dp(4),
                  ),
                  CustomText(
                    text:
                        "Inicia sesión para comenzar una experiencia unica por nuestra app video player pitch",
                    fontSize: 1.8,
                    textColor: Colors.black38,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: responsive.dp(8)),
              CustomButtonForm(
                buttonText: 'Iniciar sesión',
                onPressed: () async {
                                await categoriesProvider.getCategory();
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CategoriesView(
                                      ),
                                    ));
                              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
