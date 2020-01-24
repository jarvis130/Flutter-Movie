
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/style/resources.dart';
import 'package:sticky_headers/sticky_headers.dart';

class OrderRecordListPage extends StatefulWidget {
  @override
  _OrderRecordListPageState createState() => _OrderRecordListPageState();
}

class _OrderRecordListPageState extends State<OrderRecordListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '訂單明細',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Adapt.px(GlobalConfig.FONTSIZE_NAVIGATION)
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (_, index){
          return StickyHeader(
            header: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: Color(0xFFFAFAFA),
              padding: const EdgeInsets.only(left: 16.0),
              height: 34.0,
              child: Text("2018/06/0${index + 1}"),
            ),
            content: _buildItem(index),
          );
        },
      ),
    );
  }
  
  Widget _buildItem(int index){
    List<Widget> list = List.generate(index + 1, (i){
      return Container(
        height: 72.0,
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context, color: Colours.line, width: 0.8),
            )
        ),
        child: Stack(
          children: <Widget>[
            Text(i % 2 == 0 ? "季卡" : "月卡", style: TextStyles.textDark14),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Text(i % 2 == 0 ? "10.00" : "30.00", style: TextStyle(
                    color: Colours.text_red,
                    fontWeight: FontWeight.bold
                ))
            ),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Text(i % 2 == 0 ? "18:20:10" : "18:20:11", style: TextStyles.textGray12)
            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Text(
                    "× 1",
                    style: TextStyles.textGray12
                )
            ),
          ],
        ),
      );
    });
    return Column(
      children: list
    );
  }
}
