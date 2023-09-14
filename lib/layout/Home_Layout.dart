import 'package:e_commerce/layout/screens/HomeScreen.dart';
import 'package:e_commerce/layout/screens/Search.dart';
import 'package:e_commerce/layout/screens/User_Tag.dart';
import 'package:e_commerce/layout/screens/moreScreen.dart';
import 'package:e_commerce/layout/screens/notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  GlobalKey navBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');

  TextEditingController numberController = TextEditingController();
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const Notifications(),
    Search(),
    const UserTag(),
    const MoreScreen(),
  ];
  List<String> title = [
    tr("homeScreenHeader"),
    tr("notificationHeader"),
    tr("searchHeader"),
    tr("userTagHeader"),
    'المزيد',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar:
          // homeLayoutAppBar(
          //     title: currentIndex != 0 ? title[currentIndex] : "",
          //     cartIcon: currentIndex != 0 ? true : false),
          AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: currentIndex != 0
            ? Text(
                title[currentIndex],
                style: TextStyle(
                  fontSize: 25.sp,
                  color: myGreen,
                ),
              )
            : Container(),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Icon(
              Icons.shopping_cart_rounded,
              size: 40,
              color: myGreen,
            ),
          ),
        ],
        leadingWidth: currentIndex == 0 ? 200.w : 56,
        leading: InkWell(
          onTap: () {},
          child: currentIndex != 0
              ? Icon(
                  size: 50,
                  Icons.keyboard_arrow_right_rounded,
                  color: myGreen,
                )
              : SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.w,
                          right: 40.w,
                        ),
                        child: CircleAvatar(
                          radius: 17.5.r,
                          backgroundColor: myGreen,
                        ),
                      ),
                      Text(
                        'أحمد محمد',
                        style: TextStyle(
                          color: myGreen,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color.fromRGBO(83, 172, 48, .15),
                blurRadius: 6.r,
                offset: const Offset(0, -3)),
          ]),
          height: 76.h,
          child: BottomNavigationBar(
            key: navBarGlobalKey,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? ActiveIcon(Icons.home)
                    : const Icon(
                        Icons.home,
                        size: 30,
                      ),
                label: 'homescreen',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? ActiveIcon(
                        Icons.notifications_rounded,
                      )
                    : const Icon(
                        Icons.notifications_rounded,
                        size: 30,
                      ),
                label: 'notifications',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? ActiveIcon(
                        Icons.search_rounded,
                      )
                    : const Icon(
                        Icons.search_rounded,
                        size: 30,
                      ),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
                    ? ActiveIcon(Icons.tag_faces_rounded)
                    : const Icon(
                        Icons.person,
                        size: 30,
                      ),
                label: 'user',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 4
                    ? ActiveIcon(Icons.more_horiz)
                    : const Icon(
                        Icons.more_horiz,
                        size: 30,
                      ),
                label: 'more',
              ),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

Widget ActiveIcon(IconData icon) {
  return Container(
    width: 40.w,
    height: 40.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26.5.r),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Color(0xFF91DB74),
          Color(0xFF53AC30),
        ],
      ),
    ),
    child: Icon(
      icon,
      color: Colors.white,
      size: 30,
    ),
  );
}
