import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/utils/app_buttons.dart';
import 'package:travelapp/utils/app_layout.dart';
import 'package:travelapp/utils/app_styles.dart';
import 'package:travelapp/utils/button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final int _starts = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(

      builder: (context, state) {
         DetailState detail = state as DetailState;

        return Scaffold(
          body: Container(
            margin: const EdgeInsets.all(1),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: AppLayout.getHeight(350),
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage( "http://mark.bslmeiyu.com/uploads/"+ detail.placeD.img),
                            fit: BoxFit.cover),
                      ),
                    )),
                Positioned(
                  left: AppLayout.getWidth(20),
                  top: AppLayout.getHeight(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: AppLayout.getHeight(300),
                    child: Container(
                      padding: EdgeInsets.all(AppLayout.getWidth(20)),
                      width: MediaQuery.of(context).size.width,
                      height: AppLayout.getHeight(500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(30)),
                            topRight: Radius.circular(AppLayout.getHeight(30)),
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detail.placeD.name,
                                  style: Styles.headLines,
                                ),
                                Text(
                                  "\$"+detail.placeD.price.toString(),
                                  style: Styles.headLines
                                      .copyWith(color: Styles.textColor1),
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Styles.mainColor,
                                ),
                                Gap(AppLayout.getHeight(7)),
                                Text(
                                  detail.placeD.location,
                                  style: Styles.headLines3
                                      .copyWith(color: Styles.bigTextColor),
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(20)),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      color: detail.placeD.stars > index
                                          ? Styles.starColor
                                          : Styles.textColor2,
                                    );
                                  }),
                                ),
                                Gap(AppLayout.getHeight(10)),
                                 Text(
                                  detail.placeD.stars.toString()+".0",
                                  style: const TextStyle(
                                    color: Styles.textColor2,
                                  ),
                                ),
                              ],
                            ),
                            Gap(AppLayout.getHeight(30)),
                            Text(
                              "People",
                              style: Styles.headLines.copyWith(fontSize: 22),
                            ),
                            Gap(AppLayout.getHeight(5)),
                            Text(
                              "Number of people in your group",
                              style: Styles.headLines3,
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: AppLayout.getHeight(10)),
                                    child: AppButtons(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      size: 60,
                                      bgColor: selectedIndex == index
                                          ? Colors.black
                                          : Styles.buttonBackground,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : Styles.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              "Description",
                              style: Styles.headLines.copyWith(fontSize: 22),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                             detail.placeD.description,
                              style: Styles.headLines3.copyWith(fontSize: 14.5),
                            ),
                          ]),
                    )),
                // Icon and Button in the bottom
                Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButtons(
                          size: 60,
                          color: Styles.textColor1,
                          bgColor: Colors.white,
                          borderColor: Styles.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        Gap(AppLayout.getHeight(20)),
                        AppButton(
                          isResponsive: true,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
