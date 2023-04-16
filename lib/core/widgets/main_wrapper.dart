import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/widgets/app_backgrand.dart';
import 'package:flutter_weather_app/core/widgets/bottom_nav.dart';
import 'package:flutter_weather_app/features/feature_bookmark/presention/screen/bookmark_screen.dart';
import 'package:flutter_weather_app/features/feature_weather/presention/screen/home_Screen.dart';


class MainWrapper extends StatelessWidget {
   MainWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    List<Widget> pageViewWidget = [
    const HomeScreen(),
     const BookMarkScreen(),
    ];

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(Controller: pageController),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover,
          )
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}

