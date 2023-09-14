import 'package:e_commerce/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'HomeScreen_Screens/Animal_Screen.dart';
import 'HomeScreen_Screens/Main_Screen.dart';
import 'HomeScreen_Screens/Planet_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pc = PageController();
  int currentIndex = 0;

  List<Widget> screens = [
    const MainScreen(),
    PlanetScreen(),
    const AnimalScreen(),
  ];

  List<String> title = [
    'الرئيسية',
    'ثروات نباتية',
    'ثروات حيوانية',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w),
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mainBarItem(title: 'الرئيسية', index: 0),
              mainBarItem(title: 'ثروات نباتية', index: 1),
              mainBarItem(title: 'ثروات حيوانية', index: 2)
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: pc,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return screens[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget mainBarItem({required String title, required int index}) {
    return currentIndex == index
        ? Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: myGreen,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CircleAvatar(
                radius: 5.r,
                backgroundColor: myGreen,
              ),
            ],
          )
        : InkWell(
            onTap: () => setState(() {
              currentIndex = index;
              pc.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            }),
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xffD2D2D2),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }
}
