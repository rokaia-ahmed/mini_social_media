class DataModel{
int? id ;
String? name ;
String? image ;
String? content;
int? userId ;
String? time;

DataModel.fromJson(Map<String,dynamic> json){
  id = json['id'];
  name = json['display_name'] ;
  image = json['display_picture'] ;
  content = json['display_content'] ;
  userId = json['user_id'] ;
  time = json['2022-09-14T03:25:28.000Z'] ;
}
}