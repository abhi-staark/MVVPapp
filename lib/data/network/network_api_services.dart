import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:mvvmapp1/data/exceptions_page.dart';
import 'package:mvvmapp1/data/network/base_api_services.dart';

class NetworkApiAervices extends BaseApiServices {
  @override
  //a dynamic function for getting data from a server
  Future<dynamic> getApi(String url) async {
    dynamic responseJson; // a json object to store dynamically fetched data

    if (kDebugMode) {
      print(Url);
    }
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = ReturnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

//a dynamic function for posting api data on server
  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(Url);
      print(data);
    }

    try {
      final response = await http
          .post(body: jsonEncode(data), Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      responseJson = ReturnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }
}

dynamic ReturnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw InvalidUrl('');
    default:
      throw FetchDataException('');
  }
}
