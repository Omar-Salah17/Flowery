class AddProductRequest {
  String? productId;
  int? quantity;

  AddProductRequest({this.productId, this.quantity});

  AddProductRequest.fromJson(Map<String, dynamic> json) {
    productId = json['product'] as String?;
    quantity = json['quantity']  as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}
