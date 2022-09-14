 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/view/sign_up/cubit/states.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_point.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(super.initialState);
  static RegisterCubit get(context)=> BlocProvider.of(context);

  Future registerUser({
  required String firstName,
  required String lastName,
  required String email,
  required String password,
})async{
    emit(LoadingRegisterState());
   await DioHelper.postData(
        url: REGISTER,
        data:{
         'firstName' : firstName,
          'lastName' : lastName,
          'username' : email,
          'password' : password,
        },
    ).then((value){
      print(value.data);
      emit(SuccessRegisterState());
    }).catchError((error){
     emit(ErrorRegisterState());
    });
  }
}