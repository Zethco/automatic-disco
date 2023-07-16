import 'dart:async';

import '../../core/failure/failure.dart';
import '../../core/result_type.dart';
import '../../domain/models/auth_status.dart';
import '../../domain/repositories/auth_repository.dart';
import '../preferences/preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Preferences _preferences;

  AuthRepositoryImpl(this._preferences);

  final _statusController = StreamController<AuthStatus>();

  @override
  Stream<AuthStatus> get status => _statusController.stream;

  @override
  void validate() {
    final token = _preferences.getToken();
    if (token == null) {
      _statusController.add(AuthStatus.unauthenticated);
    } else {
      _statusController.add(AuthStatus.authenticated);
    }
  }

  @override
  Future<ResultType<void, Failure>> login(
      String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _preferences.setToken('new-token');
    _statusController.add(AuthStatus.authenticated);
    return TSuccess(null);
  }

  @override
  Future<void> logout() async {
    _preferences.setToken(null);
    _statusController.add(AuthStatus.unauthenticated);
  }

  @override
  void dispose() {
    _statusController.close();
  }
}
