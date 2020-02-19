
import 'package:flutter/material.dart';
import 'package:movie/store/user_state.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/image_utils.dart';
import 'package:movie/views/setting/setting_router.dart';
import 'package:movie/widgets/click_item.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/globalconfig.dart';
import 'package:provider/provider.dart';

class AccountManagerPage extends StatefulWidget {
  @override
  _AccountManagerPageState createState() => _AccountManagerPageState();
}

class _AccountManagerPageState extends State<AccountManagerPage> {
  
  @override
  Widget build(BuildContext context) {
    
    String avatar = Provider.of<UserState>(context).avatar != null ? Provider.of<UserState>(context).avatar : '0';
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '賬號管理',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClickItem(
                title: "頭像logo",
                onTap: (){
                  NavigatorUtils.push(context, SettingRouter.avatarPage);
                }
              ),
              Positioned(
                top: 8.0,
                bottom: 8.0,
                right: 40.0,
                child: Provider.of<UserState>(context).avatar == null ? loadAssetImage("shop/tx", width: 34.0) : loadNetworkImage(Provider.of<UserState>(context).avatar, width: 34.0, height: 34.0),
              )
            ],
          ),
//          ClickItem(
//              title: "修改密碼",
//              content: "用於密碼登錄",
//              onTap: (){
//                NavigatorUtils.push(context, LoginRouter.updatePasswordPage);
//              }
//          ),
//          ClickItem(
//              title: "綁定賬號",
//              content: "15000000000",
//          ),
        ],
      ),
    );
  }
}
