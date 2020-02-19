import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

Future main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}