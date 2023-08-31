import 'package:flutter/material.dart';
import 'package:horarios_transporte/controllers/save_localstorage_controller.dart';

class MainListaFavoritos extends StatefulWidget {
  const MainListaFavoritos({super.key});

  @override
  State<MainListaFavoritos> createState() => _MainListaFavoritosState();
}

class _MainListaFavoritosState extends State<MainListaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SaveOnLocalStorage("favBoxApp").getAllData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              for (var linhasFavoritas in snapshot.data)
                Card(
                  child: ListTile(
                    onTap: () => Navigator.of(context)
                        .pushNamed('/linha', arguments: linhasFavoritas),
                    trailing: GestureDetector(
                      onTap: () {
                        SaveOnLocalStorage("favBoxApp")
                            .deleteData(linhasFavoritas.values.first);
                        SaveOnLocalStorage("rotasLocal")
                            .deleteData(linhasFavoritas.values.first);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.star,
                        size: 38,
                        // color: Color.fromRGBO(255, 198, 42, 1),
                        color: Color.fromRGBO(192, 251, 0, 1),
                      ),
                    ),
                    title: Text(
                      "${linhasFavoritas.keys.first}",
                      style: const TextStyle(),
                    ),
                  ),
                ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
