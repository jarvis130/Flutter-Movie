
import 'package:flutter/material.dart';
import 'package:movie/widgets/base_dialog.dart';
import 'package:movie/style/styles.dart';


class ExitDialog extends StatefulWidget{

  ExitDialog({
    Key key,
  }) : super(key : key);

  @override
  _ExitDialog createState() => _ExitDialog();
  
}

class _ExitDialog extends State<ExitDialog>{

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "提示",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text("您确定要退出登录吗？", style: TextStyles.textDark16),
      ),
      onPressed: (){
//        NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}