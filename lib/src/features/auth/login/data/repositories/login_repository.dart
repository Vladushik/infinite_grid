abstract interface class LoginRepository {
  Future<void> login();
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
