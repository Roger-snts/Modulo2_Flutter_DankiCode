import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => ConversorState();
}

class ConversorState extends State<Conversor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Conversor de Temperaturas",
                  style: TextStyle(
                      backgroundColor: Colors.blueGrey, fontSize: 24)),
              const Text("Graus Celsius"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Insira a temperatura em ºCelsius"),
              ),
              const Text("Fahrenheit"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabled: false,
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Temperatura em Farenheit"),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Converter"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen)),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Limpar"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
