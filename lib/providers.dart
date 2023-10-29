import 'package:flutter_riverpod/flutter_riverpod.dart';

final statesBoolProvider = StateProvider<List<bool>>(
  (ref) => [false, false, false],
);
