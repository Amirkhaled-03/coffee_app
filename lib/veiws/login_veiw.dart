import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/auth/auth_cubit.dart';
import 'package:coffee_app/cubits/categories_cubit/categories_item_cubit.dart';
import 'package:coffee_app/healpers/show_snack_bar.dart';
import 'package:coffee_app/veiws/bottom_navigation_bar_widget.dart';
import 'package:coffee_app/veiws/registration_veiw.dart';
import 'package:coffee_app/veiws/widgets/custom_button.dart';
import 'package:coffee_app/veiws/widgets/custom_header_container.dart';
import 'package:coffee_app/veiws/widgets/custom_text_form_feild.dart';
import 'package:coffee_app/veiws/widgets/login_or_register_now_widget.dart';
import 'package:coffee_app/veiws/widgets/custom_card_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginVeiw extends StatefulWidget {
  const LoginVeiw({super.key});
  static String id = "LoginVeiw";

  @override
  State<LoginVeiw> createState() => _LoginVeiwState();
}

class _LoginVeiwState extends State<LoginVeiw> {
  String? email, password;

  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoadingLogin) {
            isLoading = true;
          } else if (state is SuccessLogin) {
            isLoading = false;
            showSnackBar(context,text: "login successed",color: Colors.green,time: 1);
            BlocProvider.of<CategoriesItemCubit>(context).getAllItems(index: 0);
            Navigator.pushNamed(context, BottomNavigationBarWigdet.id);
          } else if (state is FailureLogin) {
            isLoading = false;
            setState(() {});
            showSnackBar(context,text: state.errmessge,color: Colors.grey,time: 1);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeaderContainer(
                    title: "Welcome back! Glad\nto see you, Again!",
                  ),
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: "Email",
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        CustomTextFormField(
                          label: "Password",
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          color: kPrimaryColor,
                          title: "Login",
                          isLoading: isLoading,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).loginUser(
                                  email: email!, password: password!);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomCardIcon(image: "Assets/photos/google.png"),
                            CustomCardIcon(image: "Assets/photos/facebook.png"),
                            CustomCardIcon(image: "Assets/photos/apple.png"),
                          ],
                        ),
                        const SizedBox(height: 40),
                        LoginOrRegisterNow(
                            title: "Don’t have an account? ",
                            titleOperation: "Register Now",
                            onTap: () {
                              Navigator.pushNamed(context, RegistrationVeiw.id);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
