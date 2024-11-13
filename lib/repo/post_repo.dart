import 'dart:convert';
import 'dart:io';
import 'package:untitled5/model/post_model.dart';
import 'package:http/http.dart' as http;


class PostRepo {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String, // Fixed this line
          );
        }).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } on SocketException {
      throw Exception("Error While Fetch");
    } catch (e) {
      throw Exception(e.toString()); // Fixed this line
    }
  }
}
