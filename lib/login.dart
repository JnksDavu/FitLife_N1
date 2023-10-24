import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/Calendario.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.maxWidth,
            decoration: const BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              
              children: [
                
                Expanded(
  child: FittedBox(
    child: Image.asset('images/login.png'),
    fit: BoxFit.fill,
  ),
),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    width: 200, // Defina a largura desejada aqui
                    child: LoginButtomWidget(
                      corado: Color.fromRGBO(171, 144, 195, 1),
                      cor: Color.fromARGB(255, 106, 23, 179),
                      text: 'Login',
                    onPressed: () => {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      )
                    },
                  ),),
                ), 
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    width: 200, // Defina a largura desejada aqui
                    child: LoginButtomWidget(
                      corado: Color.fromARGB(255, 106, 23, 179),
                      cor: Color.fromRGBO(171, 144, 195, 1),
                      text: 'Registrar',
                    onPressed: () => {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => TradePage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0); 
                            const end = Offset.zero;
                            const curve = Curves.easeInOut; 

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      )
                    },
                  ),),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
