import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_getapi/core/models/user.dart';
import 'package:http_getapi/core/resources/environtment.dart';

class UserHttp {

  Future<List<User>> listOfUsers() async {
    try {
      var resp = await http.get(Uri.parse(endpoint));
      if (resp.statusCode == 200) {
        List<dynamic> userList = jsonDecode(resp.body);
        List<User> users = userList.map((e) => User.fromJson(e)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<User>> users() async {
    try {
      var resp = await http.get(Uri.parse(endpoint));
      if (resp.statusCode == 200) {
        List<dynamic> userList = jsonDecode(resp.body);
        List<User> users = userList.map((e) => User.fromJson(e)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> addUsers(String name) async {
  try {
    var body = {"name": name};
    var resp = await http.post(Uri.parse(endpoint), body: jsonEncode(body));
    if (resp.statusCode <= 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}


  Future<bool> addUser(String name, {DateTime? date, String avatar = "avatar", String id = "1"}) async {
    try {
      Map<String, dynamic> userMap = User(name: name, createdAt: DateTime.now(), avatar: avatar, id: id).toJson();
      var resp = await http.post(Uri.parse(endpoint), body: userMap);
      print("resp ${resp.body}");
      if (resp.statusCode <= 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> updateUsers(String name) async {
    try {
      var body = {"name": name};
      var resp = await http.put(Uri.parse(endpoint), body: body);
      if (resp.statusCode <= 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteUsers(String id) async {
    try {
      var resp = await http.delete(Uri.parse("$endpoint/$id"));
      if (resp.statusCode <= 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
