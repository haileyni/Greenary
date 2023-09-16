// main_tab_controller.dart

import 'package:flutter/material.dart';
import '../view_controller/home_page.dart';
import '../view_controller/search_page.dart';
import '../view_controller/profile_page.dart';
import '../model/tree.dart';

class MainTabController extends StatefulWidget {
  final List<Tree> trees;

  MainTabController({required this.trees});

  @override
  _MainTabControllerState createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: IndexedStack(
                index: _currentIndex,
                children: [
                  MyHomePage(trees: widget.trees),
                  T_SearchController(trees: widget.trees),
                  ProfilePage(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.green, // 设置背景颜色
                selectedItemColor: Colors.white, // 设置选中项的颜色
                unselectedItemColor:
                    Color.fromARGB(255, 154, 194, 148), // 设置未选中项的颜色
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
