import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_dino_game/game.flow.dart';

import 'dart:ui';
import 'package:flame_dino_game/game.state.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';

class GameManager extends FlameGame with KeyboardEvents, TapDetector {
  // Image
  late final Image spriteImage;

  // GameState
  GameState gameState = GameState();

  // GameFlow
  GameFlow gameFlow = GameFlow();

  // Default background color for the game.
  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  bool onActionJump = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    gameState.current = EGameState.loading;
    spriteImage = await Flame.images.load('dino.png');
    add(gameFlow);
    gameFlow.runStateAction(gameState.nextState);
  }

  // Key Event
  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.enter) ||
        keysPressed.contains(LogicalKeyboardKey.space)) {
      gameFlow.runStateAction(EGameState.playing);
      onActionJump = true;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  // Handling tap events.
  @override
  void onTapDown(TapDownInfo info) {
    onActionJump = true;
  }
}
