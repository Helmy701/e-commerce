import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Carousel_With_Dots_Page.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20.r),
                //   child: CarouselSlider(
                //     options: CarouselOptions(
                //       autoPlay: true,
                //       aspectRatio: 2,
                //       height: 288.h,
                //       enlargeCenterPage: true,
                //     ),
                //     items: [1, 2, 3, 4, 5].map((i) {
                //       //imageList.map
                //       return Builder(
                //         builder: (BuildContext context) {
                //           return Container(
                //               alignment: Alignment.center,
                //               width: 200,
                //               // width: MediaQuery.of(context).size.width,
                //               margin: const EdgeInsets.symmetric(horizontal: 5.0),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20.r),
                //                 color: Colors.amber,
                //               ),
                //               child: Text(
                //                 'text $i',
                //                 style: const TextStyle(fontSize: 16.0),
                //               ));
                //         },
                //       );
                //     }).toList(),
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                CarouselWithDotsPage(
                    imageList: const ['1', '2', '3', '4', '5']), //imageList
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    screenHeaderText(header: 'برتقال'),
                    Icon(
                      Icons.favorite_border,
                      color: myGreen,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                Text(
                  'Lorim ads;llkfj ;alslkdfj; dagj gg;lk fsgk afs asdf dasf ds fdsgd gg b dg r g g gdh ar  errs agv g ag  eafjgh agskl jn;agdsh gg;',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: const Color(0xff707070),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اسم التاجر',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: myGreen,
                      ),
                    ),
                    Text(
                      'المدينة',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: myDarkRed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '5 ر.س/كيلو',
                      style: TextStyle(
                        color: myGreen,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    defaultButton(
                      function: () {},
                      text: 'اضافة للسلة',
                      height: 66.h,
                      width: 203.w,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
