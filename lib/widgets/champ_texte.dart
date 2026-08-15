import 'package:flutter/material.dart';

class ChampTexte extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icone;
  final bool estSecret;
  final VoidCallback? onFocus;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const ChampTexte({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icone,
    this.estSecret = false,
    this.onFocus,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: estSecret,
      validator: validator,
      keyboardType: keyboardType,
      onTap: onFocus,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, size: 20, color: Colors.grey.shade600),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
