import 'package:flutter/material.dart';

void main() {
  runApp(AgriculturaApp());
}

class AgriculturaApp extends StatelessWidget {
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nomeController = TextEditingController();
  String culturaSelecionada = "Milho";
  String alertaPragas = "⚠️ Atenção: risco de lagarta nesta semana";
  String clima = "☀️ Sol com nuvens";
  String umidade = "Umidade: 65%";

  void atualizarDados() {
    setState(() {
      clima = "🌦️ Chuva leve prevista";
      umidade = "Umidade: 80%";

      if (culturaSelecionada == "Milho") {
        alertaPragas = "⚠️ Risco de lagarta-do-cartucho";
      } else if (culturaSelecionada == "Feijão") {
        alertaPragas = "⚠️ Risco de mosca-branca";
      } else if (culturaSelecionada == "Café") {
        alertaPragas = "⚠️ Risco de ferrugem do café";
      } else {
        alertaPragas = "✅ Sem alertas graves no momento";
      }
    });
  }

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
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Nome da lavoura",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: culturaSelecionada,
              items: ["Milho", "Feijão", "Café", "Soja"]
                  .map((cultura) => DropdownMenuItem(
                        value: cultura,
                        child: Text(cultura),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  culturaSelecionada = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.lightBlue[50],
              child: ListTile(
                leading: Icon(Icons.cloud, color: Colors.blue),
                title: Text("Clima"),
                subtitle: Text(clima),
              ),
            ),
            Card(
              color: Colors.lightGreen[50],
              child: ListTile(
                leading: Icon(Icons.water_drop, color: Colors.green),
                title: Text("Umidade"),
                subtitle: Text(umidade),
              ),
            ),
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
              onPressed: atualizarDados,
              child: Text("Atualizar informações"),
            ),
          ],
        ),
      ),
    );
  }
}
