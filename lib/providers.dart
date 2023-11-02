import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final statesBoolProvider = StateProvider<List<bool>>(
  (ref) => [false, false, false],
);

// final sourceIntProvider = StateProvider<List<int>>(
//   (ref) => [0, 0, 0],
// );

final prefsProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final waterVolumeProvider = StateProvider<int>(
  (ref) {
    final prefs = ref.watch(prefsProvider);
    // final boolTest = ref.watch(statesBoolProvider);
    // print("inside $boolTest");
    List<String> secondsList =
        prefs.value?.getStringList('theList') ?? ['0', '0', '0'];

    int litres = (int.parse(secondsList[0]) * 0.15 +
            int.parse(secondsList[1]) * 0.25 +
            int.parse(secondsList[2]) * 0.2)
        .round();
    return litres;
  },
);

final audioPlayerProvider = StateProvider<List<AudioPlayer>>(
  (ref) => [AudioPlayer(), AudioPlayer(), AudioPlayer()],
);
