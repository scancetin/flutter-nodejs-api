import 'package:flutter_api/models/characters.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Chars> getJsonDatas() async {
  final response = await http.get(Uri.parse("http://127.0.0.1:8000"));
  var post = Chars.fromJson(json.decode(response.body));
  return post;
}
