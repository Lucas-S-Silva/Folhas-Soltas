import 'package:flutter/material.dart';

import 'Categoria.dart';

class FormularioCategoria extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFAB(context),
      body: buildForm(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Novo Categoria"));
  }

  FloatingActionButton buildFAB(context) {
    return FloatingActionButton(onPressed: () {
      if (formKey.currentState!.validate()) { // Chama o validador linha 53
        String nome = nomeController.text;

        Categoria novoCategoria = Categoria(nome);
        try {
          Navigator.pop(context, novoCategoria);
        }catch(e){
          ScaffoldMessenger.of(context).showSnackBar( //Mensagem categoria inserida: PaginaCategoria Linha 70
              SnackBar(content: Text(e.toString()),
                behavior: SnackBarBehavior.floating,

              )
          );
        }
      }
    },
        child: Icon(Icons.check));
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
                if (nome == null || nome.isEmpty) { //Validação se o campo esta vazio.
                  return "Nome é obrigatório";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}