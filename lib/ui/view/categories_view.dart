import 'package:app_videoplayerpitch/providers/categories_provider.dart';
import 'package:app_videoplayerpitch/ui/widgets/category_horizontal.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_appbar.dart';
import 'package:app_videoplayerpitch/ui/widgets/custom_foot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// **Clase CategoriesView**
///
/// Vista que muestra una lista de categorías usando un `CustomScrollView` con un `SliverAppBar`
/// y un `SliverList`. Esta vista está integrada con el `CategoriesProvider` para obtener y mostrar
/// datos relacionados con las categorías.
///
/// **Métodos:**
/// - [build]: Construye la interfaz de usuario para mostrar la vista de categorías.
///
/// **Widgets Utilizados:**
/// - [CustomScrollView]: Proporciona un área de desplazamiento personalizada que contiene otros widgets de desplazamiento.
/// - [SliverAppBar]: Barra de aplicación que se desplaza con el contenido y tiene un diseño flexible.
/// - [SliverList]: Lista de elementos desplazables.
/// - [MovieHorizontalListview]: Widget personalizado para mostrar una lista horizontal de categorías.
/// - [CustomFoot]: Widget de pie de página personalizado.
///
/// **Ejemplo de Uso:**
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: CategoriesView(),
///   );
/// }
/// ```
/// 
/// **Propiedades del `SliverAppBar`:**
/// - [backgroundColor]: Color de fondo del `SliverAppBar`.
/// - [floating]: Determina si la barra de aplicación flota sobre el contenido.
/// - [toolbarHeight]: Altura del área de la barra de herramientas.
/// - [leading]: Widget que se muestra en el lado izquierdo del `SliverAppBar`.
/// - [flexibleSpace]: Espacio flexible que contiene el `CustomAppbar` como título.
///
/// **Propiedades del `SliverList`:**
/// - [delegate]: Un `SliverChildBuilderDelegate` que construye los elementos de la lista.
///   - El índice del `SliverChildBuilderDelegate` se utiliza para construir el `MovieHorizontalListview`
///     y el `CustomFoot` en una columna.
///   - **childCount**: Número de elementos en la lista (en este caso, 1).
///
class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesVieState();
}

class _CategoriesVieState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    // Obtiene la instancia del CategoriesProvider desde el contexto
    final categories = Provider.of<CategoriesProvider>(context);

    // Construye la interfaz de usuario
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
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
            delegate: SliverChildBuilderDelegate(
              (context, index) {
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
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
