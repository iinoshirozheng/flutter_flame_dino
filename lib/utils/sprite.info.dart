import 'package:flame/components.dart';

class SpriteInfo {
  final Vector2 size;
  final List<Vector2> frames;
  final double stepTime;

  const SpriteInfo._internal(this.size, this.frames,
      [this.stepTime = double.infinity]);

  static final dinoRunning = SpriteInfo._internal(
      Vector2(88.0, 90.0), [Vector2(1514.0, 4.0), Vector2(1602.0, 4.0)], 0.2);
  static final dinoWaiting =
      SpriteInfo._internal(Vector2(88.0, 90.0), [Vector2(76.0, 6.0)]);
  static final dinoJumping =
      SpriteInfo._internal(Vector2(88.0, 90.0), [Vector2(1339.0, 6.0)]);
  static final dinoDucking = SpriteInfo._internal(
      Vector2(118.0, 90.0), [Vector2(1867, 4.0), Vector2(1984, 4.0)], 0.2);
  static final dinoCrashed =
      SpriteInfo._internal(Vector2(88.0, 90.0), [Vector2(1782.0, 6.0)]);
}
