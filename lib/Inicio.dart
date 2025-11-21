import 'package:flutter/material.dart';


class Inicio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InicioState();
  }
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: buildScaffold(context));
    //return buildScaffold(context);
  }

  Scaffold buildScaffold(context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildTabBar(context)
    );
  }

  AppBar buildAppBar() {
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
        tabs: [
          Tab(child: Text("Default")),
          Tab(child: Text("Teste")),
        ],
      ),
    );
  }
    @override
    Widget buildTabBar(context) {
      return TabBarView(
            children:[
              Center(child: Text("Começo")),
              Center(child: Text("Teste")),
            ],
      );
    }
}
