import 'package:flutter/material.dart';
import 'package:folhas_soltas/Livro.dart';

class Formulario extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nomeController = TextEditingController();
  var categoriaController = TextEditingController();
  var nomeImgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFAB(context),
      body: buildForm(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Novo Livro"));
  }

  FloatingActionButton buildFAB(context) {
    return FloatingActionButton(onPressed: () {
      if (formKey.currentState!.validate()) {
        String nome = nomeController.text;
        String categoria = categoriaController.text;
        String nomeImg = nomeImgController.text;

        Livro novoLivro = Livro(nome, categoria, nomeImg);
        try {
          Navigator.pop(context, novoLivro);
        }catch(e){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString()),
                behavior: SnackBarBehavior.floating,

              )
          );
        }
      }
    },
        child: Icon(Icons.add));
  }

  Form buildForm() {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "Nome"),
              validator: (nome) {
                if (nome == null || nome.isEmpty) {
                  return "Nome é obrigatório";
                }
              },
            ),
            TextFormField(
              controller: categoriaController,
              decoration: InputDecoration(labelText: "Categoria"),
              validator: (categoria) {
                if (categoria == null || categoria.isEmpty) {
                  return "Categoria é obrigatório";
                }
              },
            ),
            TextFormField(
              controller: nomeImgController,
              decoration: InputDecoration(labelText: "Nome da Img"),
              validator: (nomeImg) {
                if (nomeImg == null || nomeImg.isEmpty) {
                  return "Nome da Img é obrigatório, caso não tenha coloque 'default'";
                }

              },
            )
          ],
        ),
      ),
    );
  }
}