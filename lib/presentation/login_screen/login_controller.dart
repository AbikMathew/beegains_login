import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/utils/common_texts.dart';
import '../../core/utils/enums.dart';
import '../../data/data_source/remote_data_source/authentication/auth_remote_data_source.dart';
import '../../data/models/login_credentials.dart';

// Create a Riverpod provider to manage authentication state
final authenticationProvider =
    AsyncNotifierProvider<AuthAsyncNotifier, AuthState>(() {
  return AuthAsyncNotifier();
});

// Define a class to manage authentication state with Riverpod
class AuthAsyncNotifier extends AsyncNotifier<AuthState> {
  final localStorage = FlutterSecureStorage();

  // Function to perform user login and update authentication state accordingly
  Future<AuthState?> loginUser(LoginCredentials loginCredentials) async {
    state = const AsyncValue.loading();

    // Use AsyncValue.guard to handle errors and loading state automatically
    state = await AsyncValue.guard(() async {
      final loginRemoteDataSource = LoginRemoteDataSource();
      return await loginRemoteDataSource.userLogin(loginCredentials);
    });
    return null;
  }

  // Function to log out the user and update authentication state
  Future<void> logoutUser() async {
    state = const AsyncValue.loading();
    await localStorage.delete(key: bearerTokenKey);
    state = AsyncValue.data(AuthState.unauthenticated);
  }

  // Function to check the authentication status of the user
  Future<AuthState> checkAuthStatus() async {
    state = const AsyncValue.loading();
    final bearerToken = await localStorage.read(key: bearerTokenKey);

    if (bearerToken == null) {
      return AuthState.unauthenticated;
    } else
      return AuthState.authenticated;
  }

  @override
  // Build function is called when the provider is initialized
  Future<AuthState> build() async {
    return checkAuthStatus();
  }
}
