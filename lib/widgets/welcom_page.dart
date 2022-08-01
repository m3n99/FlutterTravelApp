import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/utils/app_layout.dart';
import 'package:travelapp/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:travelapp/utils/button.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  //List text_change =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: EdgeInsets.only(
                    top: AppLayout.getHeight(150),
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trips",
                          style: Styles.headLines.copyWith(fontSize: 35),
                        ),
                        Text(
                          "Mountain",
                          style: Styles.headLines2.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        Gap(AppLayout.getHeight(15)),
                        Container(
                          width: AppLayout.getWidth(250),
                          padding: EdgeInsets.symmetric(
                              vertical: AppLayout.getHeight(5)),
                          child: Text(
                            "Mountain hikes give you an incredible sense of freedom along with endurance test ",
                            style: Styles.headLines3,
                          ),
                        ),
                        Gap(AppLayout.getHeight(35)),
                        GestureDetector(
                          onTap: (() {
                            BlocProvider.of<AppCubits>(context).getData();
                          }),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 120,
                            child: Row(
                              children: [AppButton(
                                isResponsive: false,
                              ),],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: AppLayout.getWidth(8),
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppLayout.getWidth(8)),
                            color: index == indexDots
                                ? Styles.mainColor
                                : Styles.mainColor.withOpacity(0.4),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
