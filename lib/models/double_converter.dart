import 'package:json_annotation/json_annotation.dart';

/// Convertisseur personnalisé qui transforme une valeur JSON (String, int ou double)
/// en `double`, avec fallback à 0.0 si la conversion échoue.
class StringToDoubleConverter implements JsonConverter<double, dynamic> {
  const StringToDoubleConverter();

  @override
  double fromJson(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  @override
  dynamic toJson(double value) => value;
}
