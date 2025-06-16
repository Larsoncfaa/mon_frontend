import 'package:json_annotation/json_annotation.dart';

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
  googlePay,

  @JsonValue('BALANCE')
  balance,
}
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
      case MethodEnum.balance:
        return 'Solde client';
    }
  }
}