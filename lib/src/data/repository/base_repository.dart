import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/src/constants/constants.dart';

class BaseRepository {
  get(String name, [String? params]) async {
    Map<String, String> paramsObject = {};
    if (params != null)
      params.split('&').forEach((element) {
        paramsObject[element.split('=')[0].toString()] =
            element.split('=')[1].toString();
      });
    http.Response response = await http.get(
      params == null
          ? Uri.http(baseUrl, '/' + name)
          : Uri.http(baseUrl, '/' + name, paramsObject),
      headers: getHeader(),
    );
    return response;
  }

  post(String name, Map<String, dynamic> body) async {
    return await http.post(
      Uri.http(baseUrl, '/' + name),
      headers: getHeader(),
      body: jsonEncode(body),
      
    );
  }

  put(String name, Map<String, dynamic> body) async {
    return await http.put(
      Uri.http(baseUrl, '/' + name),
      headers: getHeader(),
      body: jsonEncode(body),
    );
  }

  delete(String name, {Map<String, dynamic>? body}) async {
    return await http.delete(
      Uri.http(baseUrl, '/' + name),
      headers: getHeader(),
    );
  }

  getHeader([String? token]) {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Authorization': 'Bearer $token',
    };
  }

  getProfile(String name, String token) async{
    http.Response response = await http.get(
       Uri.http(baseUrl, '/'+name),
      headers: getHeader(token),
    );
    return response;
  }
}
