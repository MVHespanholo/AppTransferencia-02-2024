import 'package:flutter/material.dart';
import 'screens/lista_transferencia.dart';
import 'screens/lista_contatos.dart';

void main() => runApp(const Banco());

class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Banco MVP'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Transferências"),
              Tab(text: "Contatos"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListaTransferencia(),
            ListaContatos(),
          ],
        ),
      ),
    );
  }
}
