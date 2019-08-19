import 'package:resepmau_flutter/contracts/main_activity_contract.dart';
import 'package:resepmau_flutter/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:resepmau_flutter/webservices/api_service.dart';

class MainActivityPresenter implements MainActivityInteractor {
  MainActivityView view;
  MainActivityPresenter(this.view);
  RestClient api = RestClient(Dio());

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return token;
  }

  @override
  Future<List<Post>> all() async {
    List<Post> posts = List();
    var token = await getToken();
    token = "Bearer $token";
    await api.all(token).then((it){
      if(it.status == "1"){
        var temps = it.data;
        for(var t in temps){posts.add(Post.fromJson(t));}
      }
    });
    return posts;
  }

  @override
  void destroy() => view = null;
}