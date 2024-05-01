import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class DinoGameManager extends FlameGame with HasGameRef {
  // Default background color for the game.
  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);
}
