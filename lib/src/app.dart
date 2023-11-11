import 'package:flutter/material.dart';
import 'package:pogos_app/src/screens/animal_card_screen.dart';
import 'package:pogos_app/src/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/animal_card_screen') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const AnimalCardScreen(),
          );
        }
      },
      home: const PogosAppHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
