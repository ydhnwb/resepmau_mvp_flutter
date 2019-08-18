import 'package:flutter/material.dart';
import 'package:resepmau_flutter/contracts/main_activity_contract.dart';
import 'package:resepmau_flutter/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:resepmau_flutter/login_act.dart';
import 'package:resepmau_flutter/presenters/main_activity_presenter.dart';
import 'package:toast/toast.dart';
import 'package:resepmau_flutter/recipe_act.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MainActivityView{

  MainActivityPresenter presenter;
  List<Post> posts = new List();

  @override
  void initState() {
    isNotLoggedIn().then((it) {
      if(it){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginActivity()));}
      return;
    });
    presenter = MainActivityPresenter(this);
    super.initState();
  }


  Future<bool> isNotLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return (token == null || token == "undefined");
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLutter MVP / Resepmau"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginActivity()), (r) =>false);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: presenter?.all(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text('loading...');
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot);
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new recipe',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeActivity(post: Post(),)));
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  void toast(String message) => Toast.show(message, context);


  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Post> ps = snapshot.data;
    return ListView.builder(
      itemBuilder: (context, position) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeActivity(post: ps[position])));
          },
          child: Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            ps[position].title,
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            ps[position].content,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(height: 2.0, color: Colors.grey,)
              ],
            ),
          ),
        );
      },
      itemCount: ps.length,
    );
  }


}
