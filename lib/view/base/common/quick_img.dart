import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickImage<T> extends StatelessWidget {
  const QuickImage({
    super.key,
    this.width = 60,
    this.height = 60,
    required this.url,
    this.fit,
    this.backgroundColor,
    this.color,
    this.loaderIconSize,
    this.errorUrl,
    this.radius,
    this.loaderWidget,
    this.padding,
  });

  final double? height;
  final double? width;
  final Size? loaderIconSize;
  final Color? backgroundColor;
  final Color? color;
  final Widget? loaderWidget;
  final T url;
  final BoxFit? fit;
  final BorderRadiusGeometry? radius;
  final String? errorUrl;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // print(url is IconData);
    // print(url);
    //
    // print(color);

    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Container(
        color: backgroundColor,
        height: height?.sp,
        width: width?.sp,
        padding: padding,
        child: _buildImage(context),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (url is File) {
      return Image.file(
        url as File,
        fit: fit ?? BoxFit.cover,
        width: width?.sp,
        height: height?.sp,
      );
    } else {
      return url.toString().toLowerCase().endsWith("png")
          ? _buildPngImage(context)
          : _buildCachedNetworkImage(context);
    }
  }

  Widget _buildPngImage(BuildContext context) {
    return Image.asset(
      "$url",
      height: height?.sp,
      width: width?.sp,
      fit: fit,
      color: color,
    );
  }

  // Widget _buildSvgImage(BuildContext context) {
  //   return url.toString().contains("http")
  //       ? SvgPicture.network(
  //           url.toString(),
  //           height: height?.sp,
  //           width: width?.sp,
  //           fit: fit ?? BoxFit.cover,
  //           colorFilter: color != null
  //               ? ColorFilter.mode(color!, BlendMode.srcIn)
  //               : null,
  //         )
  //       : SvgPicture.asset(
  //           url.toString(),
  //           height: height?.sp,
  //           width: width?.sp,
  //           fit: fit ?? BoxFit.cover,
  //           colorFilter: color != null
  //               ? ColorFilter.mode(color!, BlendMode.srcIn)
  //               : null,
  //         );
  // }

  Widget _buildCachedNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      progressIndicatorBuilder: (context, child, progress) =>
          loaderWidget ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      cacheKey: "$url",
      errorWidget: (context, str, dyn) => _buildErrorWidget(context),
      imageUrl: url.toString(),
      width: width?.sp,
      height: height?.sp,
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    try {
      if (errorUrl != null) {
        Image.asset(
          errorUrl!,
          fit: fit ?? BoxFit.cover,
          width: width?.sp,
          height: height?.sp,
        );
      }
      return const Placeholder();
    } catch (e) {
      rethrow;
    }
  }
}
