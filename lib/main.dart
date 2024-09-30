import 'package:flutter/material.dart';
import 'screens/lista_transferencia.dart';
import 'screens/lista_contatos.dart';

void main() => runApp(const Banco());

class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF512DA8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 53, 16, 141),
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black45,
        ),
      ),
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
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(117, 255, 255, 255),
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
