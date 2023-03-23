import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        //itemBuilder: (BuildContext context, int index){},
        itemBuilder: (_, int index) {
          final movie = movies[index];
          print(movie.posterPath);
          print(movie.fullPosterImg);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            //Widget para redondear los bordes
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              //FadeInImage Widget para hacer una animacion de entrada
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                //Tomar la forma del contenedor padre
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
