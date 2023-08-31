import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [
          Divider(),
          Image(
            image: AssetImage("images/pg_bandeira.png"),
            width: 124,
            height: 124,
          ),
        ],
      ),
    );
  }
}
