import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../widgets/Default_Button.dart';

// ignore: must_be_immutable
class ActivationCode extends StatelessWidget {
  OtpFieldController otpController = OtpFieldController();

  var formKey = GlobalKey<FormState>();

  ActivationCode({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        screenHeaderText(
                            header: tr("activationCodeScreenHeader")),
                        SizedBox(
                          height: 55.h,
                        ),
                        Text(
                          tr("activationCodeScreenText"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: myDarkRed,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        OTPTextField(
                            controller: otpController,
                            length: 4,
                            width: MediaQuery.of(context).size.width,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 50,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 8,
                            style: const TextStyle(fontSize: 17),
                            onChanged: (pin) {
                              print("Changed: $pin");
                            },
                            onCompleted: (pin) {
                              print("Completed: $pin");
                            }),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '00:59',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: myDarkRed,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 145.h,
                        ),
                        defaultButton(
                            text: tr("sendButton"),
                            height: 66.h,
                            width: 203.w,
                            function: () {
                              if (formKey.currentState!.validate()) {}
                            }),
                        SizedBox(
                          height: 13.5.h,
                        ),
                      ],
                    ),
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
