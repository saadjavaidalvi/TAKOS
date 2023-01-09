import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

EdgeInsets cmargin({
  double? top,
  double? bottom,
  double? left,
  double? right,
  double? vertical,
  double? horizontal,
}) {
  return EdgeInsets.only(
    left: SizeConfig().getMyDynamicWidth(horizontal ?? left ?? 0),
    right: SizeConfig().getMyDynamicWidth(horizontal ?? right ?? 0),
    top: SizeConfig().getMyDynamicHeight(vertical ?? top ?? 0),
    bottom: SizeConfig().getMyDynamicHeight(vertical ?? bottom ?? 0),
  );
}
