import 'package:app_prova/model/conta.dart';
import 'package:app_prova/sqlite/contas_edit_page.dart';
import 'package:app_prova/sqlite/contas_helper.dart';
import 'package:app_prova/util/dialogos.dart';
import 'package:flutter/material.dart';

class ContasListPage extends StatefulWidget {
  const ContasListPage({super.key, this.title});
  final String? title;

  @override
  State<ContasListPage> createState() => _ContasListPageState();
}

class _ContasListPageState extends State<ContasListPage> {
  final contasDb = ContasHelper();
  List<Conta> contas = List.empty();
  Conta? selecionado;

  void _getAllContacts() {
    contasDb.obterTodos().then((list) {
      setState(() {
        contas = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  selecionar(int selecao) {
    selecionado = contas[selecao];
    _showContactPage();
  }

  void _incluir() {
    selecionado = Conta();
    _showContactPage();
  }

  void _showContactPage() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContasEditPage(
                  selecionado: selecionado,
                )));
    if (result != null) {
      if (result == 'Salvar') {
        if (selecionado!.id == null) {
          contasDb.inserir(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados inseridos com sucesso!');
          });
        } else {
          contasDb.alterar(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados alterados com sucesso!');
          });
        }
      } else if (result == 'Excluir') {
        contasDb.excluir(selecionado!.id!).then((_) {
          _getAllContacts();
          Dialogos.showAlertDialog(context, 'Dados excluídos com sucesso!');
        });
      } else if (result == 'Cancelar') {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: contas.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(children: <Widget>[
                  Text('${contas[index].id}'),
                  const SizedBox(width: 20),
                  Text(contas[index].nome!),
                ]),
                onTap: () => selecionar(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incluir,
        tooltip: 'incluir',
        child: const Icon(Icons.add),
      ),
    );
  }
}
