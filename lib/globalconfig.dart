import 'package:flutter/material.dart';
/*
 *系统主题设置，包括系统默认字体 背景色等
 */
class GlobalConfig {
  static bool isDebug = true;//是否是调试模式
  static bool dark = false;
  static Color fontColor = Colors.black54;
  static String BASE_URL = "http://192.168.0.101:8084/v2/";
  static String HEADER_TOKEN_KEY = "X-MOVIEAPI-Authorization";
}