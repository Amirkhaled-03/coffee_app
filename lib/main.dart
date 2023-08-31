import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:coffee_app/cubits/auth/auth_cubit.dart';
import 'package:coffee_app/cubits/categories_cubit/categories_item_cubit.dart';
import 'package:coffee_app/cubits/favorites/favorites_cubit.dart';
import 'package:coffee_app/firebase_options.dart';
import 'package:coffee_app/simple_block_observer.dart';
import 'package:coffee_app/veiws/bottom_navigation_bar_widget.dart';
import 'package:coffee_app/veiws/login_veiw.dart';
import 'package:coffee_app/veiws/onboarding_veiw.dart';
import 'package:coffee_app/veiws/registration_veiw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'cubits/hot_coffee/categories_item_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CategoriesItemCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => AddToCartCubit()),
      ],
      child: MaterialApp(
        routes: {
          OnboardingVeiw.id: (context) => const OnboardingVeiw(),
          LoginVeiw.id: (context) => const LoginVeiw(),
          RegistrationVeiw.id: (context) => const RegistrationVeiw(),
          BottomNavigationBarWigdet.id: (context) =>
              const BottomNavigationBarWigdet(),
        },
        theme: ThemeData(fontFamily: "Lato"),
        debugShowCheckedModeBanner: false,
        initialRoute: OnboardingVeiw.id,
      ),
    );
  }
}
