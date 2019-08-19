import 'package:resepmau_flutter/contracts/recipe_activity_contract.dart';
import 'package:resepmau_flutter/models/post.dart';
import 'package:dio/dio.dart';
import 'package:resepmau_flutter/webservices/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeActivityPresenter implements RecipeActivityInteractor{
  RecipeActivityView view;
  RestClient api = RestClient(Dio());
  RecipeActivityPresenter(this.view);


  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return token;
  }

  @override
  void create(String title, String content) async{
    var token = await getToken();
    token = "Bearer $token";
    await api.create(token, title, content).then((it){
      if(it.status == "1"){
        view?.toast("Successfully added");
        view?.finish();
      }else{
        view?.toast("Failed to create");
      }
    });
  }

  @override
  void delete(String id) async {
    var token = await getToken();
    token = "Bearer $token";
    await api.delete(token, id).then((it){
      if(it.status == "1"){
        view?.toast("Successfully deleted");
        view?.finish();
      }else{
        view?.toast("Failed to delete");
      }
    });
  }

  @override
  void update(String id, String title, String content) async {
    var post = Post.all(int.parse(id), title, content);
    var token = await getToken();
    token = "Bearer $token";
    var body = post.toJson();
    await api.updatePost(token, id, body).then((it) {
      if(it.status == "1"){
        view?.toast("Successfully updated");
        view?.finish();
      }else{
        view?.toast("Failed to update");
      }
    }).catchError((Object e){
      print(e);
    });
  }

}