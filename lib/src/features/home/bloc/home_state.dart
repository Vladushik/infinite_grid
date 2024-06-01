part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.list = const [],
  });

  final List<String> list;

  HomeState copyWith({
    List<String>? list,
  }) {
    return HomeState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object> get props => [list];
}
