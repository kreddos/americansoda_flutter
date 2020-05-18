import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';

class RestService {
  static final RestService _rest = new RestService._internal();
  factory RestService() {
    return _rest;
  }
  RestService._internal();

  SharedPreferences _prefs;
  String _token;
  final Client _httpClient = Client();
  final String baseUri = 'https://gtp.americansoda.demo.crmplease.me/api/v1';

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
      return _prefs;
    }
    return _prefs;
  }

  setToken(String value) async {
    var prefs = await _getPrefs();
    prefs.setString('accessToken', value);
  }

  removeToken() async {
    var prefs = await _getPrefs();
    return prefs.remove('accessToken');
  }

  Future<String> getToken() async {
    if (_token != null) {
      return _token;
    }
    var prefs = await _getPrefs();
    return prefs.getString('accessToken');
  }

  Future<T> request<T>(String method, uri, {Map<String, dynamic> data}) async {
    var request = Request(method, Uri.parse('$baseUri$uri'));

    if (data != null) {
      request.body = jsonEncode(data);
    }

    var token = await getToken();
    if (token != null) {
      request.headers[HttpHeaders.authorizationHeader] = token;
    }
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json';


    return _httpClient.send(request)
        .then((response) => Response.fromStream(response))
        .then((response) {
      if (response.statusCode < 200 || response.statusCode > 204) {
        throw response;
      }

      if (response.body != '') {
        return jsonDecode(response.body);
      }

      return null;
    });
  }
}