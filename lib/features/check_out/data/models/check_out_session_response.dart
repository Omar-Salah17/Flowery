import 'package:json_annotation/json_annotation.dart';


part 'check_out_session_response.g.dart';

@JsonSerializable()
class CheckoutSessionResponse {
  final String message;
  @JsonKey(name: 'session')
  final CheckoutSession checkoutSession;
CheckoutSessionResponse(this.checkoutSession , this.message);
  factory CheckoutSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckoutSessionResponseToJson(this);
}



@JsonSerializable(explicitToJson: true)
class CheckoutSession {
  final String? id;
  final String? object;
  final int? amountSubtotal;
  final int? amountTotal;
  final String? currency;
  final String? customer;
  final String? customerEmail;
  final CustomerDetailsModel? customerDetails;
  final AdaptivePricingModel? adaptivePricing;
  final PaymentMethodOptionsModel? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final String? paymentStatus;
  final String? status;
  final String? url;
  final int? created;
  final int? expiresAt;

  CheckoutSession({
    this.object,
     this.id,
     this.amountSubtotal,
     this.amountTotal,
     this.currency,
    this.customer,
    this.customerEmail,
    this.customerDetails,
    this.adaptivePricing,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
     this.paymentStatus,
     this.status,
    this.url,
     this.created,
     this.expiresAt,
  });

  factory CheckoutSession.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSessionToJson(this);
}


@JsonSerializable()
class AdaptivePricingModel {
  final bool enabled;

  AdaptivePricingModel({
    required this.enabled,
  });

  factory AdaptivePricingModel.fromJson(Map<String, dynamic> json) =>
      _$AdaptivePricingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdaptivePricingModelToJson(this);
}


@JsonSerializable()
class PaymentMethodOptionsModel {
  final CardOptions card;

  PaymentMethodOptionsModel({required this.card});

  factory PaymentMethodOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodOptionsModelToJson(this);
}

@JsonSerializable()
class CardOptions {
  final String requestThreeDSecure;

  CardOptions({required this.requestThreeDSecure});

  factory CardOptions.fromJson(Map<String, dynamic> json) =>
      _$CardOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CardOptionsToJson(this);
}

@JsonSerializable()
class CustomerDetailsModel {
  final String? email;
  final String? name;
  final String? phone;

  CustomerDetailsModel({
    this.email,
    this.name,
    this.phone,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsModelToJson(this);
}

