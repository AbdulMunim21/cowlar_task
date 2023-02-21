import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  get props => [];
}

class InternetInitialState extends InternetState {}

class InternetAvailableState extends InternetState {
  final bool available;
  const InternetAvailableState({required this.available});
}

class InternetNotAvailableState extends InternetState {
  final String message;
  const InternetNotAvailableState({required this.message});
}
