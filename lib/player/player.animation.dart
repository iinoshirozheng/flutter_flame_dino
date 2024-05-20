import 'package:flame/components.dart';
import 'package:flame_dino_game/game.manager.dart';
import 'package:flame_dino_game/player/player.dart';
import 'package:flame_dino_game/utils/sprite.info.dart';

class PlayerAnimation extends SpriteAnimationGroupComponent<EPlayerState>
    with HasGameRef<GameManager> {
  PlayerAnimation() : super(size: dinoWaitingSprite.size);

  @override
  Future<void> onLoad() async {
    // Define various sprite animations for the different player states
    animations = {
      EPlayerState.waiting: _getAnimation(dinoWaitingSprite),
      EPlayerState.running: _getAnimation(dinoRunningSprite),
      EPlayerState.jumping: _getAnimation(dinoJumpingSprite),
      EPlayerState.crashed: _getAnimation(dinoCrashedSprite),
    };
    final player = parent;
    if (player is Player) {
      super.current = player.state;
    }
  }

  SpriteAnimation _getAnimation(SpriteInfo info) {
    return SpriteAnimation.spriteList(
      info.frames
          .map(
            (vector) => Sprite(
              gameRef.spriteImage,
              srcSize: info.size,
              srcPosition: vector,
            ),
          )
          .toList(),
      stepTime: info.stepTime,
    );
  }

  void play(EPlayerState playerState) => super.current = playerState;
}
