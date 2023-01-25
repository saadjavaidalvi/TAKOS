import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';
import 'package:takos/global/colors/my_colors.dart';

class CustomTextStyles {
  final heading2 = TextStyle(
    fontSize: SizeConfig().getMyDynamicWidth(
      17,
      maxlimit: 17,
    ),
    color: MyColors().grey,
  );

  final heading1 = TextStyle(
    fontSize: SizeConfig().getMyDynamicWidth(
      20,
      maxlimit: 20,
    ),
    // SizeConfig().getMyDynamicFontSize(20),
    color: MyColors().grey,
  );

  final smallText = TextStyle(
    fontSize: SizeConfig().getMyDynamicWidth(
      13,
      maxlimit: 13,
    ),
    color: MyColors().grey,
  );

  final body = TextStyle(
    fontSize: SizeConfig().getMyDynamicWidth(
      14,
      maxlimit: 14,
    ),
    color: MyColors().grey,
  );
}
