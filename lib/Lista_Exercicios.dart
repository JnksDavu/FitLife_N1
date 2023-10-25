import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/login.dart';
import 'package:gamestellar/Crud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestellar/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
// Suponha que você tenha duas telas, HomePage e CalendarPage
import 'package:gamestellar/app.dart';
import 'package:gamestellar/Calendario.dart';
import 'package:gamestellar/Exercicios.dart';

class ExercicioPage extends StatelessWidget {
  final String nomeDocumento;

  ExercicioPage({required this.nomeDocumento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('images/logo.png', fit: BoxFit.cover),
        ),
        backgroundColor: Color.fromRGBO(97, 87, 132,1.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('colecao').doc(nomeDocumento).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Algo deu errado");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

            // Calcula a soma dos minutos
            int totalMinutos = 0;
            data.forEach((key, value) {
              if (key.startsWith('minutos')) {
                totalMinutos += int.parse(value);
              }
            });

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.fitness_center, size: 100.0), // Ícone de exercício
                    Text(nomeDocumento, style: TextStyle(fontSize: 24.0)), // Nome do documento
                    Text('Tempo total: $totalMinutos'), // Soma dos minutos
                    ...data.entries.map((entry) {
                      String key = entry.key.replaceAll(RegExp(r'\d'), ''); // Remove os números do nome do campo
                      String value = entry.value;
                      if (key.startsWith('exercicio')) {
                        String tempoKey = 'minutos' + key.substring(9); // Cria a chave correspondente ao tempo
                        if (data.containsKey(tempoKey)) { // Verifica se a chave do tempo existe no mapa de dados
                          value += ' - ${data[tempoKey]}'; // Adiciona o tempo ao lado do exercício
                        }
                      }
                      return ListTile(
                        title: Text('${key}: ${value}'),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          }

          return Text("Carregando");
        },
      ),
    );
  }
}
