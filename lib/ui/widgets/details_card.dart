import 'package:animate_do/animate_do.dart';
import 'package:app_videoplayerpitch/models/details_response.dart';
import 'package:app_videoplayerpitch/ui/view/fullscreen_player.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_button_form.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final List<DatumResponse> detail;

  const DetailCard({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: detail.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _Slide(
                  detail: detail[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final DatumResponse detail;
  const _Slide({required this.detail});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          Row(
            children: [
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    detail.avatar != ""
                        ? detail.avatar
                        : 'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                    loadingBuilder: (context, child, loadingProgess) {
                      if (loadingProgess != null) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {},
                        child: FadeIn(child: child),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      width:150,
                      child: CustomText(
                        text: detail.name,
                        fontSize: 2,
                        textColor: Colors.red,
                        isBold: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: Text(
                        detail.desiredRole,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5), // Corregir de width a height
          Wrap(
            children: [
              ...detail.skills.map((skill) => Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text(
                        skill,
                        style: TextStyle(fontSize: 12),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              CustomText(
                text: 'Pitches',
                fontSize: 2,
                textColor: Colors.black,
                isBold: true,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.note_alt_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.play_circle))
            ],
          ),
          const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Text(
                        detail.about,
                        maxLines: 3,
                      ),
                    ),
          const SizedBox(height: 12),
          CustomButtonForm(
              buttonText: "Ver video",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenPlayer(
                          videoUrl: detail.video, caption: detail.slug)),
                );
              }),
              const SizedBox(height: 20),
             const  Divider(
               color: Colors.grey,
        thickness: 1.0,
             )
              
        ],
      ),
    );
  }
}
