import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MainScreen.dart';
import 'package:flutter_application_1/constant/color.dart';

void main(List<String> args) {
  runApp(Applications());
}

class Applications extends StatelessWidget {
  const Applications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headlineLarge:
                TextStyle(fontFamily: 'GB', fontSize: 13, color: whitecolor),
            headlineSmall:
                TextStyle(fontFamily: 'GB', fontSize: 16, color: greycolor),
            headlineMedium:
                TextStyle(fontFamily: 'GB', fontSize: 16, color: whitecolor)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: pinkcolor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class SplachScren extends StatelessWidget {
  const SplachScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            repeat: ImageRepeat.repeat),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(alignment: Alignment.bottomCenter, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Image(image: AssetImage('images/logo_splash.png')),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Exppert Flutter',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
