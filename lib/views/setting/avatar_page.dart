
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/widgets/selected_image.dart';
import 'package:movie/widgets/text_field_item.dart';
import 'package:movie/globalconfig.dart';
import '../../utils/toast.dart';

class AvatarPage extends StatefulWidget {
  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {

  File _imageFile;
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  KeyboardActionsConfig _config;
  String _address = "陕西省 西安市 雁塔区 高新六路201号";
  
  void _getImage() async{
    try {
      _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 95);
      setState(() {});
    } catch (e) {
      Toast.show("没有权限，无法打开相册！");
    }
  }

  KeyboardActionsConfig _buildConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText1,
          displayCloseWidget: false,
        ),
        KeyboardAction(
          focusNode: _nodeText2,
          displayCloseWidget: false,
        ),
        KeyboardAction(
          focusNode: _nodeText3,
          closeWidget: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("关闭"),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    _config = _buildConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '用戶頭像',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Adapt.px(GlobalConfig.FONTSIZE_NAVIGATION)
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: defaultTargetPlatform == TargetPlatform.iOS ? FormKeyboardActions(
                child: _buildBody()
              ) : SingleChildScrollView(
                child: _buildBody()
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Color.fromRGBO(50, 50, 50, 1),
                disabledTextColor: Color(0xFFD4E2FA),
                disabledColor: Color(0xFF96BBFA),
                onPressed: (){
//                  NavigatorUtils.push(context, StoreRouter.auditResultPage);
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                          '提交',
                          style: TextStyle(
                            fontSize: Adapt.px(GlobalConfig.FONTSIZE_MAINBODY),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: Adapt.px(5),
          ),
          SizedBox(
            height: Adapt.px(16),
          ),
          Center(
            child: SelectedImage(
              image: _imageFile,
              size: 180,
              onTap: _getImage
            ),
          ),
          SizedBox(
            height: Adapt.px(10),
          ),
          const Center(
            child: const Text(
              "點擊選擇圖片",
              style: TextStyle(
                fontSize: 14,
              )
            ),
          ),
//          SizedBox(
//            height: Adapt.px(16),
//          ),
//          TextFieldItem(
//              focusNode: _nodeText1,
//              title: "店铺名称",
//              hintText: "填写店铺名称"
//          ),
//          SizedBox(
//            height: Adapt.px(16),
//          ),
//          TextFieldItem(
//              focusNode: _nodeText2,
//              title: "用户名",
//              hintText: "填写用户名称"
//          ),
//          TextFieldItem(
//              focusNode: _nodeText3,
////              config: _config,
//              keyboardType: TextInputType.phone,
//              title: "联系电话",
//              hintText: "填写店主联系电话"
//          )
        ],
      ),
    );
  }

  String _sortName = "";
  var _list = ["水果生鲜", "家用电器", "休闲食品", "茶酒饮料", "美妆个护", "粮油调味", "家庭清洁", "厨具用品", "儿童玩具", "床上用品"];

  _showBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 360.0,
          child: ListView.builder(
            itemExtent: 48.0,
            itemBuilder: (_, index){
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(_list[index]),
                ),
                onTap: (){
//                  setState(() {
//                    _sortName = _list[index];
//                  });
//                  NavigatorUtils.goBack(context);
                },
              );
            },
            itemCount: _list.length,
          ),
        );
      },
    );
  }
}
