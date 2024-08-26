import 'package:flutter/material.dart';
import 'package:flutter_application_1/1pagina.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eureka Finder",
      home:Pagina1(),
    );
  }
}