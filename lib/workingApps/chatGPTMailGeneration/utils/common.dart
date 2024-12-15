import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/workingApps/chatGPT/utils/constant.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? label,
  String? labelText,
  double? borderRadius,
  Color? borderColor,
  EdgeInsetsGeometry? contentPadding,
}) {
  return InputDecoration(
    contentPadding: contentPadding ?? EdgeInsets.only(left: 16),
    hintText: label,
    labelText: labelText,
    labelStyle: secondaryTextStyle(),
    hintStyle: secondaryTextStyle(),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: InputBorder.none,
    filled: true,
    fillColor: appStore.isDarkModeOn ? null : context.cardColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(width: 0.0, color: borderColor ?? Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
  );
}


