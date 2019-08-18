class Post {
  int _id;
  String _title;
  String _content;

  Post();

  Post.all(this._id, this._title, this._content);

  factory Post.fromJson(Map<String, dynamic> json){
    return Post.all(json["id"], json["title"], json["content"]);
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toJson(){
    return {
      "id" : _id,
      "title" : _title,
      "content" : _content
    };
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  List<Post> fromJsonList(List<dynamic> parsedJson){
    List<Post> posts = new List<Post>();
    posts = parsedJson.map((f) => Post.fromJson(f)).toList();
    return posts;
  }
}