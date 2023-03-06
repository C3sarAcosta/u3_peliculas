import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la pelicula'),
      ),
      body: const Center(
        child: Text('Details Screen'),
      ),
    );
  }
}
