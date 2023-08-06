import 'package:flutter/material.dart';

class PopupScreen extends StatelessWidget {
  final String winner;
  final VoidCallback onReplay;

  const PopupScreen({super.key, required this.winner, required this.onReplay});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Game Over',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            winner,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: onReplay,
                child: const Text(
                  'Replay',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
