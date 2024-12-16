import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/utils/extension.dart';

import '../../../utils/style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final Widget? prefix;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final double? radius;
  final bool filled;

  const CustomTextField(
      {this.controller,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.padding,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.onSubmitted,
      this.keyboardType,
      this.textInputAction,
      this.onTap,
      this.prefix,
      this.radius,
      this.filled = false,
      super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsetsDirectional.only(top: widget.labelText == null ? 5 : 15),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        controller: widget.controller,
        obscureText: _isObscured,
        validator: widget.validator,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }

          setState(() {
            _isFocused = text.isNotEmpty ||
                widget.controller!.selection.baseOffset != widget.controller!.selection.extentOffset;
          });
        },
        onFieldSubmitted: widget.onSubmitted,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!;
          }
          setState(() {
            _isFocused = widget.controller!.text.isNotEmpty ||
                widget.controller!.selection.isValid &&
                    widget.controller!.selection.baseOffset != widget.controller!.selection.extentOffset;
          });
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.prefixIcon != null)
                Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: _isFocused ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
                ),
              10.spSizeBoxHorizontal(),
              Text(
                "${widget.labelText}".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.normal,
              ),
          errorStyle: const TextStyle(fontWeight: FontWeight.normal),
          enabledBorder: widget.controller!.text.isNotEmpty
              ? border(context, color: Theme.of(context).primaryColor)
              : border(context, color: Theme.of(context).dividerColor, circular: widget.radius),
          disabledBorder: border(context, color: Theme.of(context).primaryColor),
          focusedBorder: border(context, color: Theme.of(context).primaryColor, circular: widget.radius),
          errorBorder: border(context, color: Theme.of(context).colorScheme.error, circular: widget.radius),
          focusedErrorBorder: border(context, circular: widget.radius),
          filled: widget.filled,
          fillColor: Theme.of(context).cardColor.withOpacity(0.4),
          contentPadding: EdgeInsets.all(18.sp),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                    size: 20.sp,
                    color: Theme.of(context).disabledColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}

InputBorder border(BuildContext context, {Color? color, double? circular}) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Theme.of(context).primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(circular ?? radius),
    );

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  const CustomDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // title
          if (labelText != null) ...[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                labelText!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
              ),
            ),
            const SizedBox(height: 5),
          ],
          DropdownButtonFormField(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: hintText,
              labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
              enabledBorder: border(context),
              focusedBorder: border(context, color: Theme.of(context).primaryColor),
              errorBorder: border(context, color: Theme.of(context).colorScheme.error),
              focusedErrorBorder: border(context),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: const EdgeInsets.all(15),
              suffixIcon: suffixIcon,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  InputBorder border(BuildContext context, {Color? color}) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? Theme.of(context).cardColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}
