import 'package:beegains_login_test/core/utils/common_texts.dart';
import 'package:beegains_login_test/core/utils/enums.dart';
import 'package:beegains_login_test/data/data_source/remote_data_source/authentication/auth_remote_data_source.dart';
import 'package:beegains_login_test/data/models/login_credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final authenticationProvider =
    AsyncNotifierProvider<AuthAsyncNotifier, AuthState>(() {
  return AuthAsyncNotifier();
});

class AuthAsyncNotifier extends AsyncNotifier<AuthState> {
  final localStorage = FlutterSecureStorage();

  Future<AuthState?> loginUser(LoginCredentials loginCredentials) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final loginRemoteDataSource = LoginRemoteDataSource();
      return await loginRemoteDataSource.userLogin(loginCredentials);
    });
    return null;
  }

  Future<void> logoutUser() async {
    state = const AsyncValue.loading();
    await localStorage.delete(key: bearerTokenKey);
    state = AsyncValue.data(AuthState.unauthenticated);
  }

  Future<AuthState> checkAuthStatus() async {
    state = const AsyncValue.loading();
    final bearerToken = await localStorage.read(key: bearerTokenKey);

    if (bearerToken == null) {
      return AuthState.unauthenticated;
    } else
      return AuthState.authenticated;
  }

  @override
  Future<AuthState> build() async {
    return checkAuthStatus();
  }
}
