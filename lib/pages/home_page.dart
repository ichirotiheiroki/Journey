import 'package:flutter/material.dart';
import 'package:journey/misc/colors.dart';
import 'package:journey/widgets/app_large_text.dart';
import 'package:journey/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images = {
    "balloning.png" : "Balloning",
    "hiking.png" : "Hiking",
    "kayaking.png" : "Kayaking",
    "snorkling.png" : "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black54,),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(height: 20),
          //tapBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4),
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ]
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "img/mountain.jpeg"
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      );
                  },

                ),
                Text("There"),
                Text("data"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore", size: 22,),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
                itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                "img/"+images.keys.elementAt(index)
                            ),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: AppText(
                          text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }

}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius * 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}