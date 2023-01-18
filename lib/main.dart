import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';
import 'package:takos/global/text_styles/customTextStyles.dart';
import 'package:takos/global/widgets/custom_margins.dart';
import 'package:takos/global/widgets/custom_search_bar.dart';

import 'firebase_options.dart';
import 'global/colors/my_colors.dart';
import 'global/widgets/CustomAppBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAKOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context, 800, 360);
    return Scaffold(
      backgroundColor: MyColors().screenBg,
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          customAppBar(
            title: 'Home Screen',
            contents: [
              Icon(
                Icons.person,
                color: Colors.black,
                size: SizeConfig().getMyDynamicFontSize(28),
              ),
              const CustomSearchBar(),
              Icon(
                Icons.refresh,
                color: Colors.black,
                size: SizeConfig().getMyDynamicFontSize(28),
              ),
            ],
          ),
          bodyWidget(),
        ],
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      // color: Colors,
      child: Column(
        children: [
          mainBoardHeadingWidget(),
          listOfBundleTasks(),
          createNewTaskBunddleButton(),
        ],
      ),
    );
  }

  Widget mainBoardHeadingWidget() {
    return Container(
      margin: cmargin(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyColors().grey.withOpacity(.12),
            blurRadius: 9,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: cmargin(
        vertical: 21,
        horizontal: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Main Board',
            style: CustomTextStyles().heading1.copyWith(
                  color: MyColors().grey,
                ),
          ),
          Icon(
            Icons.local_fire_department_sharp,
            color: MyColors().grey,
            size: SizeConfig().getMyDynamicFontSize(20),
          )
        ],
      ),
    );
  }

  Widget listOfBundleTasks() {
    return Container(
      margin: cmargin(
        vertical: 8,
        horizontal: 24,
      ),
      child: Column(
        children: List.generate(
          2,
          (index) => taskBunddleWidget(
            showBottomMargin: index != 1,
          ),
        ),
      ),
    );
  }

  Widget taskBunddleWidget({
    bool showBottomMargin = true,
  }) {
    return Container(
      padding: cmargin(
        vertical: 12,
        horizontal: 14,
      ),
      margin: cmargin(
        bottom: showBottomMargin ? 24 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors().white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Task',
                style: CustomTextStyles().heading2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.local_fire_department_sharp,
                color: MyColors().grey,
                size: SizeConfig().getMyDynamicFontSize(20),
              )
            ],
          ),
          Container(
            margin: cmargin(
              top: 21,
              bottom: 8,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: MyColors().blue,
                  size: SizeConfig().getMyDynamicFontSize(18),
                ),
                Container(
                  margin: cmargin(
                    horizontal: 3,
                  ),
                ),
                Text(
                  'Add a Task',
                  style: CustomTextStyles().body,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createNewTaskBunddleButton() {
    return Container(
      margin: cmargin(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: MyColors().white.withOpacity(.5),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: cmargin(
        vertical: 18,
        horizontal: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+ Add new list',
            style: CustomTextStyles().smallText.copyWith(),
          ),
        ],
      ),
    );
  }
}
