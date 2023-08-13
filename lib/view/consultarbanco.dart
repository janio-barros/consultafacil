import 'package:flutter/material.dart';

import '../model/banco.dart';

class ConsultarBanco extends StatefulWidget {
  final Banco banco;

  const ConsultarBanco({super.key, required this.banco});

  @override
  State<ConsultarBanco> createState() => _ConsultarBanco();
}

class _ConsultarBanco extends State<ConsultarBanco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bancos - Detalhe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ISBP:'),
            Text(
              widget.banco.ispb,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text('Nome:'),
            Text(
              widget.banco.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text('Nome Completo:'),
            Text(
              widget.banco.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text('Código:'),
            Text(
              widget.banco.code.toString().padLeft(3, '0'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
