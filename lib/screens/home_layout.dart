import 'package:final_pro/screens/Home_screen.dart';
import 'package:final_pro/screens/app_info.dart';
import 'package:final_pro/screens/category_screen.dart';
import 'package:final_pro/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
    AppinfoScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff0001fc),
        backgroundColor: Color(0xffeff5fb),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_sharp), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: 'app_info'),
        ],
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
      ),
    );
  }
}
