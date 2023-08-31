// import 'package:coffee_app/cubits/hot_coffee/categories_item_cubit.dart';
import 'package:coffee_app/cubits/categories_cubit/categories_item_cubit.dart';
import 'package:coffee_app/veiws/widgets/category_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategortListVeiw extends StatefulWidget {
  const CategortListVeiw({super.key});

  @override
  State<CategortListVeiw> createState() => _CategortListVeiwState();
}

class _CategortListVeiwState extends State<CategortListVeiw> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<CategoriesItemCubit>(context)
                    .getAllItems(index: index);
                setState(() {});
              },
              child: CategoryName(
                index: index,
                isSelected: currentIndex == index,
              ),
            );
          },
        ));
  }
}
