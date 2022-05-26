
import 'package:flutter/material.dart';
import 'package:intro_ticket/pages/home/search_travel_pages.dart';
import 'package:intro_ticket/pages/test/testPages.dart';
import 'package:intro_ticket/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

List pages = [
  SearchTravelPages(),
  TestPages(),
  Container(
    child: Center(child: Text("Next pages")),
  ),
  Container(
    child: Center(child: Text("Next pages")),
  ),
];

void onTapNav(int index) {
  setState(() {
    _selectedIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainBlackColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Itineraires"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "historique"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Achats"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Moi"
          ),
        ],
      ),
    );
  }
}