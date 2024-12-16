import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedBoxSp extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const SizedBoxSp({super.key, this.height, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.sp,
      width: width?.sp,
      child: child,
    );
  }
}
