import 'package:coffee_app/cubits/auth/auth_cubit.dart';
import 'package:coffee_app/healpers/show_snack_bar.dart';
import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/veiws/login_veiw.dart';
import 'package:coffee_app/veiws/widgets/custom_button.dart';
import 'package:coffee_app/veiws/widgets/custom_card_icon.dart';
import 'package:coffee_app/veiws/widgets/custom_header_container.dart';
import 'package:coffee_app/veiws/widgets/custom_text_form_feild.dart';
import 'package:coffee_app/veiws/widgets/login_or_register_now_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class RegistrationVeiw extends StatefulWidget {
  const RegistrationVeiw({super.key});
  static String id = "RegistrationVeiw";

  @override
  State<RegistrationVeiw> createState() => _RegistrationVeiwState();
}

class _RegistrationVeiwState extends State<RegistrationVeiw> {
  String? userName, password, email, phoneNumber;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingRegistration) {
              isLoading = true;
            } else if (state is SuccessRegistration) {
              BlocProvider.of<AuthCubit>(context).createUser(UserModel(
                  userName: userName!,
                  email: email!,
                  password: password!,
                  phoneNumber: phoneNumber!));
              isLoading = false;
              showSnackBar(context,
                  text: "Account created,login now",
                  color: Colors.green,
                  time: 2);

              Navigator.pushNamed(context, LoginVeiw.id);
            } else if (state is FailureRegistration) {
              isLoading = false;
              showSnackBar(context,
                  text: state.errmessge, color: Colors.grey, time: 2);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  const CustomHeaderContainer(
                    title: "Hello! Register to\nget started",
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: "User name",
                          onChanged: (value) {
                            userName = value;
                          },
                        ),
                        CustomTextFormField(
                          label: "Phone number",
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        CustomTextFormField(
                          label: "Email",
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          label: "Password",
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        CustomButton(
                            color: kPrimaryColor,
                            isLoading: isLoading,
                            title: "Register",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<AuthCubit>(context)
                                    .registerUser(
                                  email: email!,
                                  password: password!,
                                );
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            }),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomCardIcon(image: "Assets/photos/google.png"),
                            CustomCardIcon(image: "Assets/photos/facebook.png"),
                            CustomCardIcon(image: "Assets/photos/apple.png"),
                          ],
                        ),
                        const SizedBox(height: 15),
                        LoginOrRegisterNow(
                            title: "Already have an account? ",
                            titleOperation: "Login Now",
                            onTap: () {
                              Navigator.pushNamed(context, LoginVeiw.id);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
