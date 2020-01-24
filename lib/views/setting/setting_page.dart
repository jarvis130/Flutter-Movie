
import 'package:flutter/material.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/styles.dart';
import 'package:movie/widgets/click_item.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/globalconfig.dart';
import 'update_dialog.dart';
import 'exit_dialog.dart';
import 'setting_router.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
              fontSize: Adapt.px(GlobalConfig.FONTSIZE_NAVIGATION)
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
            }
          ),
          ClickItem(
            title: "意見反饋",
            onTap: (){
//              NavigatorUtils.push(context, SettingRouter.aboutPage);
            }
          ),
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
}
