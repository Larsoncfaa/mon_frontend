import 'package:json_annotation/json_annotation.dart';

/// Représente une note d'évaluation produit de 1 à 5.
enum RatingEnum {
  @JsonValue(1)
  one, // ★☆☆☆☆

  @JsonValue(2)
  two, // ★★☆☆☆

  @JsonValue(3)
  three, // ★★★☆☆

  @JsonValue(4)
  four, // ★★★★☆

  @JsonValue(5)
  five, // ★★★★★
}
