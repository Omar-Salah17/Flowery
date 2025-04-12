import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final void Function(int)? onChanged;

  const QuantitySelector({super.key, this.initialValue = 0, this.onChanged});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void _increment() {
    setState(() {
      count++;
    });
    widget.onChanged?.call(count);
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
