import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/widgets/details_page.dart';
import 'package:travelapp/widgets/welcom_page.dart';

import '../widgets/navgationpages/bottom_bar.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomPage();
          }
          if (state is LoadedState) {
            return const BottomBar();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailState) {
            return const DetailsPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
