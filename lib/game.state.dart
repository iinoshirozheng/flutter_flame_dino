enum EGameState {
  none,
  loading,
  intro,
  playing,
  gameOver;

  EGameState get getNextState {
    switch (this) {
      case EGameState.none:
        return EGameState.none;
      case EGameState.loading:
        return EGameState.intro;
      case EGameState.intro:
        return EGameState.playing;
      case EGameState.playing:
        return EGameState.gameOver;
      case EGameState.gameOver:
        return EGameState.playing;
    }
  }
}

class GameState {
  // player number
  int playerNum = 1;

  // game score
  int score = 0;
  int highScore = 0;
  int distanceTraveled = 0;

  //  Variables to manage the game state and game logic.
  EGameState current = EGameState.none;
  double currentSpeed = 0.0;
  double playingTime = 0.0;

  // Constants for controlling game speed.
  double acceleration = 10;
  double maxSpeed = 2500.0;
  double startSpeed = 600;

  void toNextState() => current = current.getNextState;
}
