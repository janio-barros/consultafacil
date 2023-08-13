import 'package:flutter/material.dart';

class ConsultarCep extends StatelessWidget {
  const ConsultarCep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta Fácil - CEP'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.back_hand_outlined),
          ),
        ],
      ),
    );
  }
}
