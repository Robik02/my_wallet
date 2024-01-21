import 'package:flutter/material.dart';
import 'package:my_wallet/cards/card_scan.dart';

import '../profile/profile_screen.dart';
import 'card_detail_screen.dart';

class CardsScreen extends StatelessWidget {
  CardsScreen({Key? key}) : super(key: key);

  // Simulace karet používatele
  List<String> userCards = [
    '25-2-1024x472.png',
    'ID_front.png',
    'Osvedcenie PS.jpg',
    'VP front.jpg',
    'preukaz_1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karty používateľa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userCards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CardDetailScreen(cardImage: userCards[index]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/${userCards[index]}',
                  height: 100.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCard(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addCard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
  }
}
