import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmergencyState {
  List<Color> gradient;
  IconData icon;

  EmergencyState({required this.gradient, required this.icon});

  EmergencyState copyWith({List<Color>? gradient, IconData? icon}) {
    return EmergencyState(
        gradient: gradient ?? this.gradient, icon: icon ?? this.icon);
  }
}

class EmergencyCubit extends Cubit<EmergencyState> {
  EmergencyCubit({required List<Color> gradient, required IconData icon})
      : super(EmergencyState(gradient: gradient, icon: icon));

  void updateGradient(List<Color> color) =>
      emit(state.copyWith(gradient: color));
}
