import 'dart:developer';

import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/presentation/view%20model/update%20product%20quantity%20view%20model/update_product_quantity_cubit.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final void Function(int)? onChanged;
  final UpdateCartCubit updateCartCubit;
  final String id;

  const QuantitySelector({
    super.key,
    this.initialValue = 0,
    this.onChanged,
    required this.updateCartCubit,
    required this.id,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
    log("initial value");
    log(count.toString());
  }

  void _increment() {
    setState(() {
      count++;
    });
    log("id");
    log(widget.id);
    widget.updateCartCubit.updateCartItem(
      cartItemId: widget.id,
      request: UpdateProductRequest(quantity: 1),
    );
  }

  void _decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
      widget.onChanged?.call(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(icon: Icon(Icons.remove), onPressed: _decrement),
        Text(
          '$count',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        IconButton(icon: Icon(Icons.add), onPressed: _increment),
      ],
    );
  }
}
