import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode ListenerOne = FocusNode();
  FocusNode ListenerTwo = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListenerOne.addListener(() {
      setState(() {});
    });

    ListenerTwo.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [HexColor('#323A99'), HexColor('#F98BFC')])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [_getImagebackground(), _getInputBox()],
          )),
    );
  }

  Widget _getImagebackground() {
    return Positioned(
      top: 76,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Expanded(child: Image(image: AssetImage('images/rocket.png'))),
          Expanded(child: Container())
        ],
      ),
    );
  }

  Widget _getInputBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: blackcolor),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in ',
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'GB', color: whitecolor),
                    ),
                    SizedBox(
                      width: 102,
                      height: 25,
                      child: Image(
                        image: AssetImage('images/moodinger_logo.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                SizedBox(
                  width: 340,
                  height: 46,
                  child: TextField(
                    style: TextStyle(color: whitecolor),
                    focusNode: ListenerOne,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelText: ' Email',
                        labelStyle: TextStyle(
                            color:
                                ListenerOne.hasFocus ? pinkcolor : whitecolor,
                            fontSize: 20,
                            fontFamily: 'GM'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: pinkcolor, width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: greycolor2, width: 3))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 340,
                  height: 46,
                  child: TextField(
                    style: TextStyle(color: whitecolor),
                    focusNode: ListenerTwo,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelText: ' Password',
                        labelStyle: TextStyle(
                            color:
                                ListenerTwo.hasFocus ? pinkcolor : whitecolor,
                            fontSize: 20,
                            fontFamily: 'GM'),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: pinkcolor, width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: greycolor2, width: 3))),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 129,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16, fontFamily: 'GB'),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: pinkcolor),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an Account?',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(' Sign Up',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    ListenerOne.dispose();
    ListenerTwo.dispose();
    super.dispose();
  }
}
