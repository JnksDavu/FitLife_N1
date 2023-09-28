import 'package:flutter/material.dart';
import 'package:gamestellar/login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
//classe foda pra representar a noticia

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Container(
        
          width:  double.infinity,
            decoration:  const BoxDecoration (
                  color:  Color(0xffffffff),
                    ),
        child: Column(
          
          children: [
            
            const Padding(
              padding:  EdgeInsets.only(top: 0),
              //child: Icon(Icons.menu),
            ),
            IconButton(

              icon: const Icon(Icons.menu),

              iconSize: 30,

              color: Color.fromARGB(255, 174, 0, 255),

              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));

              },),
            Expanded(
              child: Image.asset('images/2_tela.png'),
            ),

          ],
            ),
        ),
      )
    ;
  }
}