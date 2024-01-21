import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final String cardImage;

  const CardDetailScreen({Key? key, required this.cardImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail karty'),
      ),
      body: Center(
        child: Image.asset(
          'assets/$cardImage',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
