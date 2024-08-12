import 'package:app_videoplayerpitch/models/details_response.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_appbar.dart';
import 'package:app_videoplayerpitch/ui/widgets/details_card.dart';
import 'package:app_videoplayerpitch/ui/widgets/full_screen_loader.dart';
import 'package:flutter/material.dart';

/// **Clase DetailsView**
///
/// Esta vista muestra detalles específicos de una entidad. Utiliza un `FutureBuilder` para
/// manejar el estado de la carga de datos, mostrando un indicador de carga mientras se obtienen los datos,
/// un mensaje de error si la carga falla, o el contenido de los detalles una vez que los datos se han cargado.
///
/// **Propiedades:**
/// - [details]: Un `Future` que representa la carga asíncrona de una lista de objetos `DatumResponse`.
///
/// **Métodos:**
/// - [build]: Construye la interfaz de usuario para mostrar la vista de detalles.
///
/// **Widgets Utilizados:**
/// - [FutureBuilder]: Widget que construye la interfaz de usuario en función del estado del futuro.
/// - [Container]: Widget de contenedor que envuelve la vista con un color de fondo.
/// - [ShowInfoView]: Widget personalizado para mostrar la información detallada.
/// - [FullScreenLoader]: Widget que muestra un indicador de carga a pantalla completa.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: DetailsView(
///       details: fetchDetails(), // Función que retorna un Future<List<DatumResponse>>.
///     ),
///   );
/// }
/// ```
/// 
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

/// **Clase ShowInfoView**
///
/// Esta vista muestra la información detallada utilizando un `CustomScrollView` con un `SliverAppBar`
/// y un `SliverList`. Muestra los detalles proporcionados a través de una lista de objetos `DatumResponse`.
///
/// **Propiedades:**
/// - [infoDetails]: Lista de objetos `DatumResponse` que contienen los detalles a mostrar.
///
/// **Métodos:**
/// - [build]: Construye la interfaz de usuario para mostrar la vista de información detallada.
///
/// **Widgets Utilizados:**
/// - [CustomScrollView]: Proporciona un área de desplazamiento personalizada que contiene otros widgets de desplazamiento.
/// - [SliverAppBar]: Barra de aplicación que se desplaza con el contenido y tiene un diseño flexible.
/// - [SliverList]: Lista de elementos desplazables.
/// - [DetailCard]: Widget personalizado para mostrar información detallada sobre un objeto `DatumResponse`.
/// - [CustomAppbar]: Widget personalizado que se muestra en la barra de aplicación.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return CustomScrollView(
///     slivers: [
///       SliverAppBar(
///         backgroundColor: Colors.black,
///         floating: true,
///         toolbarHeight: 130,
///         flexibleSpace: const FlexibleSpaceBar(
///           title: CustomAppbar(),
///         ),
///       ),
///       SliverList(
///         delegate: SliverChildBuilderDelegate(
///           (context, index) {
///             return DetailCard(
///               detail: infoDetails,
///             );
///           },
///           childCount: 1,
///         ),
///       ),
///     ],
///   );
/// }
/// ```
class ShowInfoView extends StatelessWidget {
  final List<DatumResponse> infoDetails;
  const ShowInfoView({super.key, required this.infoDetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
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
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  DetailCard(
                    detail: infoDetails,
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
