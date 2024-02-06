import 'package:flutter_bloc/flutter_bloc.dart';

enum ListTitle { considering, completed, onhold, dropped }

class UserWatchListCubit extends Cubit<ListTitle> {
  UserWatchListCubit() : super(ListTitle.considering);

  int currentIndex = 0;

  void changeList(int index) {
    currentIndex = index;
    emit(ListTitle.values[currentIndex]);
  }

  void incrementIndex() => (currentIndex < 3)
      ? changeList(currentIndex + 1)
      : changeList(currentIndex);

  void decrementIndex() => (currentIndex > 0)
      ? changeList(currentIndex - 1)
      : changeList(currentIndex);
}
