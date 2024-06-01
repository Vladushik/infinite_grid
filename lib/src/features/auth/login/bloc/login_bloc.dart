import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_grid/src/core/form_status_enum.dart';
import 'package:infinite_grid/src/features/auth/login/data/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginRepository repository,
  })  : _repository = repository,
        super(const LoginState()) {
    on<LoginEmailChangedEvent>(_onEmailChanged);
    on<LoginPasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_onSubmit);
  }

  final LoginRepository _repository;

  void _onEmailChanged(
    LoginEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final email = event.email;
    emit(state.copyWith(email: email));
  }

  void _onPasswordChanged(
    LoginPasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password;
    emit(state.copyWith(password: password));
  }

  Future<void> _onSubmit(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(submitStatus: FormStatus.loading));
      await _repository.login();
      emit(state.copyWith(submitStatus: FormStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          submitStatus: FormStatus.failure,
          errorSubmit: e.toString(),
        ),
      );
    }
  }
}
