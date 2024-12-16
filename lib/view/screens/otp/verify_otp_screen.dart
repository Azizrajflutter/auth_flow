import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/extension.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/arrow_back.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/quick_img.dart';
import 'package:startup_repo/view/screens/reset/reset_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String otpEmail;
  const VerifyOtpScreen({super.key, required this.otpEmail});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify_email'.tr),
        leading: const ArrowBack(),
      ),
      body: ListView(padding: pagePadding, children: [
        QuickImage(
          url: Images.otp_img,
          height: Get.height * 0.6,
          width: double.infinity,
        ),
        10.spSizeBoxVertical(),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'enter_4_digits'.tr,
                style: bodyMedium(context).copyWith(color: Theme.of(context).disabledColor),
                children: [
                  TextSpan(
                    text: widget.otpEmail,
                    style: bodyMedium(context).copyWith(fontWeight: FontWeight.w600),
                  )
                ])),
        10.spSizeBoxVertical(),
        OtpTextField(
          // contentPadding: EdgeInsets.only(top: 20, bottom: 20),
          fieldHeight: 60.sp, margin: context.pagePadding(horizontal: 10),
          fieldWidth: 60.sp,
          numberOfFields: 4,
          autoFocus: true,
          borderWidth: 0,
          enabled: true,
          enabledBorderColor: Theme.of(context).disabledColor,
          borderRadius: borderRadius,
          fillColor: Theme.of(context).cardColor,
          filled: true,
          showFieldAsBox: true,
          onCodeChanged: (String code) {},

          onSubmit: (String verificationCode) {
            log(verificationCode);
          },
        ),
        20.spSizeBoxVertical(),
        PrimaryButton(
          text: 'verify_code',
          onPressed: () {
            launchScreen(const ResetPasswordScreen());
          },
        ),
        Align(
            alignment: Alignment.center,
            child: PrimaryTextBotton(
              onTap: () {},
              text: 'resend',
              textStyle: bodyMedium(context).copyWith(color: Theme.of(context).disabledColor),
            ))
      ]),
    );
  }
}
