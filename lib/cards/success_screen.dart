import 'package:flutter/material.dart';
import 'dart:io';

import 'package:my_wallet/cards/cards_screen.dart';

class SuccessScreen extends StatelessWidget {
  final String cardName;
  final String imagePath;

  const SuccessScreen({Key? key, required this.cardName, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 20),
            const Text(
              'Karta "Personal ID" pridaná!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.file(File(imagePath)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => CardsScreen(),
                ),
                );
              },
              child: const Text('Back'),
            ),

          ],
        ),
      ),
    );
  }
}