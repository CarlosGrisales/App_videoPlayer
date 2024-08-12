import 'package:app_videoplayerpitch/ui/widgets/video_background.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


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
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(widget.videoUrl)
      ..setVolume(1.0)
      ..setLooping(true)
      ..play();
  }

  @override
  //esto se hace para evitar que el video se siga repoducciendo y no tenga fuga de memoria
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
                  //gradiente
                  VideoBackground(
                    stops: const[0.8,1.0],
                  ),
 
                  //texto
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

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    //tamaños que se ajustan a la pantalla
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.white.withOpacity(0.8), // Ajusta el color y la opacidad aquí
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
