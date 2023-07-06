import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkcolor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: darkcolor,
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'images/item1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(10),
                        child: Container(
                          height: 14,
                          decoration: BoxDecoration(
                              color: darkcolor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: _UserData(),
                  ),
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: TabBarViewDelegite(
                      TabBar(tabs: [
                        Tab(
                          icon: Image.asset('images/icon_tab_posts.png'),
                        ),
                        Tab(
                          icon: Image.asset('images/icon_tab_bookmark.png'),
                        )
                      ]),
                    ),
                  ),
                ];
              },
              body: TabBarView(children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item${index}.png'),
                            ),
                          );
                        }, childCount: 10),
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 3,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            pattern: [
                              QuiltedGridTile(2, 1),
                              QuiltedGridTile(2, 2),
                            ]),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item${index}.png'),
                            ),
                          );
                        }, childCount: 10),
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 3,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            pattern: [
                              QuiltedGridTile(2, 1),
                              QuiltedGridTile(2, 1),
                              QuiltedGridTile(2, 1),
                            ]),
                      ),
                    ),
                  ],
                ),
              ])),
        ),
      ),
    );
  }

  Widget _UserData() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Container(
          height: 77,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: pinkcolor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                width: 66,
                height: 66,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/profile.jpg'),
                      )),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Danial Shahangi',
                      style: TextStyle(
                          color: whitecolor, fontFamily: 'GB', fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'دنی برنامه نویس فلاتر',
                      style: TextStyle(
                          color: greycolor, fontFamily: 'SM', fontSize: 15),
                    )
                  ],
                ),
              ),
              Spacer(),
              Image.asset('images/icon_profile_edit.png')
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarViewDelegite extends SliverPersistentHeaderDelegate {
  TabBarViewDelegite(this._tabBar);
  TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: darkcolor,
      child: _tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
