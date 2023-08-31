import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// pages
import 'package:horarios_transporte/pages/home_page.dart';
import 'package:horarios_transporte/pages/linha_page.dart';
import 'package:horarios_transporte/pages/mapa_page.dart';
import 'package:horarios_transporte/pages/news_page.dart';
import 'package:horarios_transporte/pages/horario_page.dart';
import 'package:horarios_transporte/pages/ajuda_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("favBoxApp");
  await Hive.openBox("rotasLocal");
  OneSignal.shared.setAppId("0748ca4f-6e75-4371-8820-7b2114c7332b");
  // OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
  //   print('teste');
  // });
  // OneSignal.shared.setNotificationOpenedHandler((openedResult) {});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/horarios': (context) => const PageHorarios(),
        '/linha': (context) => const LinhaPage(),
        '/news': (context) => NewsPage(),
        '/map': (context) => const MapaPage(),
        '/ajuda': (context) => const AjudaPage(),
      },
    );
  }
}
