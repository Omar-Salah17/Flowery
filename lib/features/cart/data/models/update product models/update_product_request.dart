class UpdateProductRequest {
  final int quantity;

  UpdateProductRequest({required this.quantity});

  Map<String, dynamic> toJson() => {'quantity': quantity};
}
