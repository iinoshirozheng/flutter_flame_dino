import 'package:flame/flame.dart';
import 'package:flame_dino_game/game.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    Flame.device.fullScreen();
    Flame.device.setLandscape();
  }
  runApp(const DinoGameWidget());
}
