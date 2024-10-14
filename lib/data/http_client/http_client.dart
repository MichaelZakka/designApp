import 'dart:convert';

import 'package:design_app/data/http_client/api_error_response.dart';
import 'package:design_app/data/http_client/api_response.dart';
import 'package:http/http.dart' as http;

class MyHttpClient {
  getRequest(
    String apiUrl,
    data,
    headers,
  ) async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      final js = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(js);
      } else {
        return ApiErrorResponse.fromJson(js);
      }
    } catch (e) {
      print(e);
    }
  }

  postRequest(
    String apiUrl,
    Map<String, dynamic>? data,
    headers,
  ) async {
    try {
      final response =
          await http.post(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      print(js);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.fromJson(js);
      }
      return ApiErrorResponse.fromJson(js);
    } catch (e) {
      print(e);
    }
  }

  putRequest(String apiUrl, data, headers) async {
    try {
      final response =
          await http.put(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(js);
      } else {
        return ApiErrorResponse.fromJson(js);
      }
    } catch (e) {
      print(e);
    }
  }

  deleteRequest(String apiUrl, data, headers) async {
    try {
      final response =
          await http.delete(Uri.parse(apiUrl), body: data, headers: headers);
      var js = jsonDecode(response.body);
      print(js);
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(js);
      }
      return ApiErrorResponse.fromJson(js);
    } catch (e) {
      print(e);
    }
  }
}
