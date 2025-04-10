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
final userByIdProvider = FutureProvider<UserModel>((ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUserbyId();
});

class SearchViewModel extends StateNotifier<List<UserModel>> {
  SearchViewModel(List<UserModel> users) : super(users);
  void searchUsers(String query, List<UserModel> allUsers) {
    final lowercasedQuery = query.toLowerCase();
    final filteredUsers =
        allUsers.where((user) {
          final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
          return fullName.contains(lowercasedQuery);
        }).toList();
    state = filteredUsers;
  }
}

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, List<UserModel>>((ref) {
      return SearchViewModel([]);
    });
