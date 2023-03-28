import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u3_peliculas/providers/movies_provider.dart';
import 'package:u3_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Colocamos la instancia de MoviesProvider en mi variable moviesProvider
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        //Quitar la sombra del app bar
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
        title: const Center(
          child: Text('Películas en cines'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Peliculas en cartelera
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Peliculas  slider
            MovieSlider(
              movies: moviesProvider.popularlayMovies,
              title: 'Populares',
            ),
          ],
        ),
      ),
    );
  }
}
