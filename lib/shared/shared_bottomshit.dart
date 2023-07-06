import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

class SharedBottomShit extends StatefulWidget {
  const SharedBottomShit({this.controller, super.key});
  final ScrollController? controller;

  @override
  State<SharedBottomShit> createState() => _SharedBottomShitState();
}

class _SharedBottomShitState extends State<SharedBottomShit> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 300,
          child: _gridcontent(),
        ),
      ),
    );
  }

  Widget _gridcontent() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: widget.controller,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 67,
                    height: 5,
                    decoration: BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            color: whitecolor, fontSize: 24, fontFamily: 'GB'),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png')
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset('images/icon_search_navigation.png'),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search Users',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ))
                      ],
                    ),
                    height: 46,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 255, 255, 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _getUser();
              }, childCount: 100),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 90,
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 90)),
          ],
        ),
        Positioned(
          bottom: 20,
          child: Container(
            width: 129,
            height: 46,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)))),
              onPressed: () {},
              child: Text(
                'Send',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getUser() {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          child: ClipRRect(
              child: Image.asset('images/profile.jpg'),
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Dani Shah',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
