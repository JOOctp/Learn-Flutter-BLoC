import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/home/home_bloc.dart';
import 'package:learn_bloc/page/color_product_list_screen.dart';
import 'package:learn_bloc/page/user_list_screen.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> pages = [const UserListScreen(), const ColorProductListScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: pages[state.selectTab],
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepPurple,
              currentIndex: state.selectTab,
              onTap: (int index) =>  context.read<HomeBloc>().add(HomeSelectBottomNavBarEvent(selectTab: index)),
              elevation: 5.0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.group_outlined),
                    label: "User"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_outlined),
                    label: "Product"
                ),
              ],
            )
        );
      },
    );
  }
}
