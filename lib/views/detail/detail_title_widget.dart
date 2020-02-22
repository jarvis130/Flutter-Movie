import 'package:flutter/material.dart';
import 'package:movie/api/comment_api.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/views/detail/look_confirm_button.dart';
import 'package:movie/widgets/dialogratingbar.dart';

class DetailTitleWidget extends StatefulWidget {
  final Product bean;
  final Color shadowColor;

  DetailTitleWidget(this.bean, this.shadowColor, {Key key}) : super(key: key);

  @override
  _DetailTitleWidgetState createState() => new _DetailTitleWidgetState();
}

class _DetailTitleWidgetState extends State<DetailTitleWidget> {

  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var imgW = screenW / 4;
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
            widget.bean.defaultPhoto.thumb,
            width: imgW,
            height: imgH,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: Constant.MARGIN_LEFT),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.bean.name,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 5.0, bottom: 7.0),
//                  child: Text(
//                    '(${bean.year})',
//                    style: TextStyle(fontSize: 15.0, color: Colors.white),
//                  ),
//                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
//                    '$countries/$genres/上映时间：$pubdates/片长：$durations',
                    widget.bean.breadcrumb,
                    style: TextStyle(fontSize: 12.0, color: Colors.white70),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: LookConfirmButton(
                        btnText: widget.bean.isLiked == 1 ? '已收藏' : '收藏',
                        iconAsset: widget.bean.isLiked == 1 ? Icons.favorite : Icons.favorite_border,
                        defaultColor: Colors.white,
                        pressedColor: btnPressedColor,
                        onPressed: _setFavorites,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Expanded(
                      child: LookConfirmButton(
                        btnText: '評分',
                        iconAsset: Icons.star_border,
                        defaultColor: Colors.white,
                        pressedColor: btnPressedColor,
                        onPressed: _rateIt,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _rateIt() {
//    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (ctx) {
          double rate = 0;
          return DialogRatingBar(
            rating: rate,
            submit: (d) async{
              await CommentApi.addRate(
                  comment_type: 1,
                  id_value: widget.bean.id,
                  comment_rank: d,
                  status: 1
              );
            },
          );
        }
    );
  }

  String list2String(List<String> list) {
    var tmp = '';
    for (String item in list) {
      tmp = tmp + item;
    }
    return tmp;
  }

  _setFavorites() async{
    if(widget.bean.isCollect == 1){
      await MovieDetailApi.unLike(widget.bean.id);
      setState(() {
        widget.bean.isCollect = 0;
      });

    }else{
      await MovieDetailApi.setLike(widget.bean.id);
      setState(() {
        widget.bean.isCollect = 1;
      });
    }

  }

}
