import 'package:flame/components.dart';
import 'package:flame_dino_game/game.manager.dart';
import 'package:flame_dino_game/player/player.animation.dart';
import 'package:flame_dino_game/player/player.movement.dart';

enum EPlayerState { waiting, running, jumping, crashed }

class Player extends Component with HasGameRef<GameManager> {
  EPlayerState state = EPlayerState.waiting;
  final _movement = PlayerMovement();
  final _animation = PlayerAnimation();

  void jump() {
    if (state != EPlayerState.jumping) {
      state = EPlayerState.jumping;
      _movement.initVelocity();
    }
  }

  void run() => state = EPlayerState.running;

  void idle() => state = EPlayerState.waiting;

  void crashed() => state = EPlayerState.crashed;

  void reset() => _movement.reset();

  void playAnimation() => _animation.play(state);

  void resetGroundYPos() {
    _movement.groundYPos = (gameRef.size.y / 2) - _animation.height / 2;
    syncAnimationPosition();
  }

  void bindJumpAction() {
    bool activateJump = gameRef.gameState.isPlaying && gameRef.onActionJump;

    if (activateJump) {
      jump();
      gameRef.onActionJump = false;
    }
  }

  void syncAnimationPosition() => _animation.position = _movement.position;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    resetGroundYPos();
    add(_animation);
    add(_movement);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // sync player state & animation
    syncAnimationPosition();
    playAnimation();
    // jump action
    bindJumpAction();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    resetGroundYPos();
  }
}
