import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  InternetState();

  @override
  get props => [];
}

class InternetInitialState extends InternetState {}

class InternetAvailableState extends InternetState {
  InternetAvailableState();
}

class InternetNotAvailableState extends InternetState {
  final String message;
  InternetNotAvailableState({required this.message});
}
