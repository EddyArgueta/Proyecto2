import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  InicioPage(this.correoInstitucional); 

  final String correoInstitucional;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Inicio'),
      ),
      backgroundColor:const Color.fromARGB(255, 252, 250, 166),
      body: Center(
        child: Text('¡Bienvenido a la aplicación, $correoInstitucional!'),
      ),
    );
  }
}
