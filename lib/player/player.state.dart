enum EPlayerState { waiting, running, jumping, crashed }

class PlayerState {
  EPlayerState current = EPlayerState.waiting;

  // Constants defining the player's physics and position.
  final double gravity = 1;
  final double initialJumpVelocity = -15.0;
  final double introDuration = 1500.0;
  final double startXPosition = 50;
  final double jumpVelocity = 0.0;
}
