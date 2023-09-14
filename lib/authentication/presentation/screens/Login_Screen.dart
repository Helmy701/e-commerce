import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constant.dart';
import '../../../widgets/Default_Button.dart';
import '../../../widgets/Password_TextFormField_With_Label.dart';
import '../../../widgets/Phone_TextFormField_With_Label.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var numberController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 37.h,
            ),
            child: Container(
              height: 550.h,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: Color.fromRGBO(83, 172, 48, 0.16),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Form(
                // to can make falidate in TextFormField
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          screenHeaderText(
                            header: tr("logInScreenHeader"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      phoneTextFormFeildWithLabel(controller: numberController),
                      SizedBox(
                        height: 45.h,
                      ),
                      passwordTextFormFeildWithLabel(
                          controller: passwordController),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // todo later
                            },
                            child: Text(
                              tr("forgetPasswordText"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: myDarkRed,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65.w),
                        child: defaultButton(
                            text: tr("signInButton"),
                            height: 66.h,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                print(numberController.text);
                              }
                            }),
                      ),
                      SizedBox(
                        height: 13.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr("askingForNotHavingAnAccount"),
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: myDarkRed,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //todo later
                            },
                            child: Text(
                              tr("openSignUpPage"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: myDarkRed,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
