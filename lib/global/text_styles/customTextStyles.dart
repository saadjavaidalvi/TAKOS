import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';
import 'package:takos/global/colors/my_colors.dart';

class CustomTextStyles {
  final heading2 = TextStyle(
    fontSize: SizeConfig().getMyDynamicFontSize(17),
    color: MyColors().grey,
  );

  final heading1 = TextStyle(
    fontSize: SizeConfig().getMyDynamicFontSize(20),
    color: MyColors().grey,
  );

  final smallText = TextStyle(
    fontSize: SizeConfig().getMyDynamicFontSize(13),
    color: MyColors().grey,
  );

  final body = TextStyle(
    fontSize: SizeConfig().getMyDynamicFontSize(14),
    color: MyColors().grey,
  );
}
