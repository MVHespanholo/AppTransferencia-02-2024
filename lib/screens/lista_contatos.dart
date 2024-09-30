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
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 53, 16, 141),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.grey),
              title: Text(
                contato.nome,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telefone: ${contato.telefone}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Endereço: ${contato.endereco}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Email: ${contato.email}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'CPF: ${contato.cpf}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
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
