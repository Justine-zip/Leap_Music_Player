import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/notifier/theme_notifier.dart';

final themeProvider = NotifierProvider<ThemeNotifier, bool>(() {
  return ThemeNotifier();
});
