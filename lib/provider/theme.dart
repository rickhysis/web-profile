import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeState extends StateNotifier<bool> {
  ThemeState(): super(false);

  void setLightTheme() => state = false;
  void setDarkTheme() => state = true;
}

final themeStateNotifier = StateNotifierProvider<ThemeState, bool>((ref){
  return ThemeState();
});
