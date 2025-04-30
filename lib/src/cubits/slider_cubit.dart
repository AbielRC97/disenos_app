import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderState {
  final double currentPage;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  SliderState(
      {required this.currentPage,
      required this.primaryColor,
      required this.secondaryColor,
      required this.bulletPrimary,
      required this.bulletSecondary});

  // copia el estado para actualizar solo una parte
  SliderState copyWith({
    double? currentPage,
    Color? primaryColor,
    Color? secondaryColor,
    double? bulletPrimary,
    double? bulletSecondary,
  }) {
    return SliderState(
      currentPage: currentPage ?? this.currentPage,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      bulletPrimary: bulletPrimary ?? this.bulletPrimary,
      bulletSecondary: bulletSecondary ?? this.bulletSecondary,
    );
  }
}

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(
      {double currentPage = 0,
      required double bulletPrimary,
      required double bulletSecondary,
      Color primaryColor = Colors.pinkAccent,
      Color secondaryColor = Colors.blueGrey})
      : super(SliderState(
            currentPage: currentPage,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            bulletPrimary: bulletPrimary,
            bulletSecondary: bulletSecondary));

  void updatePage(double page) {
    emit(state.copyWith(currentPage: page));
  }

  void updatePrimaryColor(Color color) {
    emit(state.copyWith(primaryColor: color));
  }

  void updateSecondaryColor(Color color) {
    emit(state.copyWith(secondaryColor: color));
  }

  void updateBulletPrimary(double primary) {
    emit(state.copyWith(bulletPrimary: primary));
  }

  void updateBulletSecondary(double secondary) {
    emit(state.copyWith(bulletSecondary: secondary));
  }
}
