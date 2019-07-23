import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request = 'https://api.hgbrasil.com/finance?key=35e22250';

void main() async {
  http.Response reponse = await http.get(request);
  print(json.decode(reponse.body)['results']['currencies']);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ConversorMoedas(),
    theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white
    ),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class ConversorMoedas extends StatefulWidget {
  @override
  _ConversorMoedasState createState() => _ConversorMoedasState();
}

class _ConversorMoedasState extends State<ConversorMoedas> {

  double dolar;
  double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('\$ Concersor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Carregando Dados...',
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carregar dados:(',
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data['results']['currencies']['USD']['buy'];
                euro = snapshot.data['results']['currencies']['EUR']['buy'];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on, size: 150.0, color: Colors.amber,),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Real',
                          labelStyle: TextStyle(color: Colors.amber),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).hintColor)
                          ),
                          prefixText: 'R\$'
                        ),
                        style: TextStyle(
                          color: Colors.amber, fontSize: 25.0
                        ),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Dólar',
                          labelStyle: TextStyle(color: Colors.amber),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).hintColor)
                          ),
                          prefixText: 'US\$'
                        ),
                        style: TextStyle(
                          color: Colors.amber, fontSize: 25.0
                        ),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Euro',
                          labelStyle: TextStyle(color: Colors.amber),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).hintColor)
                          ),
                          prefixText: '€\$'
                        ),
                        style: TextStyle(
                          color: Colors.amber, fontSize: 25.0
                        ),
                      ),                                            
                    ],),
                );
              }
          }
        },
      ),
    );
  }
}
