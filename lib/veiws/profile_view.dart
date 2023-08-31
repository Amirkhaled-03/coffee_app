import 'package:coffee_app/constants.dart';
import 'package:coffee_app/services/get_user_data.dart';
import 'package:coffee_app/veiws/widgets/custom_text_field.dart';
import 'package:coffee_app/veiws/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetUserData().getUserData(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  leadingWidth: 44,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: const Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: kPrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(
                            hint: snapshot.data!.userName,
                            icon: Icons.account_box),
                        CustomTextField(
                            hint: snapshot.data!.email, icon: Icons.email),
                        const CustomTextField(
                            hint: "New Password", icon: Icons.password),
                        CustomTextField(
                            hint: snapshot.data!.phoneNumber,
                            icon: Icons.phone),
                        const CustomTextField(
                            hint: "Cairo,Maadi", icon: Icons.location_on),
                        const CustomTextField(
                            hint: "Credit Card", icon: Icons.credit_card),
                        // ProfileTextField(hint:,icon: ,),
                        const SizedBox(height: 40),
                        const CustomButton(
                            color: kPrimaryColor, title: "Update"),
                      ],
                    ),
                  ),
                ),
              )
            :const Center(
                child: Text("loading..."),
              );
      },
    );
  }
}
