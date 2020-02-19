import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/style/styles.dart';
import 'package:movie/widgets/click_item.dart';
import 'update_dialog.dart';
import 'setting_router.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

//  String _message = '';

  @override
  void initState() {
    super.initState();
//    initXUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '設置',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Gaps.vGap5,
          ClickItem(
            title: "賬號管理",
            onTap: (){
              NavigatorUtils.push(context, SettingRouter.accountManagerPage);
            }
          ),
//          ClickItem(
//            title: "清除緩存",
//            content: "23.5MB",
//            onTap: (){}
//          ),
          ClickItem(
            title: "檢查更新",
            onTap: (){
              _showUpdateDialog();
//              FlutterXUpdate.checkUpdate(
//                params: {'versionCode': 0},
//                  url: GlobalConfig.BASE_URL + "ecapi.version.app.check",
//                  overrideGlobalRetryStrategy: true,
//                  enableRetry: true,
//                  retryContent: "请切换到网页下载",
//                  retryUrl: "http://221.229.197.4:8003/#/download"
//              );
            }
          ),
//          ClickItem(
//            title: "意見反饋",
//            onTap: (){
//
//            }
//          ),
//          ClickItem(
//            title: "退出當前賬號",
//            onTap: (){
//              showDialog(
//                context: context,
//                barrierDismissible: false,
//                builder: (_) => ExitDialog()
//              );
//            }
//          ),
        ],
      ),
    );
  }

  void _showUpdateDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return UpdateDialog();
        }
    );
  }

  ///初始化
//  void initXUpdate() {
//    if (Platform.isAndroid) {
//      FlutterXUpdate.init(
//        ///是否输出日志
//          debug: true,
//          ///是否使用post请求
//          isPost: false,
//          ///post请求是否是上传json
//          isPostJson: false,
//          ///是否开启自动模式
//          isWifiOnly: false,
//          ///是否开启自动模式
//          isAutoMode: true,
//          ///需要设置的公共参数
//          supportSilentInstall: false,
//          ///在下载过程中，如果点击了取消的话，是否弹出切换下载方式的重试提示弹窗
//          enableRetry: false
//      ).then((value) {
//        updateMessage("初始化成功: $value");
//      }).catchError((error) {
//        print(error);
//      });
//
//      FlutterXUpdate.setErrorHandler(
//          onUpdateError: (Map<String, dynamic> message) async {
//            print(message);
//            setState(() {
//              _message = "$message";
//            });
//          });
//    } else {
//      updateMessage("ios暂不支持XUpdate更新");
//    }
//  }

//  void updateMessage(String message) {
//    setState(() {
//      _message = message;
//    });
//  }

}
