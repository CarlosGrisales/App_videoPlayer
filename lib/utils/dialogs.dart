import 'package:app_videoplayerpitch/ui/widgets/custom_button_stepper.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_text.dart';
import 'package:app_videoplayerpitch/ui/widgets/full_screen_loader.dart';
import 'package:app_videoplayerpitch/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return WillPopScope(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: const Center(
              child: FullScreenLoader(),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static dissmiss(BuildContext context) {
    Navigator.pop(context);
  }
}

/// **Atributos**
/// - `context`: Variable que almacena el registo del arbol de widget.
/// - `isServer`: Varible booleana si es false muestra el mensaje de error de conexion, si es true mensaje de error de servidor
/// Este dialog se utiliza para indicar que hubo un problema de conexion o del servidor

Future dialogError({required BuildContext context, bool isServer = true}) {
  final Responsive responsive = Responsive.fromContext(context);
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: responsive.wp(4), vertical: responsive.hp(2)),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        size: 27,
                        color: Color(0xff767676),
                      )),
                ),
                SizedBox(
                  height: responsive.hp(1.7),
                ),
                CustomText(
                  text: isServer
                      ? 'Error de conexión'
                      : 'Sin conexión a internet',
                  fontSize: 2.2,
                  textColor: const Color(0xffFE5000),
                  textAlign: TextAlign.center,
                  isBold: true,
                ),
                SizedBox(
                  height: responsive.hp(2),
                ),
                CustomText(
                  text: isServer
                      ? 'Por favor, inténtalo de nuevo más tarde. Si el problema persiste, comuníquese con nuestro equipo de soporte.'
                      : 'Por favor, verifica tu conexión a internet e inténtalo de nuevo.',
                  fontSize: 1.9,
                  textColor: const Color(0xff767676),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                isServer
                    ? CustomButtonSteppert(
                        buttonText: 'Ok',
                        colorTitle: const Color(0xff767676),
                        onPressed: () => Navigator.pop(context),
                        color: Colors.white,
                        wp: 70,
                        border: true,
                      )
                    : SvgPicture.asset(
                        'assets/errorConexion.svg',
                        color: const Color(0xffFE5000),
                        height: responsive.hp(15),
                        width: responsive.wp(17),
                      ),
                SizedBox(
                  height: responsive.hp(1.5),
                ),
              ],
            ),
          ),
        );
      });
}


