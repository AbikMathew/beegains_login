import 'package:beegains_login_test/core/utils/enums.dart';
import 'package:beegains_login_test/data/data_source/remote_data_source/authentication/auth_remote_data_source.dart';
import 'package:beegains_login_test/data/models/login_credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider =
    AsyncNotifierProvider<AuthAsyncNotifier, AuthState>(() {
  return AuthAsyncNotifier();
});

class AuthAsyncNotifier extends AsyncNotifier<AuthState> {
  Future<AuthState?> loginUser(LoginCredentials loginCredentials) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final loginRemoteDataSource = LoginRemoteDataSource();
      return await loginRemoteDataSource.userLogin(loginCredentials);
    });
    return null;
  }

  @override
  Future<AuthState> build() async {
    return AuthState.unauthenticated;
  }
}
