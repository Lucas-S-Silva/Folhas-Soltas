import 'package:flutter/material.dart';
import 'Categoria.dart';
import 'Formulario.dart';
import 'PaginaInicio.dart';
import 'PaginaCategoria.dart';

class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  int currentPageIndex = 0;

  // lista de categorias
  List<Categoria> categorias = [
    Categoria("Default"),
  ];

  void adicionarCategoria(String nome) {
    setState(() {
      categorias.add(Categoria(nome));
    });
  }

  void removerCategoria(Categoria categoria) {
    setState(() {
      categorias.remove(categoria);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/paginaInicio',
      routes: {
        '/paginaInicio': (context) => PaginaInicio(categorias: categorias),
        '/formulario': (context) => Formulario()
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: [
          PaginaInicio(
            categorias: categorias,
          ),
          PaginaCategoria(
            categorias: categorias,
            onAddCategoria: adicionarCategoria,
            onRemoveCategoria: removerCategoria,
          ),
        ][currentPageIndex],

        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (index) {
            setState(() => currentPageIndex = index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
            NavigationDestination(icon: Icon(Icons.explore), label: "Categoria"),
          ],
        ),
      ),
    );
  }
}
