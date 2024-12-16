import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/view/base/common/sizebox_sp.dart';

extension ResponsiveSizing on num {
  Widget spSizeBoxVertical() {
    return SizedBoxSp(
      height: toDouble(),
    );
  }

  Widget spSizeBoxHorizontal() {
    return SizedBoxSp(
      width: toDouble(),
    );
  }
}

extension PagePadding on BuildContext {
  EdgeInsetsGeometry pagePadding({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(horizontal: horizontal?.sp ?? 24.sp, vertical: vertical?.sp ?? 0);
  }
}
