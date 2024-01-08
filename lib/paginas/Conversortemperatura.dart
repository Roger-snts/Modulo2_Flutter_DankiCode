import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => ConversorState();
}

class ConversorState extends State<Conversor> {
  TextEditingController celsius = TextEditingController();
  TextEditingController fahrenheit = TextEditingController();

  void calcularFahrenheit(TextEditingController graus) {
    Object temperatura;
    try {
      temperatura = (double.parse(graus.text) * 1.8) + 32;
    } catch (excecao) {
      temperatura = "";
    }
    fahrenheit.text = temperatura.toString();
  }

  void limpar() {
    fahrenheit.text = "";
    celsius.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 60, 15, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Conversor de Temperaturas",
                style: TextStyle(color: Colors.deepOrange, fontSize: 24)),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: celsius,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Insira a temperatura em Celsius",
                  labelStyle: TextStyle(color: Colors.blueAccent)),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: fahrenheit,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  enabled: false,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Temperatura em Farenheit",
                  labelStyle: TextStyle(color: Colors.blueAccent)),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calcularFahrenheit(celsius);
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Converter")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      limpar();
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Limpar")),
            )
          ],
        ),
      ),
    );
  }
}
