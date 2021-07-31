import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:teenaii/core/network/custom_exception.dart';

class RestApiProvider {
  RestApiProvider({required this.httpClient});

  final http.Client httpClient;
  final String _baseUrl = "dev-api.teenaii.com";

  Future<dynamic> get(String url,
      [Map<String, dynamic>? queryParameters]) async {
    var responseJson;
    try {
      final response = await httpClient.get(Uri.https(
        _baseUrl,
        "/api$url",
        queryParameters, //Example: <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
