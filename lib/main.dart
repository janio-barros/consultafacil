import 'package:consultafacil/view/menu.dart';
import 'package:consultafacil/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConsultaFacilApp());
}

class ConsultaFacilApp extends StatelessWidget {
  const ConsultaFacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/menu': (context) => const Menu(),
      },
    );
  }
}
