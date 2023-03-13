import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u3_peliculas/providers/movies_provider.dart';
import 'package:u3_peliculas/screens/screens.dart';

//El provider es creado de manera perezosa, hasta que algun widget lo necesite
//Se crea la instancia, por eso ponemos lazy: false, para que se
//cree en cuanto inicie la aplicacion
void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
