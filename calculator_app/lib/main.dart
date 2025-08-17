import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.tryParse(output) ?? 0;
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.tryParse(output) ?? 0;

      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = num2 != 0 ? (num1 / num2).toString() : "Error";
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == ".") {
      // Handle decimal input
      if (!_output.contains(".")) {
        if (_output == "0") {
          _output = "0.";
        } else {
          _output += ".";
        }
      }
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    // Update the display
    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: [
          // Display area
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(color: Colors.white),

          // Buttons
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey[850]!, Colors.white),
                    buildButton("8", Colors.grey[850]!, Colors.white),
                    buildButton("9", Colors.grey[850]!, Colors.white),
                    buildButton("/", Colors.grey[850]!, Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey[850]!, Colors.white),
                    buildButton("5", Colors.grey[850]!, Colors.white),
                    buildButton("6", Colors.grey[850]!, Colors.white),
                    buildButton("*", Colors.grey[850]!, Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey[850]!, Colors.white),
                    buildButton("2", Colors.grey[850]!, Colors.white),
                    buildButton("3", Colors.grey[850]!, Colors.white),
                    buildButton("-", Colors.grey[850]!, Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey[850]!, Colors.white),
                    buildButton("0", Colors.grey[850]!, Colors.white),
                    buildButton("C", Colors.grey[850]!, Colors.red),
                    buildButton("+", Colors.grey[850]!, Colors.orange),
                  ],
                ),
                Row(
                  children: [buildButton("=", Colors.grey[850]!, Colors.green)],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
