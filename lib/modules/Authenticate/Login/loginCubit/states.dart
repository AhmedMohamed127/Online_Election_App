abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginOnSuccessState extends LoginStates{}

class LoginonErrorState extends LoginStates{
  String error;
  LoginonErrorState(this.error);
}

