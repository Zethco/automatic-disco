import 'dart:async';

import '../../core/failure/failure.dart';
import '../../core/result_type.dart';
import '../models/auth_status.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;

  void validate();

  Future<ResultType<void, Failure>> login(String username, String password);

  Future<void> logout();

  void dispose();
}
