import 'package:buscador_gifs/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(AppBuscadorGifs());

class AppBuscadorGifs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(hintColor: Colors.white),
    );
  }
}