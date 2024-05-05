import 'package:flame/components.dart';

enum EPlayerState { waiting, running, jumping, crashed }

class PlayerMovement extends Component {
  EPlayerState playerState = EPlayerState.waiting;

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

  void jump() {
    if (playerState != EPlayerState.jumping) {
      playerState = EPlayerState.jumping;
      _jumpVelocity = initialJumpVelocity;
    }
  }

  void run() => playerState = EPlayerState.running;

  void idle() => playerState = EPlayerState.waiting;

  void crashed() => playerState = EPlayerState.crashed;

  void reset() {
    playerState = EPlayerState.running;
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
    switch (playerState) {
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
