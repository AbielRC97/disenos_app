import 'package:flutter_bloc/flutter_bloc.dart';

class PinterestState {
  int selected;
  PinterestState({required this.selected});

  PinterestState copyWith({
    int? selected,
  }) {
    return PinterestState(
      selected: selected ?? this.selected,
    );
  }
}

class PinterestCubit extends Cubit<PinterestState> {
  PinterestCubit({int selected = 0}) : super(PinterestState(selected: selected));
  void updateItem(int selected) {
    emit(state.copyWith(selected: selected));
  }
}
