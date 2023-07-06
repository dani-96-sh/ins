import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

class SwitchAcount extends StatelessWidget {
  const SwitchAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkcolor,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'images/switch_account_background.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 210,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromRGBO(255, 255, 255, 0.5),
                                    Color.fromRGBO(255, 255, 255, 0.2)
                                  ]),
                              borderRadius: BorderRadius.circular(15)),
                          width: 340,
                          height: 352,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage('images/profile.jpg'),
                                  width: 150,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Dani Shahangi',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 46,
                                width: 129,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Confirm'),
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                ),
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              Text('Switch Account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 145, bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do you have any Account?',
                      style: TextStyle(
                          fontFamily: 'GB', color: greycolor, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SignUp',
                      style: TextStyle(
                          fontFamily: 'GB', color: whitecolor, fontSize: 18),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
