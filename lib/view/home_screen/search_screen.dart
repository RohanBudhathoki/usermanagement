import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usermanagerapp/models/user_model.dart';
import 'package:usermanagerapp/view/home_screen/widget/user_card.dart';
import 'package:usermanagerapp/view/user_profile/user_profile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final List<UserModel> users;

  const SearchScreen({super.key, required this.users});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String query = '';
  late List<UserModel> filteredUsers;

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;
  }

  void updateSearch(String value) {
    setState(() {
      query = value.toLowerCase();
      filteredUsers =
          widget.users.where((user) {
            final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
            return fullName.contains(query);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Users')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: updateSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserProfileScreen(user),
                          ),
                        ),
                    child: CommonUserCard(
                      backgroundImage: user.avatarImageProvider,
                      firstName: user.firstName,
                      email: user.email,
                      lastName: user.lastName,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
