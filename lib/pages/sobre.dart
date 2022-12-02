import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: const Center(
        child: Text(
            'App desenvolvido por Carlos Eduardo Bertoglio, Neste app você conseguirá cadastrar todas as contas que você precisa pagar, ele ira retornar o saldo total de contas a pagar e emitira uma notificação no dia que você cadastrar o pagamentos, após pagar sua conta em qualquer banco de sua preferência, entre no app e finalize-as.'),
      ),
    );
  }
}
