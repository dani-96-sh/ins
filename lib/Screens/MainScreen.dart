import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkcolor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'item2'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'item3'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'item4'),
          ]),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
