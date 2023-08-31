part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingLogin extends AuthState {}

final class SuccessLogin extends AuthState {}

final class FailureLogin extends AuthState {
  final String errmessge;
  FailureLogin({required this.errmessge});
}

final class LoadingRegistration extends AuthState {}

final class SuccessRegistration extends AuthState {}

final class FailureRegistration extends AuthState {
  final String errmessge;
  FailureRegistration({required this.errmessge});
}
