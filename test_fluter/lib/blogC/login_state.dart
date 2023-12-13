class LoginState {
  final bool isSuccess;
  final bool isFail;
  final bool isLoading;

  LoginState({required this.isSuccess, required this.isFail, required this.isLoading});

  factory LoginState.initial() {
    return LoginState(isSuccess: false, isFail: true, isLoading: false);
  }

  factory LoginState.success() {
    return LoginState(isSuccess: true, isFail: false, isLoading: false);
  }

  factory LoginState.loading() {
    return LoginState(isSuccess: false, isFail: false, isLoading: true);
  }

  factory LoginState.fail() {
    return LoginState(isSuccess: false, isFail: true, isLoading: false);
  }

}