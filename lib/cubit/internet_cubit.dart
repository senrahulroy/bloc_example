import 'dart:async';

import 'package:blockexample/cubit/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetCubitState.Initial) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((res) {
      if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
        emit(InternetCubitState.Gained);
      } else {
        emit(InternetCubitState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
