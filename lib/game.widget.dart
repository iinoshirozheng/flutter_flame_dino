import 'package:flame_dino_game/game.manager.dart';
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:flame/game.dart';

class DinoGameWidget extends StatelessWidget {
  const DinoGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dino',
      home: Container(
        margin: const EdgeInsets.all(45.0),
        child: ClipRect(
          child: GameWidget(
            game: DinoGameManager(),
            loadingBuilder: (_) => const Center(child: Text('Loading')),
          ),
        ),
      ),
    );
  }
}
