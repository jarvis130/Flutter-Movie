import 'package:flutter/material.dart';
/*
 *系统主题设置，包括系统默认字体 背景色等
 */
class GlobalConfig {
  //是否是调试模式
  static bool isDebug = true;
  static bool dark = false;
  static Color fontColor = Colors.black54;
//  static String BASE_URL = "http://localhost:8084/v2/";//172.31.21.53
  static String BASE_URL = "http://221.229.197.4:8002/v2/";
  //请求头参数
  static String HEADER_TOKEN_KEY = "X-API-Authorization";
  //分页参数
  static int PageSize = 10;
  //字体大小
  static int FONTSIZE_NAVIGATION = 36;//导航
  static int FONTSIZE_MAINBODY = 28;//正文
  static int FONTSIZE_TITLE = 34;//标题
  static int FONTSIZE_SUBTITLE = 24;//副标题
}