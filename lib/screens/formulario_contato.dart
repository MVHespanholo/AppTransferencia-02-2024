import 'package:flutter/material.dart';
import 'package:my_app/contato.dart';

class FormularioContato extends StatelessWidget {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEndereco = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerCpf = TextEditingController();

  FormularioContato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
                controlador: _controllerNome,
                rotulo: 'Nome',
                dica: 'Ex: João Silva'),
            Editor(
                controlador: _controllerEndereco,
                rotulo: 'Endereço',
                dica: 'Ex: Rua Tiradentes, 123'),
            Editor(
                controlador: _controllerTelefone,
                rotulo: 'Telefone',
                dica: 'Ex: (16) 91234-5678'),
            Editor(
                controlador: _controllerEmail,
                rotulo: 'Email',
                dica: 'Ex: joao@email.com'),
            Editor(
                controlador: _controllerCpf,
                rotulo: 'CPF',
                dica: 'Ex: 123.456.789-00'),
            ElevatedButton(
              onPressed: () {
                final contato = Contato(
                  _controllerNome.text,
                  _controllerEndereco.text,
                  _controllerTelefone.text,
                  _controllerEmail.text,
                  _controllerCpf.text,
                );
                Navigator.pop(context, contato);
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;

  const Editor({this.controlador, this.rotulo, this.dica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          hintStyle: const TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      ),
    );
  }
}
