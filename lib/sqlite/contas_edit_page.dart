import 'package:app_prova/model/conta.dart';
import 'package:flutter/material.dart';

class ContasEditPage extends StatefulWidget {
  const ContasEditPage({super.key, this.selecionado});

  final Conta? selecionado;

  @override
  State<ContasEditPage> createState() => _ContasEditPageState();
}

class _ContasEditPageState extends State<ContasEditPage> {
  final _nomeCon = TextEditingController();
  final _dataCon = TextEditingController();
  final _valorCon = TextEditingController();
  final _finalizadoCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeCon.text = widget.selecionado!.nome!;
    _dataCon.text = widget.selecionado!.dapagamento!;
    _valorCon.text = widget.selecionado!.vlpagamento!;
    _finalizadoCon.text = widget.selecionado!.flfinalizado!;
  }

  void salvar() {
    widget.selecionado!.nome = _nomeCon.text;
    widget.selecionado!.dapagamento = _dataCon.text;
    widget.selecionado!.vlpagamento = _valorCon.text;
    widget.selecionado!.flfinalizado = _finalizadoCon.text;
    Navigator.pop(context, 'Salvar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Contas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nomeCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
            TextFormField(
              controller: _dataCon,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Data Pagamento',
              ),
            ),
            TextFormField(
              controller: _valorCon,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor',
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Salvar'),
                    onPressed: () {
                      salvar();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Excluir'),
                    onPressed: () {
                      Navigator.pop(context, 'Excluir');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context, 'Cancelar');
                    },
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
