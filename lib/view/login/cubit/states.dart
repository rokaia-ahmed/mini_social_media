import 'package:mini_social_app/model/login_model.dart';

abstract class LoginStates{}
class InitialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}
class SuccessLoginState extends LoginStates {
  LoginModel? loginModel ;
  SuccessLoginState(this.loginModel);
}
class ErrorLoginState extends LoginStates {
  String error ;
  ErrorLoginState(this.error);
}