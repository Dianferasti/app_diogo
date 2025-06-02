import 'package:flutter/material.dart';

void main() {
  runApp(BotaoPanicoApp());
}

class BotaoPanicoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botão de Pânico',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  void _acionarPanico(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('⚠️ Alerta de Pânico'),
        content: Text('Você acionou o botão de pânico!'),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Confirmar'),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ajuda foi acionada!')),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botão de Pânico'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            shape: CircleBorder(),
            backgroundColor: Colors.red,
          ),
          onPressed: () => _acionarPanico(context),
          child: Icon(Icons.warning, color: Colors.white, size: 60),
        ),
      ),
    );
  }
}
