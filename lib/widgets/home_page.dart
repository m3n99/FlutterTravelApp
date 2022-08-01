import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/cubit/app_cubits.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "snorkling.png": "Snorkling",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
  };
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    top: AppLayout.getHeight(30),
                    right: AppLayout.getWidth(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: AppLayout.getWidth(50),
                        height: AppLayout.getHeight(50),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(10)),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(30)),
                Container(
                  margin: EdgeInsets.only(left: AppLayout.getHeight(20)),
                  child: Text(
                    "Discover",
                    style: Styles.headLines,
                  ),
                ),
                Gap(AppLayout.getHeight(20)),
                //tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(
                          left: AppLayout.getHeight(20),
                          right: AppLayout.getHeight(30)),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                          CircleTabIndicator(color: Styles.dotColor, radius: 4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(20)),
                  height: AppLayout.getHeight(300),
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .DetailsPage(info[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: AppLayout.getHeight(15),
                                top: AppLayout.getHeight(10)),
                            width: AppLayout.getWidth(200),
                            height: AppLayout.getHeight(300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppLayout.getHeight(20)),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    const Text("There"),
                    const Text("Bye")
                  ]),
                ),

                Gap(AppLayout.getHeight(20)),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore more",
                        style: Styles.headLines.copyWith(fontSize: 22),
                      ),
                      Text(
                        "See all",
                        style: Styles.textStyle,
                      ),
                    ],
                  ),
                ),

                Gap(AppLayout.getHeight(12)),
                Container(
                  width: double.maxFinite,
                  height: AppLayout.getHeight(120),
                  margin:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            right: AppLayout.getWidth(30),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: AppLayout.getWidth(80),
                                height: AppLayout.getHeight(80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppLayout.getHeight(20)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/" +
                                          images.keys.elementAt(index)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  images.values.elementAt(index),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Error Loaded Data",
                style: Styles.headLines,
              ),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
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
        configuration.size!.width / 2.5, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
