import 'package:flutter/material.dart';
import 'package:folhas_soltas/Categoria.dart';
import 'Livro.dart';

class PaginaLista extends StatefulWidget {
  final Categoria categoria;
  List<Livro> livros = [];

  PaginaLista({required this.categoria, required this.livros});

  State<StatefulWidget> createState() {
    return _PaginaListaState();
  }
}
class _PaginaListaState extends State<PaginaLista>{
  @override
  Widget build(BuildContext context) {
    List<Livro> livrosFiltrados = [];

    for (var livro in widget.livros) {
      if (livro.categoria == widget.categoria.nome) {
        livrosFiltrados.add(livro);
      }
    }

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      children: [
        for (var livro in livrosFiltrados)
          Stack(
            children: [
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

              Positioned(
                right: 5,
                top: 5,
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    widget.livros.remove(livro);
                    setState(() {

                    });
                  },
                ),
              ),
              Positioned(
                left: 15,
                bottom: 10,
                  child: Text(
                    livro.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black,
                      color: Colors.white,
                    ),
                  ),
              ),
            ],
          ),
      ],
    );
  }
  }



