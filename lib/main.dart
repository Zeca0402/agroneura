import 'package:flutter/material.dart';

void main() {
  runApp(AgriculturaApp());
}

class AgriculturaApp extends StatelessWidget {
  const AgriculturaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Lavoura',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String clima = "☀️ Sol com nuvens";
  final String umidade = "Umidade: 65%";
  final String alertaPragas = "⚠️ Atenção: risco de lagarta nesta semana";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lavoura"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.lightBlue[50],
              child: ListTile(
                leading: Icon(Icons.cloud, color: Colors.blue),
                title: Text("Clima"),
                subtitle: Text(clima),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.lightGreen[50],
              child: ListTile(
                leading: Icon(Icons.water_drop, color: Colors.green),
                title: Text("Umidade"),
                subtitle: Text(umidade),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.red[50],
              child: ListTile(
                leading: Icon(Icons.warning, color: Colors.red),
                title: Text("Alerta de Pragas"),
                subtitle: Text(alertaPragas),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui futuramente você pode integrar IA ou APIs de clima
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Dados atualizados!")),
                );
              },
              child: Text("Atualizar informações"),
            ),
          ],
        ),
      ),
    );
  }
}
