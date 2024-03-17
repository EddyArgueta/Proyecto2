import 'package:auth_app/models/inicio_page.dart';
import 'package:auth_app/shared/widgets/imagen_principal.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/models/registro_page.dart';
import 'package:auth_app/models/password_help.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      backgroundColor:const Color.fromARGB(255, 252, 250, 166),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //La Imagen Principal
              CustomImageButton(
              imagePath: 'assets/unah_logo.png',
              iconSize: 250.0,
              onPressed: () {},
            ),

              //Correo
              const SizedBox(height: 30.0),
              Form(
                key: formKey,
                //Con esta opcion, cuando vuelva a la Pantalla de Login despues de ir a la de Registro
                //No me saldran en rojo los campos de correo y password
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      maxLength: 30,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'El Correo Institucional es Obligatorio';
                        }

                        if (!value.contains('@unah.hn')) {
                          return 'Por favor ingresa un correo electrónico válido de la UNAH';
                        }

                        if (value.length < 3) {
                          return 'El Correo debe de tener más de 3 Caracteres';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Correo Institucional',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    //Password
                    const SizedBox(height: 30),
                    CustomInput(controller: passwordController),
                  ],


                ),
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {       

                    //Con esto, si el usuario no existe, haremos que se registre
                    //Sin necesidad de poner los campos en rojo
                    formKey.currentState!.validate();
                    formKey.currentState!.save();
    
                    // Navegamos a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroPage()),
                  );
                },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo
                  foregroundColor: Colors.black, // Color del texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    side: const BorderSide(color: Colors.deepOrange), // Borde lateral
                  ),
                ),
                  child: const Text('¿Nuevo(a)? ¡Registrémonos!'),
                ),

                  ElevatedButton(
                    onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InicioPage(emailController.text)),
                    );
                  }
                },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo
                  foregroundColor: Colors.black, // Color del texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    side: const BorderSide(color: Colors.deepOrange), // Borde lateral
                  ),
                ),
                child: const Text('Acceder'),
              ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}


