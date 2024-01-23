import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/repository/repository.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  getWeatherInfo() async {
    state = state.copyWith(isLoading: true);
    final res = await Repository.getWeatherInfo();
    res.fold((data) {
      state = state.copyWith(weathers: data, isLoading: false);
    }, (r) {
      state = state.copyWith(isLoading: false);
    });
  }
}
