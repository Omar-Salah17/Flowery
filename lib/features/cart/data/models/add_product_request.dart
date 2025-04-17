class AddProductRequest {
  String? productId;
  int? quantity;

  AddProductRequest({this.productId, this.quantity});

  AddProductRequest.fromJson(Map<String, dynamic> json) {
    productId = json['product'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
