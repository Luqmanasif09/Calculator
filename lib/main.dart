// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'button_class.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      title: 'Calculator',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.orange,
        backgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double equationFontSize = 38.0;
  String equation = "0";
  String result = "0";
  String expression = "";
  double resultFontSize = 48.0;

  void buttonPressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "0";
          result = "0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;
        } else if (buttonText == "AC") {
          resultFontSize = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = "0";
          }
        } else if (buttonText == "=") {
          equationFontSize = 38.0;
          resultFontSize = 48.0;

          expression = equation;
          expression = expression.replaceAll('x', '*');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
        } else {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
            child: Text(
              equation,
              style: TextStyle(color: Colors.white, fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              '=${result}',
              style: TextStyle(color: Colors.white, fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 8,
              color: Colors.amberAccent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Button('C', Colors.grey, buttonPressed),
                  Button('AC', Colors.grey, buttonPressed),
                  Button('%', Colors.grey, buttonPressed),
                  Button('/', Colors.orange, buttonPressed),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Button('9', Colors.white, buttonPressed),
                  Button('8', Colors.white, buttonPressed),
                  Button('7', Colors.white, buttonPressed),
                  Button('x', Colors.orange, buttonPressed),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Button('6', Colors.white, buttonPressed),
                  Button('5', Colors.white, buttonPressed),
                  Button('4', Colors.white, buttonPressed),
                  Button('+', Colors.orange, buttonPressed),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Button('3', Colors.white, buttonPressed),
                  Button('2', Colors.white, buttonPressed),
                  Button('1', Colors.white, buttonPressed),
                  Button('-', Colors.orange, buttonPressed),
                ],
              ),
              Row(children: [
                Button('00', Colors.grey, buttonPressed),
                Button('0', Colors.grey, buttonPressed),
                Button('.', Colors.grey, buttonPressed),
                Button('=', Colors.grey, buttonPressed),
              ]
                  // ignore: prefer_const_literals_to_create_immutables

                  ),
            ],
          ),
        ],
      ),
    );
  }
}
