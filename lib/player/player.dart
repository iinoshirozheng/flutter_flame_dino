import 'package:flame/components.dart';
import 'package:flame_dino_game/game.manager.dart';
import 'package:flame_dino_game/player/player.animation.dart';
import 'package:flame_dino_game/player/player.movement.dart';

enum EPlayerState { waiting, running, jumping, ducking, crashed }

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

  void run() => state =
      gameRef.gameState.isIntro ? EPlayerState.waiting : EPlayerState.running;

  void idle() => state = EPlayerState.waiting;

  void crashed() => state = EPlayerState.crashed;

  void ducking() => state =
      gameRef.gameState.isIntro ? EPlayerState.waiting : EPlayerState.ducking;

  void reset() => _movement.reset();

  void playAnimation() => _animation.play(state);

  Vector2 get spriteSize => _animation.size;

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
    syncAnimationPosition();
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
}
