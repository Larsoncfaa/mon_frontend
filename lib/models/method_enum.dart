import 'package:freezed_annotation/freezed_annotation.dart';


part 'method_enum.g.dart';

/// Enumération des méthodes de paiement disponibles.
@JsonEnum(alwaysCreate: true)
enum MethodEnum {
  @JsonValue('CARD')
  card,

  @JsonValue('BANK')
  bank,

  @JsonValue('MOBILE')
  mobile,

  @JsonValue('PAYPAL')
  paypal,

  @JsonValue('APPLE_PAY')
  applePay,

  @JsonValue('GOOGLE_PAY')
  googlePay, creditCard,
}

/// Extension pour afficher les noms lisibles ou localisés
extension MethodEnumExtension on MethodEnum {
  String get label {
    switch (this) {
      case MethodEnum.card:
        return 'Carte bancaire';
      case MethodEnum.bank:
        return 'Virement';
      case MethodEnum.mobile:
        return 'Mobile Money';
      case MethodEnum.paypal:
        return 'PayPal';
      case MethodEnum.applePay:
        return 'Apple Pay';
      case MethodEnum.googlePay:
        return 'Google Pay';
      case MethodEnum.creditCard:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
