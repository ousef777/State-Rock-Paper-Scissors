import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String player1 = "paper";
  String player2 = "rock";
  String winner = "Player 1";

  void play() {
    List<String> choice = ["rock", "paper", "scissors"];
    Random rnd = Random();
    int random1 = rnd.nextInt(3);
    int random2 = rnd.nextInt(3);

    player1 = choice[random1];
    player2 = choice[random2];
    if (random1 == random2) winner = "Tie";
    else if ((random1-random2).abs() == 1) {
      if (random2 > random1) winner = "The Winner is Player 2";
      else winner = "The Winner is Player 1";
    }
    else if (random2 == 0) winner = "The Winner is Player 2";
    else winner = "The Winner is Player 1";
    
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ROCK PAPER SCISSORS"), 
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/$player1.png"),
                      const Text("Player 1", style: TextStyle(fontSize: 20.0),)
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/$player2.png"),
                      const Text("Player 2", style: TextStyle(fontSize: 20.0),)
                    ],
                  ),
                ),
              ],
            ),
            Text(winner, style: const TextStyle(fontSize: 20.0),),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.orange),
                fixedSize: WidgetStatePropertyAll(Size(200, 100)),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 28))
              ),
              onPressed: play, 
              child: const Text("Play")
            )
          ]
        ),
      ),
    );
  }
}
