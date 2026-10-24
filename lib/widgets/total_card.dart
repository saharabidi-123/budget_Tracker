import 'package:flutter/material.dart';

import '../utils/formatters.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      color: colors.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total spent',
              style: TextStyle(fontSize: 18, color: colors.onPrimaryContainer),
            ),
            Text(
              formatMoney(total),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colors.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}