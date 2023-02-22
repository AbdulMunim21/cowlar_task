import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cowlar_task/blocs/internetBloc/internetEvent.dart';
import 'package:cowlar_task/blocs/internetBloc/internetState.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) async {
      emit(InternetAvailableState());
    });
    on<InternetLostEvent>((event, emit) async {
      emit(InternetNotAvailableState(message: "Internet Not Available"));
    });

    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
