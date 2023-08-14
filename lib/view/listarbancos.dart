import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:consultafacil/view/consultarbanco.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/banco.dart';

class API {
  static Future getBancos() async {
    Uri url = Uri.parse('https://brasilapi.com.br/api/banks/v1');
    return await http.get(url);
  }
}

class ListarBancos extends StatefulWidget {
  const ListarBancos({super.key});

  @override
  State<ListarBancos> createState() => _ListarBancosState();
}

class _ListarBancosState extends State<ListarBancos> {
  /*Future<List<Banco>> get _getBancos async {
    Uri url = Uri.parse('https://brasilapi.com.br/api/banks/v1');
    List<Banco> bancos = [];
    var response = await http.get(url);
    var dados = json.decode(response.body) as List;
    for (var element in dados) {
      bancos.add(Banco.fromJson(element));
    }
    return bancos;
  }*/

  /*

    http.get(url).then((response) {
      var dados = json.decode(response.body) as List;
      for (var element in dados) {
        bancos.add(Banco.fromJson(element));
      }
    });
*/

  List<Banco> allBancos = [];
  List<Banco> bancos = [];

  /*_getBancos() {
    API.getBancos().then((response) {
      var dados = json.decode(response.body) as List;
      for (var element in dados) {
        allBancos.add(Banco.fromJson(element));
      }
      setState(() {
        bancos = allBancos.toList();
      });
    });
  }

  _ListarBancosState() {
    _getBancos();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bancos'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: filtrarBanco,
            ),
          ),
          Expanded(
            child: buildListview(),
          ),
        ],
      ),
    );
  }

  buildListview() {
    if (bancos.isEmpty) {
      API.getBancos().then((response) {
        //sleep(Duration(seconds: 10));
        var dados = json.decode(response.body) as List;
        for (var element in dados) {
          allBancos.add(Banco.fromJson(element));
        }
        setState(() {
          bancos = allBancos.toList();
        });
      });
    }

    if (bancos.isEmpty) {
      return LoadingAnimationWidget.newtonCradle(
        color: Colors.blue,
        size: 100,
      );

      //return const Center(
      //  child: Text(
      //    'carregando',
      //    style: TextStyle(fontSize: 30),
      //  ),
      //);
    } else {
      return ListView.builder(
        itemCount: bancos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
                'https://www49.bb.com.br/web-integrador/app/docs/comum/images/structure/header/logo.png'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(bancos[index].name),
                Text(
                  bancos[index].code.toString().padLeft(3, '0'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Text('${bancos[index].fullName}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ConsultarBanco(banco: bancos[index]);
                }),
              );
            },
          );
        },
      );
    }
  }

  void filtrarBanco(String query) {
    final filtrados = allBancos.where((banco) {
      final dado = banco.fullName.toLowerCase() +
          banco.name.toLowerCase() +
          banco.code.toString();
      final input = query.toLowerCase();
      return dado.contains(input);
    }).toList();

    setState(() {
      bancos = filtrados;
    });
  }
}


/*

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
*/