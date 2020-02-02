
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie/api/kefusettings_api.dart';
import 'package:movie/models/KefuSettingsModel.dart';
import 'package:movie/style/resources.dart';
import 'package:movie/utils/image_utils.dart';
import 'package:movie/widgets/click_item.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/globalconfig.dart';

class KefuSettingsPage extends StatefulWidget {
  @override
  _KefuSettingsPageState createState() => _KefuSettingsPageState();
}

class _KefuSettingsPageState extends State<KefuSettingsPage> {

  bool isLoading = false;

  List<KefuSettings> _list = new List();

  @override
  void initState() {

    this._getMoreData();

    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getMoreData() async {
    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
      isLoading = true;

      KefuSettingsModel model = await KefuSettingsApi.getList();
      if (model != null){
        setState(() {
          _list.addAll(model.kefuSettings);
        });
      }
      isLoading = false;

    }
  }

  Future<void> _refresh() async {

    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
      isLoading = true;
      KefuSettingsModel model = await KefuSettingsApi.getList();
      if (model != null){
        setState(() {
          _list.clear();
          _list.addAll(model.kefuSettings);
        });
      }
      isLoading = false;
    }
  }
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '聯繫客服',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        child: ListView(
          children: ListTile.divideTiles(
              context: context,
              tiles: <Widget>[
                _buildItem()
              ]
          ).toList(),
        ),
        onRefresh: _refresh,
      )
    );
  }

  Widget _buildItem(){

    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in _list) {
      tiles.add(
          ListTile(
//      leading: Container(
//          child: loadAssetImage(imgName, width: 16.0, height: 16.0),
//          width: 60,
//          height: 60,
//          color: Colors.grey),
            title: Text(
                item.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.font_sp16
                )
            ),
//      subtitle: Text(
//          model.breadcrumb,
//          style: TextStyle(
//              fontSize: Dimens.font_sp14
//          )
//      ),
            trailing: Text(
                item.content,
                style: TextStyle(
                    fontSize: Dimens.font_sp14
                )
            ),
            onTap: () {

            },
          )
      );
    }

    content = new Column(
       children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );

    return content;

  }
}
