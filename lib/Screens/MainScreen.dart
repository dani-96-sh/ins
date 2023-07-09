import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/ActivityStatus.dart';
import 'package:flutter_application_1/Screens/Search_screen.dart';
import 'package:flutter_application_1/Screens/UserProScreen.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Screens/login_screen.dart';
import 'package:flutter_application_1/Screens/post_content.dart';
import 'package:flutter_application_1/constant/color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedItems,
          onTap: (index) {
            setState(() {
              selectedItems = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkcolor,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                label: 'item1',
                activeIcon: Image.asset('images/icon_active_home.png')),
            BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: 'item2'),
            BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: 'item3'),
            BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: 'item4'),
            BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: greycolor, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 30,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.jpg'),
                    ),
                  ),
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: pinkcolor, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 30,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.jpg'),
                    ),
                  ),
                ),
                label: 'item5'),
          ]),
      body: IndexedStack(
        index: selectedItems,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomePage(),
      SearchScreen(),
      PostScreen(),
      ActivityStatus(),
      UserProfile()
    ];
  }
}
