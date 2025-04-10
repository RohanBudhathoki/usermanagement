import 'package:usermanagerapp/data/network/base_api_services.dart';
import 'package:usermanagerapp/data/network/network_api_services.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/res/app_url.dart';

class UserRepo {
  BaseApiServices apiServices = NetworkApiResponse();
  Future<List<UserModel>> getUser() async {
    try {
      dynamic response = await apiServices.getApiResponse(
        AppUrl.baseUrl + AppUrl.users,
      );

      if (response['data'] != null) {
        final usersList = response['data'] as List;
        return usersList
            .map(
              (userJson) => UserModel.fromMap(userJson as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> getUserbyId() async {
    try {
      dynamic response = await apiServices.getApiResponse(
        AppUrl.baseUrl + AppUrl.users,
      );

      if (response['data'] != null) {
        final usersList = response['data'] as List;
        return response['data'];
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
