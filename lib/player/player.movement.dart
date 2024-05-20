import 'package:flame/components.dart';
import 'package:flame_dino_game/player/player.dart';

class PlayerMovement extends Component {
  // Constants defining the player's physics and position.
  final double gravity = 1;
  final double initialJumpVelocity = -15.0;
  final double introDuration = 1500.0;
  final double startXPosition = 50;

  // player property
  double _jumpVelocity = 0.0;
  double groundYPos = 0.0;
  Vector2 position = Vector2(0, 0);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _onFloor();
  }

  void initVelocity() => _jumpVelocity = initialJumpVelocity;

  void reset() {
    final player = parent;
    if (player is Player) {
      player.state = EPlayerState.running;
    }
    position.y = groundYPos;
    _jumpVelocity = 0.0;
  }

  void _onAir() {
    position.y += _jumpVelocity;
    _jumpVelocity += gravity;
    if (position.y > groundYPos) {
      reset();
    }
  }

  void _onFloor() => position.y = groundYPos;

  void checkXPos(double dt) {
    // Logic to move the player to the starting X position during the game's intro phase.
    position.x < startXPosition
        ? position.x += (startXPosition / introDuration) * dt * 5000
        : position.x = startXPosition;
  }

  @override
  void update(double dt) {
    super.update(dt);
    final player = parent;
    if (player is Player) {
      switch (player.state) {
        case EPlayerState.waiting:
          {
            checkXPos(dt);
            return _onFloor();
          }
        case EPlayerState.running:
          return _onFloor();
        case EPlayerState.jumping:
          return _onAir();
        case EPlayerState.crashed:
          return;
      }
    }
  }
}
