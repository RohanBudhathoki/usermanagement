import 'dart:io';

import 'package:usermanagerapp/data/network/base_api_services.dart';
import 'package:usermanagerapp/data/network/network_api_services.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/res/app_url.dart';

class UserRepo {
  BaseApiServices apiServices = NetworkApiResponse();

  //getting user from API
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

  //creation of user
  Future<UserModel> createUser({
    required String firstName,
    required String lastName,
    required String email,
    File? avatarFile,
  }) async {
    try {
      var data = {"name": firstName + lastName, "job": "leader"};
      dynamic response = await apiServices.postApiResponse(
        AppUrl.baseUrl + AppUrl.users,
        data,
      ); // this is response is not being used right now because the free api doesnt support it

      String avatarUrl = avatarFile!.path;

      return UserModel(
        id: DateTime.now().millisecondsSinceEpoch,
        email: email,
        firstName: firstName,
        lastName: lastName,
        avatarUrl: avatarUrl,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  // deleting the user
  Future<void> deleteUser(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  //update the user
  Future<UserModel> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    File? avatarFile,
  }) async {
    String avatarUrl = avatarFile!.path;

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatarUrl: avatarUrl,
    );
  }
}
