import 'package:flutter/material.dart';
import 'package:folhas_soltas/Categoria.dart';
import 'Livro.dart';

class PaginaLista extends StatelessWidget {
  final Categoria categoria;
  List<Livro> livros = [];
  PaginaLista({required this.categoria, required this.livros});


  @override
  Widget build(BuildContext context) {
    List<Livro> livrosFiltrados = [];

    for (var livro in livros) {
      if (livro.categoria == categoria.nome) {
        livrosFiltrados.add(livro);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lista de Livros",
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,       // duas colunas
          childAspectRatio: 2 / 3, // retângulo em pé
          children: [
            for (var livro in livrosFiltrados)
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("assets/img/${livro.nomeImg}.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
