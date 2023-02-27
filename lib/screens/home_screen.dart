import 'package:flutter/material.dart';
import 'package:u3_peliculas/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          CardSwiper()
          // TODO: Listado horizontal de peliculas
        ],
      ),
    );
  }
}
