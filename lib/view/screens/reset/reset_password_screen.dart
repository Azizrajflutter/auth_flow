import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_repo/utils/extension.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/utils/validator.dart';
import 'package:startup_repo/view/base/common/arrow_back.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/quick_img.dart';
import 'package:startup_repo/view/base/common/textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBack(),
        title: Text('create_pass'.tr),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: pagePadding,
          children: [
            QuickImage(
              url: Images.reset_img,
              height: Get.height * 0.6,
              width: double.infinity,
            ),
            10.spSizeBoxVertical(),
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                'password_deffrent'.tr,
                style: bodyMedium(context).copyWith(color: Theme.of(context).disabledColor),
              ),
            ),
            20.spSizeBoxVertical(),
            CustomTextField(
              obscureText: true,
              controller: _passCont,
              labelText: "enter_password",
              prefixIcon: Icons.lock_outline,
              validator: (value) => Validator.validatePassword(value),
            ),
            10.spSizeBoxVertical(),
            CustomTextField(
              obscureText: true,
              controller: TextEditingController(),
              labelText: "confirm_password",
              prefixIcon: Icons.lock_outline,
              validator: (value) => Validator.validateConfirmPassword(value, _passCont.text),
            ),
            20.spSizeBoxVertical(),
            PrimaryButton(
              text: 'save',
              onPressed: () {
                if (_key.currentState!.validate()) {
                  // launchScreen(VerifyOtpScreen(
                  //   otpEmail: _controller.text.trim(),
                  // ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
