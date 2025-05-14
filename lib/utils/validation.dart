bool estEmailValide(String email) {
  final regex = RegExp(r'^[^@\\s]+@[^@\\s]+\\.[^@\\s]+\$');
  return regex.hasMatch(email);
}

String? validerMotDePasse(String? value) {
  if (value == null || value.length < 6) {
    return 'Le mot de passe doit contenir au moins 6 caractères';
  }
  return null;
}
