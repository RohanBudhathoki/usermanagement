import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart ' as http;
import 'package:usermanagerapp/data/app_exception.dart';
import 'package:usermanagerapp/data/network/base_api_services.dart';

class NetworkApiResponse extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getApiResponse(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw UnauthorizedExceeption(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occured  whhile communicationg with server ${response.statusCode}',
        );
    }
  }
}
