import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SearchAndCategory(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column SearchAndCategory() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Container(
            decoration: BoxDecoration(
                color: DarkBlueColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: 46,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset('images/icon_search_navigation.png'),
                SizedBox(
                  width: 11,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: whitecolor, fontFamily: 'GB'),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                )),
                Image.asset('images/icon_scan.png'),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ),
        getCategory()
      ],
    );
  }

  Widget getCategory() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: DarkBlueColor),
              margin: EdgeInsets.symmetric(horizontal: index == 0 ? 8 : 6),
              child: Text(
                'Categories',
                style: TextStyle(fontFamily: 'GM', color: whitecolor),
              ),
            ),
          );
        },
      ),
    );
  }
}
