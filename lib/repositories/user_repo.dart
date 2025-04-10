import 'dart:developer';

import 'package:usermanagerapp/data/network/base_api_services.dart';
import 'package:usermanagerapp/data/network/network_api_services.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/res/app_url.dart';

class UserRepo {
  BaseApiServices apiServices = NetworkApiResponse();
  Future<List<UserModel>> getUser() async {
    try {
      debugger();
      dynamic response = await apiServices.getApiResponse(
        AppUrl.baseUrl + AppUrl.users,
      );

      if (response is List) {
        return response
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
