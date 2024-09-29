import 'package:flutter/material.dart';
import 'formulario_contato.dart';
import 'package:my_app/contato.dart';

class ListaContatos extends StatefulWidget {
  final List<Contato> _contatos = [];

  ListaContatos({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, index) {
          final contato = widget._contatos[index];
          return ListTile(
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contato?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioContato();
          }));
          future.then((contatoRecebido) {
            setState(() {
              widget._contatos.add(contatoRecebido!);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
