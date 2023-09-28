//import 'dart:js_interop';
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/Calendario.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _showPassword = false;
  // bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width:  double.infinity,
            decoration:  const BoxDecoration (
                  color:  Color(0xffffffff),
                    ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('images/login.png'),
            ),
           Padding(
            padding: const EdgeInsets.only(bottom: 15),
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
                              const begin = Offset(1.0, 0.0); // aqui ta sendo definida a posição inicial da tela
                              const end = Offset.zero; // aqui é a posição final da tela
                              const curve = Curves.easeInOut; // aqui ele define uma curva?? pra animação

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
              ),
            ), 
            Padding(
            padding: const EdgeInsets.only(bottom: 5),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}