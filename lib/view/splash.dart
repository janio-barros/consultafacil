import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // executar após 5 segundos: abrir o menu
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/menu");
    });

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlutterLogo(size: 300),
            ],
          ),
        ),
      ),
    );
  }
}
