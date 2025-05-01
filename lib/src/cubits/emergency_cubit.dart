import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmergencyState {
  List<Color> gradient;

  EmergencyState({required this.gradient});

  EmergencyState copyWith({
    List<Color>? gradient,
  }) {
    return EmergencyState(
      gradient: gradient ?? this.gradient,
    );
  }
}

class EmergencyCubit extends Cubit<EmergencyState> {
  EmergencyCubit({required List<Color> gradient})
      : super(EmergencyState(gradient: gradient));

  void updateGradient(List<Color> color) =>
      emit(state.copyWith(gradient: color));
}
