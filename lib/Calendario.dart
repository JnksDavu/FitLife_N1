import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/login.dart';
import 'package:gamestellar/app.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key});

  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {

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
          title: Text('Exercícios'),
          leading: const Icon(Icons.fitness_center), // Ícone de musculação
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()), // Navega para a página de exercícios
            );
          },
        ),
      ],
    );
    return WillPopScope(
  onWillPop: () async => false, // Intercepta a ação de voltar
  child: Scaffold(
    appBar: AppBar(
      title: Center(
        child: Image.asset('images/logo.png', fit: BoxFit.cover),
      ),
      backgroundColor: Color.fromRGBO(97, 87, 132,1.0),
    ),
    drawer: Drawer( // Adicione esta linha
      child: drawerItems,
    ),
    body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
            
              SizedBox(height: 75,),            
              Container(
                padding: EdgeInsets.all(25),
                child:Column(
                  children: <Widget>[
                    SizedBox(width: 1),
                    Text(
                        'Seu Progresso',
                        style: TextStyle(
                          color: Color.fromARGB(255, 145, 49, 255),
                          fontSize: 35, // Tamanho do título
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                       Image.asset('Images/calendario.png',
               width: 500,
               height: 400,
               ),
                     
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                          
                          SizedBox(height: 75,),
                          Container(
                              padding: const EdgeInsets.all(15),
                              child : Row(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[ 
                                    ElevatedButton(
                                        onPressed: () {
                                          
                                        },
                                        style: ElevatedButton.styleFrom(
                                          
                                           backgroundColor: Color.fromARGB(97, 117, 27, 145),
                                        ),
                                        child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxWidth: 50,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '+',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight:FontWeight.bold,
                              )
                            ),
                          ],
                        ),
                      ),
                                        // child: const Text(
                                        //     '+',
                                        //     style: TextStyle(
                                        //       fontWeight: FontWeight.bold,
                                        //       fontSize: 60,
                                        //     ),
                                        //   ),
                                      ),
                                      //SizedBox(width: 45,), 
                                     Image.asset('Images/caloria.png'),
                                      //SizedBox(width: 45,),
                                      ElevatedButton(
                                        onPressed: () {
                                          
                                        },
                                        style: ElevatedButton.styleFrom(
                                          
                                          backgroundColor: Color.fromARGB(97, 117, 27, 145),
                                        ),
                                        child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxWidth: 50,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '-',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight:FontWeight.bold,
                              )
                            ),
                          ],
                        ),
                      ),
                                        
                                      ), 
                              ] ),
                            ),
                            SizedBox(height: 25,),
                            Text(
                        'BOM TRABALHO',
                        style: TextStyle(
                          color: Color.fromARGB(255, 145, 49, 255),
                          fontSize: 35, // Tamanho do título
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ]
                    ),  
                    const SizedBox(height: 16),                      
                    ],
                )
              ),
      ],
          ),
        ),
        
      ),
       
    ),);
}
}