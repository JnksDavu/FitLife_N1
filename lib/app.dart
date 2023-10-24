import 'package:flutter/material.dart';
import 'package:gamestellar/Button.dart';
import 'package:gamestellar/app.dart';
import 'package:gamestellar/login.dart';
import 'package:gamestellar/Crud.dart';
// Suponha que você tenha duas telas, HomePage e CalendarPage
import 'package:gamestellar/Calendario.dart';
import 'package:gamestellar/Exercicios.dart';
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
          return Container(
            height: 340.0,
            width: constraints.maxWidth,
           
            child: Column(
              
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
    child: Card(
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
                'Tempo:',
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
              Text('Alongamento'), // Adicionado Text
          ),
      ),
              Container(
          margin: EdgeInsets.only(top: 10.0), // Adicione a margem que você deseja aqui
          child: ElevatedButton.icon(
            onPressed: () {
              // Adicione a funcionalidade para ir para o exercício aqui
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
        ),

    ],
  ),
)
                ),
              ],
            ),
          );
        },
      ),
      drawer:
        Drawer(
          child:
            drawerItems,
        ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme:
      ThemeData(
        scaffoldBackgroundColor:
          Color.fromARGB(255, 223, 223, 223), // Escolha a cor que você deseja
      ),
    home:
      MyApp(),
    
    debugShowCheckedModeBanner:false,
  ));
}
