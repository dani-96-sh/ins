import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/shared/shared_bottomshit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blackcolor,
          elevation: 0,
          title: Container(
              width: 128,
              height: 24,
              child: Image.asset('images/moodinger_logo.png')),
          actions: [
            Container(
              height: 26,
              width: 26,
              margin: EdgeInsets.only(right: 17),
              child: Image.asset('images/icon_direct.png'),
            )
          ],
        ),
        backgroundColor: darkcolor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: DraggableScrollableSheet(
                                  initialChildSize: 0.5,
                                  maxChildSize: 0.65,
                                  minChildSize: 0.2,
                                  builder: (context, controller) {
                                    return SharedBottomShit(
                                      controller: controller,
                                    );
                                  }),
                            );
                          });
                    },
                    child: Text('click me')),
              ),
              SliverToBoxAdapter(
                child: Line_story(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: [
                      index == 0
                          ? SizedBox(
                              height: 15,
                            )
                          : SizedBox(
                              height: 34,
                            ),
                      Userdata(),
                      SizedBox(
                        height: 0,
                      ),
                      PostUser()
                    ],
                  );
                }, childCount: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container Line_story() {
    return Container(
      height: 116,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? add_storybox()
              : Column(
                  children: [
                    Profile(12),
                    Text(
                      'Danishah',
                      style: TextStyle(color: greycolor2),
                    )
                  ],
                );
        },
      ),
    );
  }

  ListView final_list() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return Complet_post();
      },
    );
  }

  Column Complet_post() {
    return Column(
      children: [
        SizedBox(
          height: 32,
        ),
        Userdata(),
        PostUser()
      ],
    );
  }

  Center PostUser() {
    return Center(
      child: Container(
        width: 394,
        height: 415,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 380,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/profile.jpg'),
              ),
            ),
            Positioned(
                top: 25,
                right: 25,
                child: Image.asset('images/icon_video.png')),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 340,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.2),
                          ]),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_hart.png'),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '2.6 K',
                              style: TextStyle(
                                  color: whitecolor, fontFamily: 'GB'),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 42,
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_comments.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1.2 K',
                              style: TextStyle(
                                  fontFamily: 'GB', color: whitecolor),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image.asset('images/icon_share.png'),
                        SizedBox(
                          width: 54,
                        ),
                        Image.asset('images/icon_save.png'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Userdata() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          Profile(0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DanialShahangi',
                  style: TextStyle(
                      color: whitecolor, fontFamily: 'GB', fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'دنی برنامه نویس فلاتر',
                  style: TextStyle(
                      fontFamily: 'SM', fontSize: 12, color: whitecolor),
                )
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget Profile(double vertical) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: vertical),
      child: Column(
        children: [
          DottedBorder(
            color: pinkcolor,
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            dashPattern: [40, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget add_storybox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17), color: whitecolor),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: blackcolor),
                child: Image(image: AssetImage('images/icon_plus.png')),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Your Story',
            style: TextStyle(color: whitecolor, fontSize: 14),
          )
        ],
      ),
    );
  }
}
