import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/categories_cubit/categories_item_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarWigdet extends StatefulWidget {
  const BottomNavigationBarWigdet({super.key});
  static String id = "BottomNavigationBarWigdet";

  @override
  State<BottomNavigationBarWigdet> createState() => _HomeViewState();
}

class _HomeViewState extends State<BottomNavigationBarWigdet> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          if (value == 0) {
            BlocProvider.of<CategoriesItemCubit>(context).getAllItems(index: 0);
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite,
              )),
          BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                Icons.shopping_cart,
              )),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
              )),
        ],
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
      ),
    );
  }
}
