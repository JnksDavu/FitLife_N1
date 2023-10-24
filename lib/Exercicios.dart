import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestellar/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'package:gamestellar/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Exercicios(),
        'app': (context) => MyApp(),
      },
    ),
  );
}

class Exercicios extends StatefulWidget {
  const Exercicios({super.key});

  @override
  _ExerciciosState createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  List<String?> valoresSelecionados = [null];
  List<TextEditingController> controllers = [TextEditingController()];
  final nomeColecaoController = TextEditingController();
  Map<String, String> docIds = {};

 void criarExercicios() async {
  if (nomeColecaoController.text.isEmpty) {
    // O nome da coleção é obrigatório
    return;
  }

  CollectionReference listaExercicios = FirebaseFirestore.instance.collection(nomeColecaoController.text);

  // Verificar se a coleção já existe
  var snapshot = await listaExercicios.get();

  if (!snapshot.docs.isEmpty) {
    // Se a coleção existir, excluir todos os documentos
    for (var doc in snapshot.docs) {
      await listaExercicios.doc(doc.id).delete();
    }
  }

  // Adicionar novos exercícios
  for (int i = 0; i < valoresSelecionados.length; i++) {
    await listaExercicios.add({
      'exercicio': valoresSelecionados[i],
      'minutos': controllers[i].text,
    });
  }
}
  void removerLista() {
    if (valoresSelecionados.length > 1) { // Para garantir que pelo menos uma lista suspensa permaneça
      setState(() {
        String exercicioToRemove = valoresSelecionados.removeLast()!;
        controllers.removeLast();
        FirebaseFirestore.instance.collection(nomeColecaoController.text).doc(docIds[exercicioToRemove]).delete();
        docIds.remove(exercicioToRemove);
      });
    }
  }

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
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Center(child: Text('Crie sua lista de exercícios')),
            ...List.generate(valoresSelecionados.length, (index) => 
              Row(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('Exercicios_base').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Algo deu errado");
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Carregando");
                      }

                      final exercicios = snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        return DropdownMenuItem<String>(
                          value: data['Exercicio'],
                          child: Text(data['Exercicio']),
                        );
                      }).toList();

                      return DropdownButton<String>(
                        hint: Text('Exercícios'),
                        value: valoresSelecionados[index],
                        items: exercicios,
                        onChanged: (String? novoValor) {
                          setState(() {
                            valoresSelecionados[index] = novoValor;
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      decoration: InputDecoration(
                        labelText:"Minutos",
                        hintText:"Minutos",
                      ),
                    ),
                  ),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: removerLista,
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    setState(() {
                      valoresSelecionados.add(null);
                      controllers.add(TextEditingController());
                    });
                  },
                ),
              ]
            ),
            TextField(
              controller: nomeColecaoController,
              decoration: InputDecoration(
                labelText:"Nome da Coleção",
                hintText:"Nome da Coleção",
              ),
            ),
            ElevatedButton(
  onPressed: () {
    criarExercicios();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  },
  child: Text('Criar exercícios'),
  style: ElevatedButton.styleFrom(
    backgroundColor : Color.fromRGBO(97,87,132,1.0),
  ),
)

          ],
        ),
      ),
    );
  }
}
