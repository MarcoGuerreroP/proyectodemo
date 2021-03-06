import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectodemo/utils/theme.dart';
import 'package:proyectodemo/widgets/screens/details_movie_screen.dart';
import 'package:proyectodemo/widgets/screens/home_screen.dart';
import 'package:proyectodemo/widgets/screens/splash_screen.dart';
import 'flavors_config.dart';
import 'services/movies_provider.dart';

void main() {
  FlavorsConfig.instance.init(
      appbarName: 'Catalago de Peliculas',
      primaryColor: const Color.fromARGB(255, 233, 110, 44),
      secundaryColor: Colors.lightBlue,
      iconflavor: const Icon(Icons.rocket_launch));
  runApp(const MyAppState());
}

class MyAppState extends StatelessWidget {
  const MyAppState({Key key}) : super(key: key);

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
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        location: BannerLocation.topEnd,
        message: 'PROD',
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Catalago de Peliculas DEMO',
          initialRoute: 'splash_screen',
          routes: {
            'home_screen': (_) => const HomeScreen(),
            'splash_screen': (_) => const SplashScreen(),
            'details_screen': (_) => const DetailsScreen(),
          },
          theme: themeDataDark,
        ),
      ),
    );
  }
}
