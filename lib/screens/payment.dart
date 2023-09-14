import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Default_TextFormFeild.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // bool visa = true;
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardOwner = TextEditingController();
  TextEditingController expiryData = TextEditingController();
  TextEditingController ccv = TextEditingController();

  String? paymentWay = 'visa';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(title: tr("payment")),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25.w,
                    height: 25.h,
                    child: Radio(
                      value: 'visa',
                      groupValue: paymentWay,
                      onChanged: (val) {
                        setState(() {
                          paymentWay = val;
                        });
                      },
                      activeColor: myGreen,
                    ),
                  ),
                  Text(
                    tr("visa"),
                    style: TextStyle(
                      color: myGreen,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 118.w,
                  ),
                  SizedBox(
                    width: 25.w,
                    height: 25.h,
                    child: Radio(
                      value: 'mada',
                      groupValue: paymentWay,
                      activeColor: myGreen,
                      onChanged: (val) {
                        setState(() {
                          paymentWay = 'mada';
                        });
                      },
                    ),
                  ),
                  Text(
                    tr("mda"),
                    style: TextStyle(
                      color: myGreen,
                      fontSize: 18.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 55.h,
              ),
              defaulTextFormField(
                control: cardNumber,
                keyboard: TextInputType.number,
                validat: (value) {
                  if (value.isEmpty) {
                    return tr("textFeildValidation");
                  }
                  return null;
                },
                lable: tr("cardnumberTextFieldLabel"),
              ),
              SizedBox(
                height: 11.h,
              ),
              defaulTextFormField(
                control: cardOwner,
                keyboard: TextInputType.number,
                validat: (value) {
                  if (value.isEmpty) {
                    return tr("textFeildValidation");
                  }
                  return null;
                },
                lable: tr("ownerNameTextFieldLabel"),
              ),
              SizedBox(
                height: 11.h,
              ),
              Row(
                // textDirection: TextDirection.rtl,
                children: [
                  defaulTextFormField(
                    control: ccv,
                    keyboard: TextInputType.number,
                    width: 160.w,
                    validat: (value) {
                      if (value.isEmpty) {
                        return tr("textFeildValidation");
                      }
                      return null;
                    },
                    lable: 'CCV',
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  defaulTextFormField(
                    control: expiryData,
                    width: 160.w,
                    keyboard: TextInputType.number,
                    validat: (value) {
                      if (value.isEmpty) {
                        return tr("textFeildValidation");
                      }
                      return null;
                    },
                    lable: 'Expiry data',
                  ),
                ],
              ),
              SizedBox(
                height: 270.h,
              ),
              defaultButton(
                function: () {},
                text: tr("checkoutButton"),
                width: 203.w,
                height: 66.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
