import 'package:cowlar_task/model/movieModel.dart';
import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  get props => [];
}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
