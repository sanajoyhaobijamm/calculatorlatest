import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillcolor;
  final Function callback;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.fillcolor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: fillcolor,
        ),
        child: Center(
          child: TextButton(
              onPressed: (() => callback(text)),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )),
        ),
      ),
    );
  }
}
