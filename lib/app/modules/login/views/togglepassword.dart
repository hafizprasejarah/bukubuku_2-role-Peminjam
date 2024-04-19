
import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
import 'package:flutter/material.dart';

class TogglePassword extends StatefulWidget {
  final TextEditingController controller;
  const TogglePassword({super.key, required this.controller});

  @override
  State<TogglePassword> createState() => _TogglePasswordState();
}

class _TogglePasswordState extends State<TogglePassword> {

  bool isSecurePassword = true;
  @override

  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecurePassword,
      controller: widget.controller,
      decoration: AppDecorations.textFormFieldDecoration.copyWith(
        suffixIcon:togglePassword(),
        hintText: 'Masukan Password',
      ),
      validator: (value) {
        if (value!.length < 2) {
          return 'Masukan password';
        }
        return null;
      },
    );
  }
  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      icon: isSecurePassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.grey,
    );
  }
}