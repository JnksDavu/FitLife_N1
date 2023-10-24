import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: Crud()));
}

class Crud extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Crud> {
  List<String?> dropdownValues = ['Ana'];
  List<TextEditingController> controllers = [TextEditingController()];

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
      body: ListView(
        children: <Widget>[
          for (int i = 0; i < dropdownValues.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4, // 40% da largura da tela
                    child: DropdownButton<String>(
                      isExpanded: true, // para garantir que o DropdownButton se expanda para preencher o Container
                      value: dropdownValues[i],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValues[i] = newValue;
                        });
                      },
                      items:
                        <String>['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo', 'Fernanda']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value:value,
                              child:
                                Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                  SizedBox(width:
                    MediaQuery.of(context).size.width * 0.05), // Espaço entre a lista suspensa e o campo de texto
                  Container(
                    width:
                    
                      MediaQuery.of(context).size.width * 0.35, // 35% da largura da tela
                    child:
                      TextField(
                        controller:
                          controllers[i],
                        keyboardType:
                          TextInputType.number,
                        inputFormatters:
                          <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Somente números podem ser inseridos
                        decoration:
                          InputDecoration(
                            labelText:'Minutos',
                            labelStyle: TextStyle(color: Colors.deepPurple),
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.deepPurpleAccent),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurpleAccent),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurpleAccent),
                            ),
                          ),
                      ),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              IconButton(
                iconSize: 50.0,
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    if(dropdownValues.length > 1) { // Para garantir que pelo menos uma lista suspensa permaneça
                      dropdownValues.removeLast();
                      controllers.removeLast();
                    }
                  });
                },
              ),
              IconButton(
                iconSize: 50.0,
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() {
                    dropdownValues.add('Ana');
                    controllers.add(TextEditingController());
                  });
                },
              ),
            ]
          )
        ],
      ),
    );
  }
}
