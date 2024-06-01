part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeAddedEvent extends HomeEvent {
  const HomeAddedEvent();

  @override
  List<Object> get props => [];
}

final class HomeRemovedEvent extends HomeEvent {
  const HomeRemovedEvent();

  @override
  List<Object> get props => [];
}
