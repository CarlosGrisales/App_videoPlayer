import 'package:app_videoplayerpitch/ui/widgets/video_background.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// **Clase FullScreenPlayer**
///
/// Este widget se encarga de mostrar un video en pantalla completa. Utiliza el paquete `video_player`
/// para manejar la reproducción del video y permite pausar y reanudar la reproducción con un toque.
/// Además, muestra un texto de pie de foto superpuesto al video.
///
/// **Propiedades:**
/// - [videoUrl]: URL del video que se reproducirá.
/// - [caption]: Texto de pie de foto que se muestra en la parte inferior del video.
///
/// **Métodos:**
/// - [initState]: Inicializa el `VideoPlayerController` con la URL del video, establece el volumen y el bucle, y comienza la reproducción.
/// - [dispose]: Libera los recursos del `VideoPlayerController` para evitar fugas de memoria.
/// - [build]: Construye la interfaz de usuario, que incluye un `FutureBuilder` para manejar el estado de inicialización del video y mostrar el video y el pie de foto.
///
/// **Widgets Utilizados:**
/// - [FutureBuilder]: Widget que construye la interfaz de usuario en función del estado de inicialización del video.
/// - [GestureDetector]: Widget que detecta los toques para pausar o reanudar la reproducción del video.
/// - [AspectRatio]: Widget que mantiene la relación de aspecto del video.
/// - [Stack]: Widget que permite superponer varios widgets.
/// - [VideoPlayer]: Widget que muestra el video utilizando el `VideoPlayerController`.
/// - [VideoBackground]: Widget personalizado que muestra un fondo degradado sobre el video.
/// - [_VideoCaption]: Widget que muestra el pie de foto en la parte inferior del video.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return FullScreenPlayer(
///     videoUrl: 'https://example.com/video.mp4',
///     caption: 'Este es un pie de foto',
///   );
/// }
/// ```
class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videoUrl)
      ..setVolume(1.0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(controller),
                  // Gradiente
                  VideoBackground(
                    stops: const [0.8, 1.0],
                  ),
                  // Texto
                  Positioned(
                      bottom: 50,
                      left: 20,
                      child: _VideoCaption(
                        caption: widget.caption,
                      ))
                ],
              )),
        );
      },
    );
  }
}

/// **Widget _VideoCaption**
///
/// Este widget muestra el pie de foto del video en la parte inferior del mismo. El texto se ajusta al tamaño de la pantalla
/// y se muestra con un estilo que incluye color y opacidad.
///
/// **Propiedades:**
/// - [caption]: Texto del pie de foto que se mostrará.
///
/// **Métodos:**
/// - [build]: Construye la interfaz de usuario para mostrar el texto del pie de foto.
///
/// **Widgets Utilizados:**
/// - [SizedBox]: Widget que establece un tamaño fijo para el texto.
/// - [Text]: Widget que muestra el pie de foto con el estilo y tamaño adecuados.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return _VideoCaption(
///     caption: 'Este es un pie de foto',
///   );
/// }
/// ```
class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.white.withOpacity(0.8),
      );
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
