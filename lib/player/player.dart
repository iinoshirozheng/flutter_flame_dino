import 'package:flame/components.dart';
import 'package:flame_dino_game/game.manager.dart';
import 'package:flame_dino_game/player/player.animation.dart';
import 'package:flame_dino_game/player/player.movement.dart';

class Player extends Component with HasGameRef<GameManager> {
  final _movement = PlayerMovement();
  final _animation = PlayerAnimation();

  void reset() => _movement.reset();

  void crashed() => _movement.crashed();

  void playAnimation() => _animation.play(_movement.playerState);

  void resetGroundYPos() {
    _movement.groundYPos = (gameRef.size.y / 2) - _animation.height / 2;
    syncAnimationPosition();
  }

  void bindJumpAction() {
    bool activateJump = gameRef.gameState.isPlaying && gameRef.onActionJump;

    if (activateJump) {
      _movement.jump();
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
