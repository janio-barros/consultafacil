import 'package:consultafacil/view/consultarbanco.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/banco.dart';

class ListarBancos extends StatefulWidget {
  const ListarBancos({super.key});

  @override
  State<ListarBancos> createState() => _ListarBancosState();
}

class _ListarBancosState extends State<ListarBancos> {
  Future<List<Banco>> get _getBancos async {
    Uri url = Uri.parse('https://brasilapi.com.br/api/banks/v1');
    List<Banco> bancos = [];
    var response = await http.get(url);
    var dados = json.decode(response.body) as List;
    for (var element in dados) {
      bancos.add(Banco.fromJson(element));
    }
    return bancos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bancos'),
        ),
        body: FutureBuilder(
          future: _getBancos,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  'Carregando...',
                  style: TextStyle(fontSize: 30),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                          'https://www49.bb.com.br/web-integrador/app/docs/comum/images/structure/header/logo.png'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data![index].name),
                          Text(
                            snapshot.data![index].code
                                .toString()
                                .padLeft(3, '0'),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text('${snapshot.data?[index].fullName}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ConsultarBanco(banco: snapshot.data![index]);
                          }),
                        );
                      },
                    );
                  });
            }
          },
        ));
  }
}
