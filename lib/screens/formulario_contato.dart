import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                dica: 'Ex: (16) 91234-5678',
                tipoTeclado: TextInputType.phone,
                formatoEntrada: FilteringTextInputFormatter.digitsOnly),
            Editor(
                controlador: _controllerEmail,
                rotulo: 'Email',
                dica: 'Ex: joao@email.com'),
            Editor(
                controlador: _controllerCpf,
                rotulo: 'CPF',
                dica: 'Ex: 123.456.789-00',
                tipoTeclado: TextInputType.number,
                formatoEntrada: FilteringTextInputFormatter.digitsOnly),
            ElevatedButton(
              onPressed: () {
                if (_controllerNome.text.isEmpty ||
                    _controllerEndereco.text.isEmpty ||
                    _controllerTelefone.text.isEmpty ||
                    _controllerEmail.text.isEmpty ||
                    _controllerCpf.text.isEmpty) {
                  _exibirAlerta(context);
                } else {
                  final contato = Contato(
                    _controllerNome.text,
                    _controllerEndereco.text,
                    _controllerTelefone.text,
                    _controllerEmail.text,
                    _controllerCpf.text,
                  );
                  Navigator.pop(context, contato);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 53, 16, 141),
                foregroundColor: Colors.white,
              ),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void _exibirAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Campos obrigatórios"),
          content: const Text("Por favor, preencha todos os campos."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final TextInputType? tipoTeclado;
  final TextInputFormatter? formatoEntrada;

  const Editor(
      {this.controlador,
      this.rotulo,
      this.dica,
      this.tipoTeclado,
      this.formatoEntrada});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 22.0, color: Colors.white),
        keyboardType: tipoTeclado,
        inputFormatters: formatoEntrada != null ? [formatoEntrada!] : [],
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: dica,
          hintStyle: const TextStyle(
              fontSize: 18.0, color: Color.fromARGB(197, 255, 255, 255)),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
