import 'package:flutter/material.dart';

class CommonUserCard extends StatelessWidget {
  final ImageProvider backgroundImage;
  final String firstName;
  final String email;
  final String lastName;
  const CommonUserCard({
    super.key,
    required this.backgroundImage,
    required this.firstName,
    required this.email,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(radius: 35, backgroundImage: backgroundImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(firstName + lastName), Text(email)],
          ),
        ],
      ),
    );
  }
}
