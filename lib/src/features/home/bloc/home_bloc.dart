import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeAddedEvent>(_onAdded);
    on<HomeRemovedEvent>(_onRemoved);
  }

  void _onAdded(HomeAddedEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      list: List.of(state.list)..add('Item'),
    ));
  }

  void _onRemoved(HomeRemovedEvent event, Emitter<HomeState> emit) {
    if (state.list.isEmpty) return;
    emit(state.copyWith(
      list: List.of(state.list)..removeLast(),
    ));
  }
}
