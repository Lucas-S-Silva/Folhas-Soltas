import 'package:flutter/material.dart';

import 'Categoria.dart';

class PaginaInicio extends StatefulWidget{
  final List<Categoria> categorias;

  PaginaInicio({required this.categorias});

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
      abas.add(Tab(child: Text(c.nome))
      );
    });
    return AppBar(
        title: Text("Folhas Soltas"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Pesquisar',
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            tooltip: 'Filtrar',
            onPressed: () {

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
        Center(
          child: Text(
            "Conteúdo da categoria:",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
