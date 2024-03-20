import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/utility/hive_utility.dart';

enum Modes { light, dark }

class ThemeModeCubit extends Cubit<Modes> {
  ThemeModeCubit(super.prefMode);

  void changeTheme() {
    if (state == Modes.light) {
      HiveUtility.setPreferredThemeMode = 'dark';
      emit(Modes.dark);
    } else {
      HiveUtility.setPreferredThemeMode = 'light';
      emit(Modes.light);
    }
  }
}
