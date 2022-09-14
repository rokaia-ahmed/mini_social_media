
import 'package:mini_social_app/model/get_data_model.dart';

abstract class HomeStates{}
class InitialHomeState extends HomeStates{}

class PickImageState extends HomeStates{}

class LoadingPostState extends HomeStates{}
class SuccessPostState extends HomeStates{
}
class ErrorPostState extends HomeStates{
  String? error;
  ErrorPostState(this.error);
}

class LoadingGetPostState extends HomeStates{}
class SuccessGetPostState extends HomeStates{}
class ErrorGetPostState extends HomeStates{
  String? error;
  ErrorGetPostState(this.error);
}