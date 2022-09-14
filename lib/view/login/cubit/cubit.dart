import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/model/login_model.dart';
import 'package:mini_social_app/view/login/cubit/states.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_point.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(super.initialState);

  static LoginCubit get(context) => BlocProvider.of(context);
   LoginModel? loginModel ;
  Future loginUser({
  required String email,
  required String password,
})async{
    emit(LoadingLoginState());
  await DioHelper.postData(
        url: LOGIN,
        data:{
          'username':email,
          'password': password,
        },
    ).then((value){
     loginModel = LoginModel.fromJson(value.data);
      emit(SuccessLoginState(loginModel));
      print(loginModel!.token);
    }).catchError((error){
      emit(ErrorLoginState(error.toString()));
      print('Error when login${error.toString()} ');
    });
  }

}
