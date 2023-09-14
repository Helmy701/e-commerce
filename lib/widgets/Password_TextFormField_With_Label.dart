import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Default_TextFormFeild.dart';
import 'Default_TextFormFeildHeader.dart';

Widget passwordTextFormFeildWithLabel(
    {required TextEditingController controller}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFormFeildHeader(header: tr("passwordTextFieldHeader")),
      SizedBox(height: 16.h),
      defaulTextFormField(
        control: controller,
        keyboard: TextInputType.name,
        validat: (value) {
          if (value!.isEmpty) {
            return tr("textFeildValidation");
          }
          return null;
        },
        lable: tr("passwordTextFieldLabel"),
      ),
    ],
  );
}
