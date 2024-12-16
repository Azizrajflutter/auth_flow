import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_repo/utils/extension.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/divider.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomDivider(
          thickness: 1,
        )),
        Padding(
          padding: context.pagePadding(horizontal: 5),
          child: Text(
            'or'.tr,
            style: bodySmall(context).copyWith(color: Theme.of(context).disabledColor),
          ),
        ),
        const Expanded(
            child: CustomDivider(
          thickness: 1,
        ))
      ],
    );
  }
}
