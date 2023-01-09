import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';
import 'package:takos/global/colors/my_colors.dart';

class CustomTextStyles {
  final heading2 = TextStyle(
    fontSize: SizeConfig().getMyDynamicFontSize(17),
    color: MyColors().grey,
  );
}
