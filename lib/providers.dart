import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statesBoolProvider = StateProvider<List<bool>>(
  (ref) => [false, false, false],
);

final audioPlayerProvider = StateProvider<List<AudioPlayer>>(
  (ref) => [AudioPlayer(), AudioPlayer(), AudioPlayer()],
);
