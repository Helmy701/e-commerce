import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/Default_TextFormFeild.dart';
import 'package:e_commerce/widgets/Name_TextFormField_With_Label.dart';
import 'package:e_commerce/widgets/Phone_TextFormField_With_Label.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/Default_TextFormFeildHeader.dart';

class ContactWithUs extends StatelessWidget {
  ContactWithUs({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: 'التواصل معنا',
        cartIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            nameTextFormFeildWithLabel(
              controller: nameController,
            ),
            phoneTextFormFeildWithLabel(controller: phoneController),
            textFormFeildHeader(header: 'البريد الإلكترونى'),
            defaulTextFormField(
              control: emailController,
              keyboard: TextInputType.emailAddress,
              lable: 'ادخل البريد الإلكترونى',
            ),
            textFormFeildHeader(header: 'الرسالة'),
            defaultButton(function: () {}, text: tr("send"))
          ],
        ),
      ),
    );
  }
}
