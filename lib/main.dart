import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:takos/src/dashboard.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // if (true) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // name: "takos-7179e",
  );
  runApp(const MyApp());
}
