import 'dart:async';

import 'package:blockexample/bloc/internet_bloc/internet_event.dart';
import 'package:blockexample/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubcription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternectLostEnvent>((event, emit) => emit(InternetLostState()));
    on<InternectGaintEnvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubcription = _connectivity.onConnectivityChanged.listen((res) {
      if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
        add(InternectGaintEnvent());
      } else {
        add(InternectLostEnvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubcription?.cancel();
    return super.close();
  }
}
