import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view model/cubit/cart_cubit.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final String id;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
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
      context.read<CartCubit>().updateProductQuantity(widget.id, count);
  }

  void _decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
      context.read<CartCubit>().updateProductQuantity(widget.id, count);
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
