import 'package:flutter/material.dart';

class ChampTexte extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icone;
  final bool estSecret;
  final VoidCallback? onFocus;

  const ChampTexte({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icone,
    this.estSecret = false,
    this.onFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus && onFocus != null) onFocus!();
      },
      child: TextField(
        controller: controller,
        obscureText: estSecret,
        decoration: InputDecoration(
          prefixIcon: Icon(icone),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
