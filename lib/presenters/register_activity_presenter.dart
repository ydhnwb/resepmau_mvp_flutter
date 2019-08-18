import 'package:resepmau_flutter/models/user.dart';
import 'package:resepmau_flutter/contracts/register_activity_contract.dart';
import 'package:dio/dio.dart';
import 'package:resepmau_flutter/webservices/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterActivityPresenter implements RegisterActivityInteractor{
  RegisterActivityView view;
  RegisterActivityPresenter(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
  }

  @override
  void destroy() => view = null;

  @override
  void register(String name, String email, String password) async {
    await api.register(name, email, password).then((it){
      if(it.status == "1"){
        User user = User.fromJson(it.data);
        success(user.api_token);
        view?.finish();
      }else{
        view?.toast("Register gagal. Mungkin email sudah digunakan orang lain");
      }
    }).catchError((e){
      print(e);
      view?.toast("Terjadi kesalahan. Coba lagi nanti");
    });
  }
}