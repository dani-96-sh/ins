import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkcolor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            HeaderContentGride(),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: DarkBlueColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Drew',
                      style: TextStyle(color: whitecolor, fontFamily: 'GB'),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(color: pinkcolor, fontFamily: 'GB'),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(color: whitecolor, fontFamily: 'GB'),
                    )
                  ],
                ),
              ),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  CustomScrollView HeaderContentGride() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Header(),
        ),
        SliverToBoxAdapter(
          child: Content(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item${index}.png'))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                childCount: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 3),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 20))
      ],
    );
  }

  Container Content() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      width: double.infinity,
      height: 394,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ClipRRect(
          child: FittedBox(
              fit: BoxFit.cover, child: Image.asset('images/profile.jpg')),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }

  Padding Header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(fontFamily: 'GB', color: whitecolor, fontSize: 20),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(fontSize: 16, fontFamily: 'GB', color: whitecolor),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow_right_box.png')
        ],
      ),
    );
  }
}
