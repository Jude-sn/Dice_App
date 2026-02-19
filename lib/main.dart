import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice App',
      debugShowCheckedModeBanner: false,
      home: DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  final Random random = Random();

  void rollDice() {
    setState(() {
      leftDiceNumber = random.nextInt(6) + 1; // Generates 1 to 6
      rightDiceNumber = random.nextInt(6) + 1; // Generates 1 to 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dice App'),
        backgroundColor: Colors.redAccent, 
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dice$leftDiceNumber.png',
                  width: 160, 
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/dice$rightDiceNumber.png',
                  width: 160, 
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Total: ${leftDiceNumber + rightDiceNumber}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: rollDice, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Roll Dice', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
