import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/lista_transferencia.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regex = RegExp(r'^\d*[.,]?\d{0,2}');

    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nova Transferência",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 53, 16, 141),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
                controlador: _controllerCampoNumeroConta,
                rotulo: 'Número da conta',
                dica: '00000',
                tipoTeclado: TextInputType.number,
                formatoEntrada: FilteringTextInputFormatter.digitsOnly),
            Editor(
                controlador: _controllerCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on,
                tipoTeclado: TextInputType.numberWithOptions(decimal: true),
                formatoEntrada: DecimalTextInputFormatter()),
            ElevatedButton(
              onPressed: () {
                _criarTransferencia(
                  context,
                  _controllerCampoNumeroConta,
                  _controllerCampoValor,
                );
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

  void _criarTransferencia(
      BuildContext context, controllerCampoNumeroConta, controllerCampoValor) {
    final int? numeroConta = int.tryParse(controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(controllerCampoValor.text);

    if (numeroConta == null || valor == null) {
      _exibirAlerta(context);
    } else {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  void _exibirAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Campos obrigatórios"),
          content:
              const Text("Por favor, preencha todos os campos corretamente."),
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
  final IconData? icone;
  final TextInputType? tipoTeclado;
  final TextInputFormatter? formatoEntrada;

  const Editor(
      {this.controlador,
      this.rotulo,
      this.dica,
      this.icone,
      this.tipoTeclado,
      this.formatoEntrada});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 22.0,
          color: Colors.white,
        ),
        keyboardType: tipoTeclado,
        inputFormatters: formatoEntrada != null ? [formatoEntrada!] : [],
        decoration: InputDecoration(
          icon:
              icone != null ? Icon(icone, size: 30, color: Colors.green) : null,
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
