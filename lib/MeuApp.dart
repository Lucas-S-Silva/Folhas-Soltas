import 'package:flutter/material.dart';
import 'package:folhas_soltas/Inicio.dart';

class MeuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=>Inicio()
        }
    );
  }
}