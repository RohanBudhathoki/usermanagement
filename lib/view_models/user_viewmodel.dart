import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/repositories/user_repo.dart';
import 'package:usermanagerapp/utils/pick_image.dart';

final userListProvider = StateNotifierProvider<UserViewModel, List<UserModel>>((
  ref,
) {
  return UserViewModel(UserRepo());
});
final avatarImageProvider = StateProvider<File?>((ref) => null);

class UserViewModel extends StateNotifier<List<UserModel>> {
  final UserRepo _repo;

  UserViewModel(this._repo) : super([]) {
    getUsers();
  }
  //getUser
  Future<void> getUsers() async {
    try {
      final users = await _repo.getUser();
      state = users;
    } catch (e) {
      print('Error: $e');
    }
  }

  //creating user / simulating a dummy network response
  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String email,
    File? avatarImage,
  }) async {
    debugger();
    final newUser = await _repo.createUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      avatarFile: avatarImage,
    );
    state = [...state, newUser];
  }

  //delete user
  Future<void> delteUser(int id) async {
    await _repo.deleteUser(id);
    state = state.where((user) => user.id != id).toList();
  }

  //imagePicking
  Future<void> pickImage(WidgetRef ref) async {
    final pickedFile = await pickImageFile();
    if (pickedFile != null) {
      ref.read(avatarImageProvider.notifier).state = pickedFile;
    }
  }

  // clears the image
  void clearImage(WidgetRef ref) {
    ref.read(avatarImageProvider.notifier).state = null;
  }
}
