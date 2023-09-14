import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/Name_TextFormField_With_Label.dart';
import 'package:e_commerce/widgets/Password_TextFormField_With_Label.dart';
import 'package:e_commerce/widgets/Phone_TextFormField_With_Label.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/Default_Button.dart';
import '../../../widgets/Default_TextFormFeild.dart';
import '../../../widgets/Default_TextFormFeildHeader.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Background(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 68.h),
            child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          screenHeaderText(
                            header: tr("signUpScreenHeader"),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      nameTextFormFeildWithLabel(controller: nameController),
                      SizedBox(
                        height: 45.h,
                      ),
                      phoneTextFormFeildWithLabel(controller: numberController),
                      SizedBox(height: 45.h),
                      passwordTextFormFeildWithLabel(
                          controller: passwordController),
                      SizedBox(height: 45.h),
                      textFormFeildHeader(
                          header: tr("repasswordTextFieldHeader")),
                      SizedBox(height: 16.h),
                      defaulTextFormField(
                        control: repasswordController,
                        keyboard: TextInputType.visiblePassword,
                        isPassword: true,
                        validat: (value) {
                          if (value.isEmpty) {
                            return tr("textFeildValidation");
                          } else if (value != passwordController) {
                            return tr("repasswordTextFeildValidation");
                          }
                          return null;
                        },
                        lable: tr("repasswordTextFieldLabel"),
                      ),
                      SizedBox(height: 15.5.h),
                      Row(
                        children: [
                          SizedBox(
                            height: 15.80,
                            width: 15.80,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              checkColor: Colors.white,
                              activeColor: myDarkRed,
                              value: isChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                            ),
                          ),
                          Text(
                            tr("termsAndConditionsAcceptance"),
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: myDarkRed,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65.w),
                        child: defaultButton(
                            text: tr("signUpButton"),
                            height: 66.h,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                print(nameController.text);
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
                            tr("askingForHavingAnAccount"),
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: myDarkRed,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //todo later
                            },
                            child: Text(
                              tr("openSignINPage"),
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
