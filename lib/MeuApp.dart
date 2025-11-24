import 'package:flutter/material.dart';
import 'package:folhas_soltas/FormularioCategoria.dart';
import 'Categoria.dart';
import 'FormularioLivro.dart';
import 'Livro.dart';
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

    // lista de Livros
  List<Livro> livros = [];

  void adicionarLivro(Livro livro) {
    setState(() {
      livros.add(livro);
    });
  }
  void removerLivro(Livro livro) {
    setState(() {
      livros.remove(livro);
    });
  }

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
      initialRoute: '/',
      routes: {
        '/paginaInicio': (context) => PaginaInicio(
            categorias: categorias,
            livros: livros,
            onAddLivro: adicionarLivro,
            onRemoveLivro: removerLivro
        ),
        '/formularioLivro': (context) => FormularioLivro(),
        '/formularioCategoria': (context) => FormularioCategoria()
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: [
          PaginaInicio(
            categorias: categorias,
            livros: livros,
            onAddLivro: adicionarLivro,
            onRemoveLivro: removerLivro
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
