import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result_type.dart';
import '../../repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginStateIdle());

  void onSubmitted(String username, String password) {
    emit(LoginStateLoading());
    final result = _authRepository.login(username, password);
    switch (result) {
      case TSuccess<void, Failure> _:
        emit(LoginStateSuccess());
      case TError<void, Failure> _:
        emit(LoginStateError());
    }
  }
}
