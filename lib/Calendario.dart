import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/login.dart';


class TradePage extends StatefulWidget {
  const TradePage({Key? key});

  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(

              icon: const Icon(Icons.menu),

              iconSize: 30,

              color: Color.fromARGB(255, 119, 17, 252),

              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));

              },),
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
       
    );
}
}