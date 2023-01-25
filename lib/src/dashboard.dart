import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

import '../global/colors/my_colors.dart';
import '../global/text_styles/customTextStyles.dart';
import '../global/widgets/CustomAppBar.dart';
import '../global/widgets/custom_margins.dart';
import '../global/widgets/custom_search_bar.dart';
import 'middlewares/getListTasks.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasksList();
  }

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
                size: SizeConfig().getMyDynamicWidth(
                  28,
                  maxlimit: 28,
                ),
              ),
              const CustomSearchBar(),
              GestureDetector(
                onTap: () {
                  getTasksList();
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                  size: SizeConfig().getMyDynamicWidth(
                    28,
                    maxlimit: 28,
                  ),
                ),
              ),
            ],
          ),
          bodyWidget(),
        ],
      ),
    );
  }

  Widget bodyWidget() {
    return Column(
      children: [
        mainBoardHeadingWidget(),
        listOfBundleTasks(),
        createNewTaskBunddleButton(),
      ],
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
            size: SizeConfig().getMyDynamicWidth(
              20,
              maxlimit: 20,
            ),
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
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("main_board").snapshots(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData) {
            return Text(
              'loading...',
              style: CustomTextStyles().heading1.copyWith(
                    color: Colors.red,
                  ),
            );
          }
          // print(snapshot.requireData)
          return Column(
            children: List.generate(
              // snapshot.,
              1,
              (index) => taskBunddleWidget(
                showBottomMargin: index != 1,
              ),
            ),
          );
          /* ListView.builder(
            // itemCount: snapshot.data,
            itemCount: 1,
            itemBuilder: (context, index) => taskBunddleWidget(
              showBottomMargin: index != 1,
            ),
          ); */
        },
      ),
      /* Column(
        children: List.generate(
          2,
          (index) => taskBunddleWidget(
            showBottomMargin: index != 1,
          ),
        ),
      ), */
    );
  }

  /// Single widget for the tasks sections
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
                size: SizeConfig().getMyDynamicWidth(
                  20,
                  maxlimit: 20,
                ),
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
                  size: SizeConfig().getMyDynamicWidth(
                    18,
                    maxlimit: 18,
                  ),
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

  /// Create new lsit of tasks
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
