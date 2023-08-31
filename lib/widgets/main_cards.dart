import 'package:flutter/material.dart';

class MainCards extends StatelessWidget {
  const MainCards({super.key});

  final List itemCards = const [
    {
      "nome": "Horários",
      "rota": "/horarios",
      "icon": Image(
        image: AssetImage('images/01_square.png'),
        width: 124,
        height: 124,
      ),
    },
    {
      "nome": "Mapa",
      "rota": "/map",
      "icon": Image(
        image: AssetImage('images/02_square.png'),
        width: 124,
        height: 124,
      ),
    },
    {
      "nome": "Informativos",
      "rota": "/news",
      "icon": Image(
        image: AssetImage('images/03_square.png'),
        width: 124,
        height: 124,
      ),
    },
    {
      "nome": "Ajuda",
      "rota": "/ajuda",
      "icon": Image(
        image: AssetImage('images/04_square.png'),
        width: 124,
        height: 124,
      ),
    }
  ];

  Row rowItems(el0, el1, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, el0['rota']),
          child: Column(
            children: [
              el0['icon'],
              Text(el0['nome']),
            ],
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, el1['rota']),
          child: Column(
            children: [
              el1['icon'],
              Text(el1['nome']),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      rowItems(itemCards[0], itemCards[1], context),
      const Divider(color: Colors.transparent),
      rowItems(itemCards[2], itemCards[3], context)
    ]);
  }
}
