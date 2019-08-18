import 'package:flutter/material.dart';
import 'package:resepmau_flutter/contracts/recipe_activity_contract.dart';
import 'package:resepmau_flutter/presenters/recipe_activity_presenter.dart';
import 'package:toast/toast.dart';
import 'package:resepmau_flutter/models/post.dart';
class RecipeActivity extends StatefulWidget {
  Post post;

  RecipeActivity({Key key, @required this.post}) : super(key: key);

  @override
  _RecipeActivityState createState() => _RecipeActivityState();
}

class _RecipeActivityState extends State<RecipeActivity> implements RecipeActivityView{
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  RecipeActivityPresenter presenter;


  void _fill(){
    if(this.widget.post.id != null){
      titleController.text = this.widget.post.title;
      contentController.text = this.widget.post.content;
    }
  }

  @override
  void initState() {
    super.initState();
    presenter = RecipeActivityPresenter(this);
    _fill();
  }

  Widget _setupActionAppbar(){
    if(this.widget.post.id == null){
      return AppBar(title: Text("Create or edit"),);
    }else{
      return AppBar(title: Text("Create or edit"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              presenter?.delete(this.widget.post.id.toString());
            },
          ),
        ],
      );
    }
  }

  void _doSave(String title, String content){
    if(title.isNotEmpty && content.isNotEmpty){
      if(title.length > 5 && content.length > 20){
        print("Saving...");
        presenter?.create(title, content);
      }else{
        toast("Title must be at least five letter and description at least twenty letters");
      }
    }else{
      toast("Please all form first");
    }
  }

  void _doUpdate(String id, String title, String content){
    print("yah" +id);
    if(title.isNotEmpty && content.isNotEmpty){
      if(title.length > 5 && content.length > 20){
        print("Updating...");
        presenter?.update(id, title, content);
      }else{
        toast("Title must be at least five letter and description at least twenty letters");
      }
    }else{
      toast("Please all form first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _setupActionAppbar(), 
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              controller: contentController,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(this.widget.post.id == null){
            print("ujang");
            _doSave(titleController.text.trim(), contentController.text.trim());
          }else{
            print("${this.widget.post.id.toString()} ${titleController.text.trim()}");
            //presenter?.delete(this.widget.post.id.toString());
            _doUpdate(this.widget.post.id.toString(), titleController.text.trim(), contentController.text.trim());
          }
        },
      child: Icon(Icons.done),
      ),
    );
  }

  @override
  void finish() => Navigator.pop(context);

  @override
  void toast(String message) => Toast.show(message, context);
}
