import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/model/enum/ActionActivity.dart';

class ActivityStatus extends StatefulWidget {
  const ActivityStatus({super.key});

  @override
  State<ActivityStatus> createState() => _ActivityStatusState();
}

class _ActivityStatusState extends State<ActivityStatus>
    with TickerProviderStateMixin {
  TabController? _TabBarController;

  @override
  void initState() {
    super.initState();
    _TabBarController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkcolor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: TabBar(
                    controller: _TabBarController,
                    indicatorColor: pinkcolor,
                    indicatorWeight: 4,
                    labelColor: whitecolor,
                    labelStyle: TextStyle(fontSize: 16, fontFamily: 'GB'),
                    tabs: [Text('Following'), Text('You')]),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _TabBarController,
                  children: [SampelList(), SampelList()]),
            ),
          ],
        ),
      ),
    );
  }

  Widget SampelList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Container(
              child: Text(
                'New',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 24, color: whitecolor),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActionActivity.following);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Container(
              child: Text(
                'Today',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 24, color: whitecolor),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActionActivity.Liking);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Container(
              child: Text(
                'This Week',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 24, color: whitecolor),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActionActivity.Messaging);
          }, childCount: 8),
        )
      ],
    );
  }

  Widget getRow(ActionActivity status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: pinkcolor),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Danial Shahangi',
                    style: TextStyle(color: whitecolor, fontFamily: 'GB'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Start following',
                    style: TextStyle(color: greycolor2, fontFamily: 'GM'),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'You',
                    style: TextStyle(color: greycolor2, fontFamily: 'GM'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(color: whitecolor, fontFamily: 'GB'),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          getActionActivity(status)
        ],
      ),
    );
  }

  Widget getActionActivity(ActionActivity status) {
    switch (status) {
      case ActionActivity.Liking:
        return Container(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              child: Image.asset('images/profile.jpg'),
            ),
          ),
        );

      case ActionActivity.following:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(fontSize: 14, fontFamily: 'GB'),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(fontSize: 12, color: greycolor2, fontFamily: 'GB'),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: greycolor2, width: 2)),
        );
    }
  }
}
