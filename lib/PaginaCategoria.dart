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
          Navigator.pushNamed(context, '/formularioCategoria').then((value){
            Categoria novoCategoria = value as Categoria;
            widget.onAddCategoria(novoCategoria.nome);//Adiciona uma categoria

            setState(() {
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Categoria inserido"),
                  behavior: SnackBarBehavior.floating,
                )
            );
          });
        }
    );
  }
}