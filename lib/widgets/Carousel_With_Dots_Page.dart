import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWithDotsPage extends StatefulWidget {
  List<String>? imageList;
  CarouselWithDotsPage({super.key, this.imageList});

  @override
  State<CarouselWithDotsPage> createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  late List<Widget> imageSliders = widget.imageList!
      .map(
        (e) => SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            // child: Image.network(e, fit: BoxFit.cover, width: 351.w, height: 288.h)
            child: Container(
              color: Colors.orange,
              width: 351.w,
              height: 288.h,
              child: Center(
                child: Text(
                  'text $e',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                height: 288.h,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 1,
                enlargeCenterPage: true,
                aspectRatio: .5,
                // padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(20.r),
        //   child: CarouselSlider(
        //     options: CarouselOptions(
        //         autoPlay: true,
        //         aspectRatio: 2,
        //         height: 288.h,
        //         enlargeCenterPage: true,
        //         onPageChanged: (index, reason) {
        //           _current = index;
        //         }),
        //     items: imageList.map((i) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageList!.map((e) {
            int index = widget.imageList!.indexOf(e);
            return Container(
              width: 8.w,
              height: 8.h,
              margin: EdgeInsets.only(
                  top: 20.h, left: 3.w, right: 3.w, bottom: 2.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? myGreen
                    : const Color.fromRGBO(0, 0, 0, .4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
