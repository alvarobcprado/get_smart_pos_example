import 'package:flutter/material.dart';

class InfoLine extends StatelessWidget {
  const InfoLine({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.isNotEmpty && value != 'null',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Expanded(child: Text(value)),
          ],
        ),
      ),
    );
  }
}
