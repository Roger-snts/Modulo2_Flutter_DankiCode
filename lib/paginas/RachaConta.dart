import 'dart:html';

import 'package:flutter/material.dart';

class RachaConta extends StatefulWidget {
  const RachaConta({super.key});

  @override
  State<RachaConta> createState() => RachaContaState();
}

class RachaContaState extends State<RachaConta> {
  TextEditingController tfvalor = TextEditingController();
  TextEditingController tfadicional = TextEditingController();
  TextEditingController tfpessoas = TextEditingController();
  double porcentagem = 0, total = 0, individual = 0;
  String erro = "";
  Image imgfalha = Image.network(
          "https://cdn-icons-png.flaticon.com/128/9997/9997406.png"),
      bannerComida = Image.network(
          "https://cdn-icons-gif.flaticon.com/12761/12761826.gif");

  void repartirValor() {
    setState(() {
      try {
        total = double.parse(tfvalor.text) +
            (double.parse(tfvalor.text) * porcentagem / 100);
        individual = double.parse(
            (total / double.parse(tfpessoas.text)).toStringAsFixed(2));

        erro = "O valor foi repartido";
        imgfalha = Image.network(
            "https://cdn-icons-gif.flaticon.com/13373/13373593.gif");
      } catch (excecao) {
        total = 0;
        individual = 0;

        erro = "Dessa vez a pedra foi mais dura";
        imgfalha = Image.network(
            "https://cdn-icons-png.flaticon.com/128/9997/9997406.png");
      }
    });
  }

  void popup() {
    repartirValor();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              erro,
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                imgfalha,
                Text("Valor total da conta: $total"),
                Text("Valor individual: $individual"),
                const SizedBox(
                  height: 15,
                ),
                CloseButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    color: Colors.red)
              ],
            ),
            elevation: 2,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RACHA CONTA",
            style: TextStyle(color: Color(0xffE2E2E2))),
        centerTitle: mounted,
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xff556CC1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 170,
                child: bannerComida,
              ),
              TextField(
                controller: tfvalor,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    labelText: "Valor total da conta",
                    icon: Icon(
                      Icons.wallet,
                      color: Color(0xff8EC155),
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Gorjeta do garçom:",
                  style: TextStyle(fontSize: 17),
                ),
                Slider(
                    value: porcentagem,
                    min: 0,
                    max: 10.0,
                    divisions: 10,
                    label: "$porcentagem%",
                    thumbColor: const Color(0xfff4957a),
                    activeColor: const Color(0xff8EC155),
                    onChanged: (onChanged) {
                      setState(() {
                        porcentagem = onChanged;
                      });
                    }),
              ]),
              TextField(
                controller: tfpessoas,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    labelText: "Rachar para quantas pessoas?",
                    icon: Icon(
                      Icons.group,
                      color: Color(0xff8EC155),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff617CDD)),
                  onPressed: popup,
                  child: const Text("Repartir",
                      style: TextStyle(color: Color(0xffE2E2E2), fontSize: 20)),
                ),
              )
            ]),
      ),
    );
  }
}
