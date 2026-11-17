import 'package:flutter/material.dart';

class CustomTextFile extends StatelessWidget{
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  const CustomTextFile({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}