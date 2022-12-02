import 'package:app_prova/pages/home.dart';
import 'package:app_prova/pages/sobre.dart';
import 'package:flutter/material.dart';
import 'package:app_prova/sqlite/contas_list_page.dart'
    as contas_list_page_sqlite;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/sobre': (context) => const SobrePage(),
        '/contas': (context) =>
            const contas_list_page_sqlite.ContasListPage(title: 'Contas')
      },
    );
  }
}
