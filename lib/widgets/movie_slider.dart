import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          //Si no lo pongo mostrara error ya que la columna no sabe que tamaño es
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

//Se usa _ para determinar que es privado
class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Cupidatat amet dolore eu aute ad duis mollit sint exercitation incididunt esse quis in qui.',
            //Numero de lineas a mostrar
            maxLines: 3,
            //Puntos supensivos cuando el texto ya no cabe
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
