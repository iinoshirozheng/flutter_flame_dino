import 'package:flame/components.dart';

class SpriteInfo {
  Vector2 size = Vector2.zero();
  List<Vector2> frames = [];
  double stepTime;

  SpriteInfo(this.size, this.frames, [this.stepTime = double.infinity]);
}

// Dino Sprite
final dinoRunningSprite = SpriteInfo(
    Vector2(88.0, 90.0), [Vector2(1514.0, 4.0), Vector2(1602.0, 4.0)], 0.2);
final dinoWaitingSprite = SpriteInfo(Vector2(88.0, 90.0), [Vector2(76.0, 6.0)]);
final dinoJumpingSprite =
    SpriteInfo(Vector2(88.0, 90.0), [Vector2(1339.0, 6.0)]);
final dinoCrashedSprite =
    SpriteInfo(Vector2(88.0, 90.0), [Vector2(1782.0, 6.0)]);
