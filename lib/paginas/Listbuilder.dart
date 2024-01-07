import 'package:flutter/material.dart';

class buildList extends StatefulWidget {
  @override
  State<buildList> createState() => buildListState();
}

class buildListState extends State<buildList> {
  var locais = [
    {
      "nome": "Gerador de ovnis",
      "passagem": 70.79,
      "imagem":
          "https://images.pexels.com/photos/10188205/pexels-photo-10188205.jpeg"
    },
    {
      "nome": "Campo de concentração",
      "passagem": 25.50,
      "imagem":
          "https://images.pexels.com/photos/19603977/pexels-photo-19603977/free-photo-of-interior-alvorecer-amanhecer-aurora.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "nome": "Fora da sua casa",
      "passagem": 0.00,
      "imagem":
          "https://images.pexels.com/photos/414144/pexels-photo-414144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "nome": "Girassois da varanda do vizinho",
      "passagem": 19.90,
      "imagem":
          "https://images.pexels.com/photos/1427855/pexels-photo-1427855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    }
  ];

  void informacoes(String nome, String valor) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(nome),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Preço de passagem: $valor"),
              ],
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                  onPressed: () {},
                  child: const Text(
                    "Fechar",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level Design"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
          itemCount: locais.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 20,
                margin: const EdgeInsets.all(5),
                shadowColor: Colors.black45,
                child: Column(
                  children: [
                    InkWell(
                      child: Image.network(locais[index]["imagem"].toString(),
                          fit: BoxFit.fill),
                      onTap: () => informacoes(locais[index]["nome"].toString(),
                          locais[index]['passagem'].toString()),
                    ),
                    Text(
                      locais[index]["nome"].toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("RS${locais[index]['passagem']}")
                  ],
                ));
          }),
    );
  }
}
