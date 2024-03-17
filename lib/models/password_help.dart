import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  CustomInput({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'La Contraseña es Obligatoria';
        }

        if (value.length != 11) {
          return 'La Contraseña debe tener exactamente 11 caracteres';
        }

        // Tenemos que verificar que solo sean numeros, ya que es el No. de Cuenta lo que necesitamos
        for (int i = 0; i < value.length; i++) {
          if (int.tryParse(value[i]) == null) {
          return 'La Contraseña debe contener solo números';
        }
      }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          color: _obscureText ? Colors.grey : Colors.blue,
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}


class CustomInput2 extends StatefulWidget {
  CustomInput2({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<CustomInput2> createState() => _CustomInputState2();
}

class _CustomInputState2 extends State<CustomInput2> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'La Contraseña es Obligatoria';
        }

        if (value.length != 11) {
          return 'La Contraseña debe tener exactamente 11 caracteres';
        }

        // Tenemos que verificar que solo sean numeros, ya que es el No. de Cuenta lo que necesitamos
        for (int i = 0; i < value.length; i++) {
          if (int.tryParse(value[i]) == null) {
            return 'La Contraseña debe contener solo números';
          }
        }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Confirmar Contraseña',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          color: _obscureText ? Colors.grey : Colors.blue,
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
