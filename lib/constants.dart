import 'package:flutter/material.dart';
import 'package:coffee_app/veiws/cart_view.dart';
import 'package:coffee_app/veiws/home_view.dart';
import 'package:coffee_app/veiws/image_picker.dart';
import 'package:coffee_app/veiws/profile_view.dart';
import 'package:coffee_app/veiws/widgets/favorite_veiw.dart';

const kTertiaryColor = Color(0xff6C2313);
const kPrimaryColor = Color(0xff633E27);
const kSecondaryColor = Color(0xffCBCBD4);

const double tax = 14.42;

List<Widget> screens = [
  const HomeVeiw(),
  const FavoriteVeiw(),
  const CartView(),
  const ProfileView(),
  const ImagePickerView(),
];
