import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderState {
  final double currentPage;
  final Color primaryColor;
  final Color secondaryColor;

  SliderState({
    required this.currentPage,
    required this.primaryColor,
    required this.secondaryColor,
  });

  // copia el estado para actualizar solo una parte
  SliderState copyWith({
    double? currentPage,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return SliderState(
      currentPage: currentPage ?? this.currentPage,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }
}

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(
      {double currentPage = 0,
      Color primaryColor = Colors.pinkAccent,
      Color secondaryColor = Colors.blueGrey})
      : super(SliderState(
          currentPage: currentPage,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ));

  void updatePage(double page) {
    emit(state.copyWith(currentPage: page));
  }

  void updatePrimaryColor(Color color) {
    emit(state.copyWith(primaryColor: color));
  }

  void updateSecondaryColor(Color color) {
    emit(state.copyWith(secondaryColor: color));
  }
}
