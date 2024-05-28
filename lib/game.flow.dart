import 'package:flame/components.dart';
import 'package:flame_dino_game/game.manager.dart';
import 'package:flame_dino_game/player/player.dart';

import 'game.state.dart';

class GameFlow extends Component with HasGameRef<GameManager> {
  Player player = Player();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (gameRef.gameState.current) {
      case EGameState.none:
        break;
      case EGameState.loading:
        break;
      case EGameState.intro:
        break;
      case EGameState.playing:
        return _updatePlayingState(dt);
      case EGameState.gameOver:
        return;
    }
  }

  void runStateAction(EGameState toState) {
    if (gameRef.gameState.nextState != toState) {
      return;
    }

    switch (gameRef.gameState.toNext()) {
      case EGameState.none:
        return;
      case EGameState.loading:
        return;
      case EGameState.intro:
        return;
      case EGameState.playing:
        return _runRestart();
      case EGameState.gameOver:
        return _runGameOver();
    }
  }

  void _runGameOver() {
    player.crashed();
  }

  void _runRestart() {
    gameRef.gameState.playingTime = 0.0;
    player.reset();
  }

  void _updatePlayingState(double dt) {
    gameRef.gameState.playingTime += dt;
  }
}
