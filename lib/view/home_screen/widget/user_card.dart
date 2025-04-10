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
    final screenWidth = MediaQuery.of(context).size.width;
    double containerPadding = screenWidth < 600 ? 10.0 : 20.0;
    double avatarRadius = screenWidth < 600 ? 30.0 : 35.0;
    return Container(
      padding: EdgeInsets.all(containerPadding),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: avatarRadius, backgroundImage: backgroundImage),
          SizedBox(width: containerPadding),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$firstName $lastName',

                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(email, overflow: TextOverflow.ellipsis, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
