class LoginModel{
  String? message ;
  String? token ;

  LoginModel({this.message ,this.token});

  LoginModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    token = json['token'];
  }
}