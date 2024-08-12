import 'package:animate_do/animate_do.dart';
import 'package:app_videoplayerpitch/controllers/detail_controller.dart';
import 'package:app_videoplayerpitch/models/categories_response.dart';
import 'package:app_videoplayerpitch/ui/view/details_view.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<CategoriesModel> categories;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.categories,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Column(
        children: [
          if (title != null && subTitle != null)
            _Title(
              title: title!,
              subTitle: subTitle!,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _Slide(
                  categories: categories[index],
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
  final CategoriesModel categories;
  const _Slide({required this.categories});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                categories.image != "" 
                ? categories.image 
                :'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
                fit: BoxFit.cover,
                width: 150,
                height: 250,
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
                    onTap: () {
                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsView(
                                        details: DetailsController()
                                            .getDetailsPitch(context: context, route: categories.url)
                                      ),
                                    ),
                                  );
                    },
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5), // Corregir de width a height
          //* Título
          SizedBox(
            width: 150,
            child: Text(
              categories.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle.titleSmall,
            ),
          ),
          //* Rating
          Row(
            children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.yellow.shade800,
              ),
              const SizedBox(width: 2),
              Text(
                categories.count.toString(),
                style: TextStyle(
                  color: Colors.yellow.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String subTitle;
  const _Title({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              subTitle,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
