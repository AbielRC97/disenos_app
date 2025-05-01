import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinterestState {
  int selected;
  bool show;
  Color backgroundColor;
  Color activedColor;
  Color disabledColor;
  PinterestState(
      {required this.selected,
      required this.show,
      required this.backgroundColor,
      required this.activedColor,
      required this.disabledColor});

  PinterestState copyWith(
      {int? selected,
      bool? show,
      Color? backgroundColor,
      Color? activedColor,
      Color? disabledColor}) {
    return PinterestState(
        selected: selected ?? this.selected,
        show: show ?? this.show,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        activedColor: activedColor ?? this.activedColor,
        disabledColor: disabledColor ?? this.disabledColor);
  }
}

class PinterestCubit extends Cubit<PinterestState> {
  PinterestCubit(
      {int selected = 0,
      bool show = true,
      Color backgroundColor = Colors.white,
      Color activedColor = Colors.pink,
      Color disabledColor = Colors.blueGrey})
      : super(PinterestState(
            selected: selected,
            show: show,
            backgroundColor: backgroundColor,
            activedColor: activedColor,
            disabledColor: disabledColor));
  void updateItem(int selected) {
    emit(state.copyWith(selected: selected));
  }

  void updateShow(bool show) {
    emit(state.copyWith(show: show));
  }

  void updateBackgroundColor(Color color) {
    emit(state.copyWith(backgroundColor: color));
  }

  void updateActivedColor(Color color) {
    emit(state.copyWith(activedColor: color));
  }

  void updateDisabledColor(Color color) {
    emit(state.copyWith(disabledColor: color));
  }
}
