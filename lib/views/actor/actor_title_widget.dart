import 'package:flutter/material.dart';
import 'package:movie/api/actor_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/models/ActorModel.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/views/actor/look_confirm_button.dart';

class ActorTitleWidget extends StatefulWidget {
  final Actor bean;
  final Color shadowColor;

  ActorTitleWidget(this.bean, this.shadowColor, {Key key}) : super(key: key);

  @override
  _ActorTitleWidgetState createState() => new _ActorTitleWidgetState();
}

class _ActorTitleWidgetState extends State<ActorTitleWidget> {

  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var imgW = screenW / 6;
    var imgH = imgW * 421 / 297;
//    var countries = list2String(bean.countries);
//    var genres = list2String(bean.genres);
//    var pubdates = list2String(bean.pubdates);
//    var durations = list2String(bean.durations);
    //将按下的颜色设置较为浅色
    var btnPressedColor =
        Color.fromARGB(100, widget.shadowColor.red, widget.shadowColor.red, widget.shadowColor.red);
    return Row(
      children: <Widget>[
        Card(
          //影音海报
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          color: widget.shadowColor,
          clipBehavior: Clip.antiAlias,
          elevation: 10.0,
          child: Image.network(
            widget.bean.actorAvatar,
            width: imgW,
            height: imgH,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: Constant.MARGIN_LEFT, top: Adapt.px(50), right: Constant.MARGIN_RIGHT),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: screenW / 2,
                      child: Text(
                        widget.bean.actorName,
                        style: TextStyle(
                            fontSize: Dimens.font_sp14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Expanded(
                      child: LookConfirmButton(
                        btnText: widget.bean.isAttention == 1 ? '已關注' : '關注',
                        iconAsset: widget.bean.isAttention == 1 ? Icons.favorite : Icons.favorite_border,
                        defaultColor: Colors.white,
                        pressedColor: btnPressedColor,
                        onPressed: _attention,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: Text(
                    widget.bean.country,
                    style: TextStyle(fontSize: Dimens.font_sp10, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.0, right: 5.0),
                  child: Text(
                    widget.bean.actorDesc,
                    maxLines: 3,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: Dimens.font_sp10,
                        color: Colors.white70
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  void _attention() async{
    if(widget.bean.isAttention == 1){
      await ActorApi.setUnAttention(widget.bean.actorId);
      setState(() {
        widget.bean.isAttention = 0;
      });

    }else{
      await ActorApi.setAttention(widget.bean.actorId);
      setState(() {
        widget.bean.isAttention = 1;
      });
    }
  }

  String list2String(List<String> list) {
    var tmp = '';
    for (String item in list) {
      tmp = tmp + item;
    }
    return tmp;
  }

}
