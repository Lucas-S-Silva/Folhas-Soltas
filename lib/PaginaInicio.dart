import 'package:flutter/material.dart';

import 'Categoria.dart';
import 'Livro.dart';
import 'PaginaLista.dart';

class PaginaInicio extends StatefulWidget{
  final List<Categoria> categorias;
  final List<Livro> livros;
  final Function(Livro) onAddLivro;
  final Function(Livro) onRemoveLivro;

  PaginaInicio({
    required this.categorias,
    required this.livros,
    required this.onAddLivro,
    required this.onRemoveLivro,
  });

  @override
  State<StatefulWidget> createState() {
    return _PaginaInicioState();
  }
}

class _PaginaInicioState extends State<PaginaInicio> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.categorias.length,
        child: buildScaffold(context));
    //return buildScaffold(context);
  }

  Scaffold buildScaffold(context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildTelaInicial(),
    );
  }

  AppBar buildAppBar() {
    List<Widget> abas = [];
    widget.categorias.forEach((c) {
      abas.add(Tab(child: Text(c.nome),)
      );
    });
    return AppBar(
        title: Text("Folhas Soltas"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar',
            onPressed: () {
              Navigator.pushNamed(context, '/formularioLivro').then((value){
                Livro novoLivro = value as Livro; // cast
                widget.onAddLivro(novoLivro);

                setState(() {

                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Livro inserido"),
                      behavior: SnackBarBehavior.floating,

                    )
                );
              });
            },
          ),
        ],
      bottom: TabBar(
        tabs: abas,
      ),
    );
  }

  Widget buildTelaInicial() {
    return TabBarView(
      children: [
        for (var categoria in widget.categorias)
          PaginaLista(categoria: categoria,livros: widget.livros),
      ],
    );
  }
}
