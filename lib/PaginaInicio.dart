import 'package:flutter/material.dart';

import 'Categoria.dart';
import 'Livro.dart';
import 'PaginaLista.dart';

class PaginaInicio extends StatefulWidget{
  final List<Categoria> categorias;

  PaginaInicio({required this.categorias});

  @override
  State<StatefulWidget> createState() {
    return _PaginaInicioState(categorias: categorias);
  }
}

class _PaginaInicioState extends State<PaginaInicio> {
  final List<Categoria> categorias;
  List<Livro> livros = [];

  _PaginaInicioState({required this.categorias});
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
              Navigator.pushNamed(context, '/formulario').then((value){
                Livro novoLivro = value as Livro; // cast
                livros.add(novoLivro);

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
        onTap: (indice) {
          Categoria selecionada = widget.categorias[indice];
        },
      ),
    );
  }

  Widget buildTelaInicial() {
    return TabBarView(
      children: [
        for (var categoria in widget.categorias)
          PaginaLista(categoria: categoria,livros: livros),
      ],
    );
  }
}
