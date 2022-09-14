
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_social_app/core/utils/constant.dart';
import 'package:mini_social_app/view/home/cubit/home_states.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_point.dart';
import '../../../model/get_data_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(super.initialState);
  static HomeCubit get(context) => BlocProvider.of(context);
//TODO:POST DATA
Future addPost({
  required String text,
  String image ='' ,
})async{
   emit(LoadingPostState());
   await DioHelper.postData(
        url: POSTDATA,
       token: token ,
      data:{
       'display_picture':image ,
       'display_content':text,
},
    ).then((value){
      print(value.data);
      getPost();
      emit(SuccessPostState());
    }).catchError((error){
      emit(ErrorPostState(error.toString()));
    });
  }
  /////////////////////////////////////////////////////////////////////
  //TODO:get data

  List<DataModel> data  =[];
  Future getPost()async{
    data = [];
    emit(LoadingGetPostState());
   await DioHelper.getData(
        url: GETDATA ,
        token: token,
    ).then((value){
      List test = value.data['content'] ;
      test.forEach((element) {
        data.add(DataModel.fromJson(element));
      });
      print(data[0].name);
      emit(SuccessGetPostState());
    }).catchError((error){
      print('Error when get data : ${error.toString()}');
      emit(ErrorGetPostState(error.toString()));
   });
  }

//////////////////////////////////////////////////////////////////////////////////
  //TODO: ImagePicker
   File? image ;
  final ImagePicker picker = ImagePicker();
  Future pickImage()async{
     final pickImage = (await picker.pickImage(source: ImageSource.gallery)) ;
     image = File(pickImage!.path);
       emit(PickImageState());
     }


}