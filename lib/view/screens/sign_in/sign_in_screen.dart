import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/extension.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/utils/validator.dart';
import 'package:startup_repo/view/base/common/agree_policy_box.dart';
import 'package:startup_repo/view/base/common/divider_row.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/quick_img.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/screens/forget/forget_screen.dart';
import 'package:startup_repo/view/screens/sign_up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: pagePadding,
          children: [
            100.spSizeBoxVertical(),
            Align(
              alignment: Alignment.center,
              child: QuickImage(
                url: Images.logo1,
                height: 100,
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            10.spSizeBoxVertical(),
            Align(
              alignment: Alignment.center,
              child: Text('welcome_back'.tr, style: headlineMedium(context)),
            ),
            30.spSizeBoxVertical(),
            CustomTextField(
              controller: TextEditingController(),
              labelText: "enter_mail",
              prefixIcon: Icons.email_outlined,
              validator: (value) => Validator.validateEmail(value),
            ),
            5.spSizeBoxVertical(),
            CustomTextField(
              obscureText: true,
              controller: TextEditingController(),
              labelText: "enter_password",
              prefixIcon: Icons.lock_outline,
              validator: (value) => Validator.validatePassword(value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AgreePolicyCheckbox(
                  title: 'remember_me',
                ),
                PrimaryTextBotton(
                  onTap: () {
                    launchScreen(const ForgetScreen());
                  },
                  text: 'forget_password',
                )
              ],
            ),
            30.spSizeBoxVertical(),
            PrimaryButton(
              text: 'sign_in',
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
            20.spSizeBoxVertical(),
            const DividerRow(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuickImage(
                  width: 45,
                  height: 45,
                  url: Images.google_logo,
                ),
                QuickImage(
                  url: Images.fb_logo,
                )
              ],
            ),
            5.spSizeBoxVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dont_have_acc'.tr),
                PrimaryTextBotton(
                  text: 'sign_up'.tr,
                  onTap: () {
                    launchScreen(const SignUpScreen());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
