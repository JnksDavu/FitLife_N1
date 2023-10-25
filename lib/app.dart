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
import 'package:gamestellar/Calendario.dart';
import 'package:gamestellar/Exercicios.dart';
import 'package:gamestellar/Lista_Exercicios.dart';

class Exer {
  final String exercicio;
  final String titulo;
  

  Exer({
    required this.exercicio,
    required this.titulo,
    
  });
}

Future<List<Exer>> fetchNoticias() async {
  final firestore = FirebaseFirestore.instance;
  final collectionNames = ['colecao']; // Substitua pelos nomes de suas coleções
  final List<Exer> allexer = [];

  for (final collectionName in collectionNames) {
    final exerData = await firestore.collection(collectionName).get();

    final noticias = exerData.docs.map((doc) {
      final data = doc.data();
      return Exer(
        titulo: doc.id,
        exercicio: data['exercicio'] ?? 'Sem título',
        
      );
    }).toList();

    allexer.addAll(noticias);
  }

  return allexer;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromRGBO(97, 87, 132,1.0),
      ),
      accountName: Text('Nome do Usuário'),
      accountEmail: Text('usuario@email.com'),
      currentAccountPicture: const CircleAvatar(
        child: Icon(Icons.person, size: 42.0),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()), // Navega para a HomePage
            );
          },
        ),
        ListTile(
          title: Text('Calendario'),
          leading: const Icon(Icons.calendar_month),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TradePage()), // Navega para a CalendarPage
            );
          },
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('images/logo.png', fit: BoxFit.cover),
        ),
        backgroundColor: Color.fromRGBO(97, 87, 132,1.0),
      ),
      body: LayoutBuilder( 
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0), // Adicione a margem que você deseja aqui
                child: IconButton(
                  icon: Icon(Icons.add_circle, size: 50.0), // Ícone de '+'
                  color: Colors.blue, // Escolha a cor que você deseja
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exercicios()), // Navega para a HomePage
                    );
                    // Adicione a funcionalidade para criar um novo exercício aqui
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('colecao').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Algo deu errado");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Carregando");
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        String nomeDocumento = document.id;

                     int totalMinutos = 0;
                      data.forEach((key, value) {
                        if (key.startsWith('minutos')) {
                          totalMinutos += int.parse(value);
                        }
                      });

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            children:<Widget>[
                              Stack(
                                children:<Widget>[
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child:
                                      Image.asset('images/alongamento.jpg', fit:
                                      BoxFit.cover), // Substitua por sua imagem
                                  ),
                                  Positioned(
                                    left: 10.0,
                                    top: 5.0,
                                    child:
                                      Text(
                                        'Tempo: $totalMinutos',
                                        style:
                                          TextStyle(
                                            backgroundColor:
                                              Colors.black54,
                                            color:
                                              Colors.white,
                                            fontSize:
                                              10.0,
                                          ),
                                      ),
                                  ),
                                ],
                              ),
                              LinearProgressIndicator( 
                                value:
                                  0.5, // Substitua o valor pela porcentagem desejada
                                color:
                                  Colors.blue, // Escolha a cor que você deseja
                              ),
                              Padding( // Adicionado Padding
                                padding:
                                  EdgeInsets.only(top:
                                  30.0), // Adicionado EdgeInsets
                                child:
                                  Center( // Adicionado Center
                                    child:
                                      Text('$nomeDocumento'), // Adicionado Text
                                  ),
                              ),
                              Container(
  margin: EdgeInsets.only(top: 10.0), // Adicione a margem que você deseja aqui
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExercicioPage(nomeDocumento: nomeDocumento)),
    );
 
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Cor roxa que você utiliza
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        icon: Icon(Icons.fitness_center), // Ícone de musculação
        label: Text('Ir para exercício'), // Texto do botão
      ),
      ElevatedButton.icon(
        onPressed: () async {
          await FirebaseFirestore.instance.collection('colecao').doc(nomeDocumento).delete();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Cor vermelha para o botão de deletar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        icon: Icon(Icons.delete), // Ícone de lixeira
        label: Text('Deletar'), // Texto do botão
      ),
    ],
  ),
),

                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
       drawer: Drawer( // Adicione esta linha
    child: drawerItems,
  ),
    );
  }
}