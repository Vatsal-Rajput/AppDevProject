import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  int userId;
  int id;
  String title;
  String body;
  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title, body: $body}';
  }
  Post({required this.userId, required this.id, required this.title, required this.body});
}
List<Post> convert(List<dynamic> l){
    List<Post> p = [];
    for(int i=0;i<l.length;i++){
      Post temp = Post(
      userId: l[i]['userId'],
      id: l[i]['id'],
      title: l[i]['title'],
      body: l[i]['body'],
    );
      p.add(temp);
    }
    return p;
  }

List<Post> filter(List<Post> l,int userid){
  List<Post> r = [];
  for(int i=0;i<l.length;i++){
    if(userid == l[i].userId){
      r.add(l[i]);
    }
  }
  return r;
}

void printList(List<Post> l){
  for(int i=0;i<l.length;i++){
    print(l[i]);
    print('\n');
  }
}

void main() async{
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    List<dynamic> cresponse = jsonDecode(response.body);
    List<Post> finalResponse = convert(cresponse);
    List<Post> filteredPost = filter(finalResponse, 2);
    printList(filteredPost);
  } 
  else {
    print('Request failed with status: ${response.statusCode}');
  }
  }