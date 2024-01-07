import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? nivel;
  int? sexo;
  var habilidades = [false, false, false];
  Color homem = Colors.black54;
  Color mulher = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level Design"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amber,
              alignment: AlignmentDirectional.bottomCenter,
              child: Center(
                child: Column(children: [
                  const Text("Modelos"),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: nivel,
                          onChanged: (int? valor) {
                            setState(() {
                              nivel = 1;
                            });
                          }),
                      const Text("Nivel 1"),
                      Radio(
                          value: 2,
                          groupValue: nivel,
                          onChanged: (int? valor) {
                            setState(() {
                              nivel = 2;
                            });
                          }),
                      const Text("Nivel 2"),
                      Radio(
                          value: 3,
                          groupValue: nivel,
                          onChanged: (int? valor) {
                            setState(() {
                              nivel = valor;
                            });
                          }),
                      const Text("Nivel 3")
                    ],
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 300,
              child: Column(
                children: [
                  const Text("Sexo"),
                  RadioListTile(
                    value: 1,
                    groupValue: sexo,
                    onChanged: (int? valor) {
                      setState(() {
                        sexo = valor;
                        if (sexo == 1) {
                          homem = Colors.black;
                          mulher = Colors.black45;
                        }
                      });
                    },
                    title: const Text("Masculino"),
                    subtitle: const Text(
                        "Moldados na friendzone e com parceria na solidão."),
                    secondary: Icon(Icons.man, color: homem),
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: sexo,
                    onChanged: (int? valor) {
                      setState(() {
                        sexo = valor;
                        if (sexo == 2) {
                          mulher = Colors.black;
                          homem = Colors.black45;
                        }
                      });
                    },
                    title: const Text("Feminino"),
                    subtitle: const Text(
                        "Originalmente fruto de um relacionamento interpessoal perfeito."),
                    secondary: Icon(Icons.woman, color: mulher),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  const Text("Habilidades"),
                  SwitchListTile(
                    value: habilidades[0],
                    onChanged: (bool valor) {
                      setState(() {
                        habilidades[0] = valor;
                      });
                    },
                    title: const Text("Pulo duplo"),
                    subtitle: const Text(
                        "Quando ativa permite que o personagem dê um pulo extra enquanto não estiver no chão."),
                    secondary: const Icon(Icons.upcoming, color: Colors.red),
                  ),
                  SwitchListTile(
                      value: habilidades[1],
                      onChanged: (bool valor) {
                        setState(() {
                          habilidades[1] = valor;
                        });
                      },
                      title: const Text("Impulso"),
                      subtitle: const Text(
                          "Ao ativar o usuário adquire a capacidade de se impulsionar na direção em que estiver olhando."),
                      secondary:
                          const Icon(Icons.share, color: Colors.lightGreen)),
                  SwitchListTile(
                      value: habilidades[2],
                      onChanged: (bool valor) {
                        setState(() {
                          habilidades[2] = valor;
                        });
                      },
                      title: const Text("Radar"),
                      subtitle: const Text(
                          "Use para expôr a localização de inimigos próximos."),
                      secondary:
                          const Icon(Icons.radar, color: Colors.lightBlue)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
