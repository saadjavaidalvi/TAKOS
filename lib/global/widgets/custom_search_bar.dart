import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_kit/responsive_kit.dart';

import '../colors/my_colors.dart';
import '../text_styles/customTextStyles.dart';
import 'custom_margins.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: cmargin(
          horizontal: 18,
        ),
        padding: cmargin(
          horizontal: 8,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyColors().black.withOpacity(.2),
        ),
        height: SizeConfig().getMyDynamicHeight(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              color: MyColors().grey,
              size: SizeConfig().getMyDynamicFontSize(24),
            ),
            Expanded(
              child: Padding(
                padding: cmargin(
                  horizontal: 6,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintStyle: CustomTextStyles().heading2.copyWith(
                          height: 0.5,
                        ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  cursorColor: MyColors().black,
                  style: CustomTextStyles().heading2.copyWith(
                        color: MyColors().black,
                      ),
                ),
              ),
            ),
            Icon(
              Icons.mic,
              color: MyColors().black,
              size: SizeConfig().getMyDynamicFontSize(24),
            )
          ],
        ),
      ),
    );
  }
}
