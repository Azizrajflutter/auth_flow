import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/utils/style.dart';

class AgreePolicyCheckbox extends StatefulWidget {
  final String title;
  const AgreePolicyCheckbox({
    super.key,
    required this.title,
  });

  @override
  State<AgreePolicyCheckbox> createState() => _AgreePolicyCheckboxState();
}

class _AgreePolicyCheckboxState extends State<AgreePolicyCheckbox> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.sp,
          width: 29.sp,
          child: FittedBox(
            child: IconButton(
                iconSize: 35.sp,
                onPressed: () {
                  setState(() {
                    isAgreed = !isAgreed;
                  });
                },
                icon: Icon(
                  isAgreed ? Icons.check_circle : Icons.check_circle_outline_outlined,
                  color: isAgreed ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
                )),
          ),
        ),
        Text(
          widget.title.tr,
          style: bodyMedium(context),
        )
      ],
    );
  }
}
