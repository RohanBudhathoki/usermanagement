import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/repositories/user_repo.dart';

final userRepositoryProvider = Provider<UserRepo>((ref) {
  return UserRepo();
});
final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUser();
});
