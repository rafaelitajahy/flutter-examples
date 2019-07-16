import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    debugShowCheckedModeBanner: false,
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Pessoas: 0", 
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("+1", style: TextStyle(fontSize: 40.0, color: Colors.white),),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.white),),
              onPressed: (){},
            ),

          ],
        ),
        Text("Pode Entrar!", 
        style: TextStyle(color: Colors.white, 
            fontStyle: FontStyle.italic,
            fontSize: 30.0),
        ),
      ],
    ), 
  ));  
}