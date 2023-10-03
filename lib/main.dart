import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//Dart - Statically typed language not dynamically typed like javascript
// if we do hot reload only build parts run not rest
//if u want to make changes then we should use stateful widgets

//stful for stateful widget
class DicePage extends StatefulWidget {
  //const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber=1; //crating a variable
  int rightDiceNumber=1;
  //creating function here
  //becoz of the below function both are changing at same time if we do not want that then we must do seperately
  void changeDiceFace(){
    setState(() {
      leftDiceNumber=Random().nextInt(6)+1;//0-6
      rightDiceNumber=Random().nextInt(6)+1;//0-6
    });
  }
  @override
  Widget build(BuildContext context) {
    //leftDiceNumber=2;
    //flutter outline - command+enter
    return Center(
      child: Row(
        children: <Widget>
        [
          Expanded(
            child:TextButton(onPressed: () {
              //print('left button got pressed');
              changeDiceFace();
            },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child:TextButton(onPressed:() {
              //print('right button got pressed');
              changeDiceFace();
            },
                child: Image.asset('images/dice$rightDiceNumber.png')),),
        ],
      ),
    );
  }
}


