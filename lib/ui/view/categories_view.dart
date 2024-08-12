import 'package:app_videoplayerpitch/providers/categories_provider.dart';
import 'package:app_videoplayerpitch/ui/widgets/category_horizontal.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_appbar.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_foot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesVieState();
}

class _CategoriesVieState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
   
    final categories = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      body: CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
        SliverAppBar(
            backgroundColor: Color.fromARGB(255, 23, 26, 28),
            floating: true,
            toolbarHeight: 130,
            leading: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.star_border_outlined,
                        color: Colors.white30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
            ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MovieHorizontalListview(
                  categories: categories.data,
                  title: 'Categories',
                  subTitle: 'See all',
                ),
               const CustomFoot(),
              ],
              
            );
          }, childCount: 1),
          
        )
        
      ]),
    );
  }
}
