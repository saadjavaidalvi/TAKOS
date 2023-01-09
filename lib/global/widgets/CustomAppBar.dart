import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_kit/responsive_kit.dart';
import 'package:takos/global/colors/my_colors.dart';
import 'package:takos/global/widgets/custom_margins.dart';

Widget customAppBar({
  String title = '',
  List<Widget>? actions,
  Widget? leading,
  double height = 50,
  List<Widget>? contents,
  Color? appBarColor,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: MyColors().black.withOpacity(.25),
          offset: const Offset(0, 4),
        ),
      ],
      color: appBarColor ?? Colors.white,
    ),
    height: SizeConfig().getMyDynamicHeight(110),
    padding: cmargin(
      horizontal: 24,
      vertical: 15,
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: contents ?? [],
        ),
      ),
    ),
  );
}
/* 
class CustomAppBar extends StatefulWidget {
  final double height;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBar({
    super.key,
    this.height = 50,
    this.title = '',
    this.leading,
    this.actions,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        title: Text(
          widget.title,
        ),
        actions: widget.actions ?? [],
        leading: widget.leading,
      ),
      preferredSize: Size.fromHeight(
        SizeConfig().getMyDynamicHeight(widget.height),
      ),
    );
  }
}
 */
