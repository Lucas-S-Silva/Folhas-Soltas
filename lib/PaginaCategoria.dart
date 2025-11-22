import 'package:flutter/material.dart';

import 'Categoria.dart';


class PaginaCategoria extends StatefulWidget{
  final List<Categoria> categorias;
  final Function(String) onAddCategoria;
  final Function(Categoria) onRemoveCategoria;

  PaginaCategoria({
    required this.categorias,
    required this.onAddCategoria,
    required this.onRemoveCategoria,
  });

  @override
  State<StatefulWidget> createState() {
    return _PaginaCategoriaState();
  }
}

class _PaginaCategoriaState extends State<PaginaCategoria> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildTelaCategoria(),
      floatingActionButton: ButtomAddCategoria(),
    );
  }

  AppBar buildAppBar(){
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
    );
  }

  Widget buildTelaCategoria() {
    return ListView.separated(
        itemBuilder: (context, i){
          final categoria = widget.categorias[i];
          return ListTile(
            leading: Icon(Icons.category),
            title: Text(categoria.nome),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                  widget.onRemoveCategoria(categoria);
              },
            ),
          );
        },
        separatorBuilder: (context,i){
          return Divider();
        },
        itemCount: widget.categorias.length);
  }

  FloatingActionButton ButtomAddCategoria(){
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          mostrarTelaAdicionarCategoria();
        }
    );
  }

  //  Teste

  Future<void> mostrarTelaAdicionarCategoria() {
    String NomeCategoria = '';
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Nova Categoria'),
          content: TextField(
            onChanged: (text) {
              NomeCategoria = text;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                final nome = NomeCategoria.trim();

                if (nome.isNotEmpty) {
                  widget.onAddCategoria(nome);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}