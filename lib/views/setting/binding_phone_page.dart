import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:movie/api/user_api.dart';
import 'package:movie/store/user_state.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../utils/toast.dart';
import 'package:movie/style/styles.dart';
import 'package:movie/widgets/text_field.dart';
import 'package:movie/widgets/my_button.dart';

/// 自定义的绑定页面组件。
class BindingPhonePage extends StatefulWidget {

  @override
  _BindingPhonePageState createState() => _BindingPhonePageState();
}

/// 与自定义的绑定页面组件关联的状态子类。
class _BindingPhonePageState extends State<BindingPhonePage> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  KeyboardActionsConfig _config;
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _nameController.addListener(_verify);
    _vCodeController.addListener(_verify);
    _passwordController.addListener(_verify);
    _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2, _nodeText3]);
  }

  void _verify(){
    String name = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 11) {
      isClick = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      isClick = false;
    }
    if (password.isEmpty || password.length < 6) {
      isClick = false;
    }
    if (isClick != _isClick){
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _confirm() async{
    Map map = await UserApi.bindingPhone(
      mobile: _nameController.text,
      code: _vCodeController.text,
      password: _passwordController.text
    );
    if(map != null){
      if(map['error_code'] == 'message.member.mobile.bind'){
        ToastUtils.show("绑定失败", context);
      }else if(map['error_code'] == 'message.member.mobile.code.verify_errord'){
        ToastUtils.show("验证码错误", context);
      }else{
        Provider.of<UserState>(context).setUsername(_nameController.text);
        ToastUtils.show("绑定成功", context);
        NavigatorUtils.goBack(context);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
          centerTitle: true,
          title: Text(
            '绑定手机',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimens.font_sp18
            ),
          ),
        ),
        body: defaultTargetPlatform == TargetPlatform.iOS ? FormKeyboardActions(
          child: _buildBody(),
        ) : SingleChildScrollView(
          child: _buildBody(),
        )
    );
  }

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Gaps.vGap16,
          MyTextField(
            focusNode: _nodeText1,
            config: _config,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入手机号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText2,
            controller: _vCodeController,
            keyboardType: TextInputType.number,
            getVCode: (){
              return Future.value(true);
            },
            maxLength: 6,
            hintText: "请输入验证码",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText3,
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _isClick ? _confirm : null,
            text: "确认",
          )
        ],
      ),
    );
  }
}