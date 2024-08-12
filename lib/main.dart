import 'package:app_videoplayerpitch/providers/categories_provider.dart';
import 'package:app_videoplayerpitch/ui/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// **Clase Main.**
///
/// Esta clase define la estructura principal de la aplicación, incluyendo el tema, las rutas y el widget principal.
/// Proporciona proveedores de estado para la aplicación.
/// 
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'App Video Player',
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Center(
          child: Container(
            color: Colors.white, // Cambia al color que desees
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: LoginPage(),
            ),
          ),
        ),
      ),
    );
  }
}