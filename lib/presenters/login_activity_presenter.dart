import 'package:resepmau_flutter/models/user.dart';
import 'package:resepmau_flutter/contracts/login_activity_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:resepmau_flutter/webservices/api_service.dart';
import 'package:dio/dio.dart';

class LoginActivityPresenter implements LoginActivityInteractor {
  LoginActivityView view;
  LoginActivityPresenter(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("token is $token");
    await prefs.setString("api_token", token);
  }

  @override
  void destroy() => view = null;

  @override
  void login(String email, String password) async {
    await api.login(email, password).then((it){
      if(it.status == "1"){
        print(it.message);
        User u = User.fromJson(it.data);
        print("token is a ${u.api_token}");
        this.success(u.api_token);
        view?.finish();
      }else{
        view?.toast("Login gagal. Periksa email dan katasandi anda");
      }
    }).catchError((e){
      print("Exception $e");
      view?.toast("Terjadi kesalahan");
    });
  }
}