import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas a Pagar'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Contas a Pagar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Contas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/contas');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Bem vindo'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/contas');
              },
              child: const Text('Contas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sobre');
              },
              child: const Text('Sobre'),
            ),
          ],
        ),
      ),
    );
  }
}
