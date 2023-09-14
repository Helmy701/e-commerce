import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'من نحن', cartIcon: false),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            'ads;gkjls asg lgskjhgasls hgs dfskljhgs  gkjfkjgfaljhgalhdsga  gkjahl f gdsakj hgdlshgdskh dgslkhjdgs hdsglkjh gsjhj gdskljhgdsalkh gads;kh g kjlhgkdsh lgkdskjh kjlgk lkh lkgakjhgslak hldghl dskgds ;kghj l gkh jl hlkgh l kjhfdlkh agkjl hgalh lkadgshagdshj gfakj ghadsiuh gdsiukh gdkjh gadskjhgd skljgds grlakjhrae hlkfjggfhghkgdh ;ghlkbhj',
            style: TextStyle(
              color: myGreen,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
