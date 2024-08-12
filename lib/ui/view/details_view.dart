import 'package:app_videoplayerpitch/models/details_response.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_appbar.dart';
import 'package:app_videoplayerpitch/ui/widgets/details_card.dart';
import 'package:app_videoplayerpitch/ui/widgets/full_screen_loader.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final Future<List<DatumResponse>> details;
  const DetailsView({super.key, required this.details});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DatumResponse>>(
        future: widget.details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DatumResponse> detail = snapshot.data!;
            return Container(
              color: Colors.white,
              child: ShowInfoView(infoDetails: detail),
            );
          } else if (snapshot.hasError) {
            // En caso de error, puedes mostrar un mensaje de error.
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: FullScreenLoader());
        },
      ),
    );
  }
}

class ShowInfoView extends StatelessWidget {
  final List<DatumResponse> infoDetails;
  const ShowInfoView({super.key, required this.infoDetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverAppBar(
        backgroundColor: const Color.fromARGB(255, 23, 26, 28),
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
              DetailCard(
                detail: infoDetails,
              ),
            ],
          );
        }, childCount: 1),
        // Número de elementos en la lista
      ),
    ]);
  }
}
