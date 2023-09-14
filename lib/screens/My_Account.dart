import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/Default_TextFormFeildHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Default_TextFormFeild.dart';

class MyAccount extends StatelessWidget {
  // bool visa = true;
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(title: tr("myAccountScreen")),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(51.r),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius: 6.r,
                                    offset: const Offset(0, 3)),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 51.r,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 48.r,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromRGBO(0, 0, 0, 0.16),
                                    blurRadius: 6.r,
                                    offset: const Offset(0, 3)),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                color: myGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                textFormFeildHeader(header: "  ${tr("nameTextFieldHeader")}"),
                SizedBox(
                  height: 16.h,
                ),
                defaulTextFormField(
                  control: name,
                  keyboard: TextInputType.name,
                  lable: 'أحمد محمد محمد',
                ),
                SizedBox(
                  height: 45.h,
                ),
                textFormFeildHeader(header: "  ${tr("numberTextFieldHeader")}"),
                SizedBox(
                  height: 16.h,
                ),
                defaulTextFormField(
                  control: phoneNumber,
                  keyboard: TextInputType.number,
                  lable: '05 123 456 789',
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 115.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultButton(
                      function: () {},
                      text: tr("saveButton"),
                      width: 203.w,
                      height: 66.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
