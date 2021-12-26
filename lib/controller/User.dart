import 'package:storapp/controller/woocommerce.dart';
class User{
   String email;
   String password;

  User({this.email,this.password});

  User.formJson(Map<String,dynamic> json){
    email = json['email'];
    password = json['password'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>() ;
    data['email'] = this.email;
    data['password'] = this.password;

    return data ;
  }

   String toString() {
     return '$runtimeType($email, $password)';
   }


}