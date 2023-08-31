import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/services/get_user_data.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetUserData().getUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userData = snapshot.data as UserModel;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${userData.userName}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Stay caffeinated and connected",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.notifications_outlined,
                    size: 40,
                    // color: Colors.white,
                  )
                ],
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
