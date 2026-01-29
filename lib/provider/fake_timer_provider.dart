import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/notifier/fake_timer_notifier.dart';

final fakeTimerProvider = NotifierProvider<FakeTimerNotifier, double>(
  () => FakeTimerNotifier(),
);
