import 'package:flutter/material.dart';

import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const CalcularApp(),
    );
  }
}

class CalcularApp extends StatefulWidget {
  const CalcularApp({Key? key}) : super(key: key);

  @override
  State<CalcularApp> createState() => _CalcularAppState();
}

class _CalcularAppState extends State<CalcularApp> {
  double firstnum2 = 0;
  double secondnum2 = 0;

  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';
  String display = '';

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '÷') {
      firstNum = int.parse(textToDisplay);

      res = textToDisplay.toString() + btnVal.toString();

      operation = btnVal;
    } else if (btnVal == '=') {
      RegExp exp = new RegExp(r"\d+|\+|-|\*|/|=");

      Iterable<Match> matches = exp.allMatches(textToDisplay);
      var list = matches.map((m) => (m.group(0)));
      print(list);

      secondNum = int.parse(list.last!);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        if (firstNum % secondNum == 0) {
          res = (firstNum / secondNum).toString();
          history =
              firstNum.toString() + operation.toString() + secondNum.toString();
        } else {
          var dou1 = firstNum.toDouble();
          var dou2 = secondNum.toDouble();
          res = (dou1 / dou2).toString();
          history = dou1.toString() + operation.toString() + dou2.toString();
        }
      }
    } else {
      res = textToDisplay + btnVal;
      print(res);
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(history,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black45,
                      )),
                ),
              ),
              color: Colors.white),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 48, color: Colors.black),
                ),
              ),
            ),
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.blueGrey[200],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: [
                        CalculatorButton(
                            text: 'C',
                            fillcolor: Colors.red,
                            callback: btnOnClick),
                        CalculatorButton(
                          text: '<',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'AC',
                          fillcolor: Colors.red,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '÷',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '7',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '8',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '9',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'X',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '4',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '5',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '6',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '-',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '1',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '2',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '3',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '0',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+/-',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '00',
                          fillcolor: Color.fromRGBO(117, 117, 117, 1),
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '=',
                          fillcolor: Color.fromRGBO(1, 87, 155, 1),
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
