import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/extension.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/utils/validator.dart';
import 'package:startup_repo/view/base/common/arrow_back.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/quick_img.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/screens/otp/verify_otp_screen.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBack(),
        title: Text('forget'.tr),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: pagePadding,
          children: [
            QuickImage(
              url: Images.forget_img,
              height: Get.height * 0.6,
              width: double.infinity,
            ),
            10.spSizeBoxVertical(),
            CustomTextField(
              controller: _controller,
              labelText: "enter_mail",
              prefixIcon: Icons.email_outlined,
              validator: (value) => Validator.validateEmail(value),
            ),
            20.spSizeBoxVertical(),
            PrimaryButton(
              text: 'send_code'.tr,
              onPressed: () {
                if (_key.currentState!.validate()) {
                  launchScreen(VerifyOtpScreen(
                    otpEmail: _controller.text.trim(),
                  ));
                }
              },
            ),
            5.spSizeBoxVertical(),
            Align(
                alignment: Alignment.center,
                child: PrimaryTextBotton(
                  onTap: () {},
                  text: 'try_othe_way'.tr,
                  textStyle: bodyMedium(context).copyWith(color: Theme.of(context).disabledColor),
                ))
          ],
        ),
      ),
    );
  }
}
