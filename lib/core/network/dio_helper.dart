import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://woilo.devmee.tech/api',
        receiveDataWhenStatusError: true,
         headers: {
           'Content-Type':'application/json',
         }
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
     Map<String,dynamic>? query,
    required  String token ,
  }) async
  {
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'Authorization': token ,
    };
    return await dio.get(url, queryParameters : query ,);
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
      String? token  ,
  }) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Authorization': token ??'' ,
    };
    return await dio.post(
        url,
        queryParameters: query,
        data: data);
  }

  static Future<Response> putData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String token = '' ,
}) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'Authorization': token,
    };
     return await dio.put(
         url,
         queryParameters: query,
         data: data
     );
  }

}