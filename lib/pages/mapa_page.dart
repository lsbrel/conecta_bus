import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:horarios_transporte/components/main_appbar.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:horarios_transporte/widgets/loading_widget.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  bool visible = true;

  @override
  void initState() {
    mudarTimer();
    _getUserLocation();
    super.initState();
  }

  void mudarTimer() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        visible = false;
      });
    });
  }

  void _getUserLocation() async {
    // Se as poermissoes ja estiverem gatantidas
    if (await Geolocator.checkPermission() != LocationPermission.denied) {
      // return await Geolocator.getCurrentPosition();
      return;
    }

    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !visible,
      replacement: Scaffold(
        appBar: MainAppBar(),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LoadingWidget()],
        ),
      ),
      child: WebviewScaffold(
          appBar: MainAppBar(), url: "https://bus2.info/pr/pontagrossa"),
    );
  }
}
