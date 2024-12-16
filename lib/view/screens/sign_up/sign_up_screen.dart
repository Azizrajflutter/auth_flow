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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: pagePadding,
            children: [
              100.spSizeBoxVertical(),
              const Align(
                alignment: Alignment.center,
                child: QuickImage(
                  url: Images.logo1,
                  height: 100,
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              5.spSizeBoxVertical(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'register'.tr,
                  style: headlineMedium(context),
                ),
              ),
              30.spSizeBoxVertical(),
              CustomTextField(
                controller: TextEditingController(),
                labelText: "enter_user_name",
                prefixIcon: Icons.person_2_outlined,
                validator: (value) => Validator.validateName(value, error: 'username'),
              ),
              5.spSizeBoxVertical(),
              CustomTextField(
                controller: TextEditingController(),
                labelText: "enter_mail",
                prefixIcon: Icons.mail_outline,
                validator: (value) => Validator.validateEmail(value),
              ),
              5.spSizeBoxVertical(),
              CustomTextField(
                obscureText: true,
                controller: _passCont,
                labelText: "enter_password",
                prefixIcon: Icons.lock_outline,
                validator: (value) => Validator.validatePassword(value),
              ),
              5.spSizeBoxVertical(),
              CustomTextField(
                obscureText: true,
                controller: TextEditingController(),
                labelText: "confirm_password",
                prefixIcon: Icons.lock_outline,
                validator: (value) => Validator.validateConfirmPassword(value, _passCont.text),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AgreePolicyCheckbox(
                    title: 'confirm',
                  ),
                  PrimaryTextBotton(
                    onTap: () {},
                    text: 'terms_conditions',
                  )
                ],
              ),
              30.spSizeBoxVertical(),
              PrimaryButton(
                text: 'sign_up',
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
                    text: 'sign_in'.tr,
                    onTap: () {
                      pop();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
