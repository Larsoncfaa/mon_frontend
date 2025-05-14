import '../donnees/produit.dart';

List<Produit> filtrerParCategorie(List<Produit> liste, String categorie) {
  return liste.where((p) => p.categorie == categorie).toList();
}
