import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<bool> {
  @override
  build() => false;

  void toggleTheme() {
    state = !state;
  }

  void setDark() => state = true;
  void setLight() => state = false;
}
