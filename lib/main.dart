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
        ],
      ),
    );
  }
}
