
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/WatchLogModel.dart';
import 'package:movie/style/resources.dart';
import 'package:movie/api/product_api.dart';

class WatchRecordListPage extends StatefulWidget {
  @override
  _WatchRecordListPageState createState() => _WatchRecordListPageState();
}

class _WatchRecordListPageState extends State<WatchRecordListPage> {

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List<Products> list = new List();

  int currentPage;
  int total;
  int size;
  int pages;

  @override
  void initState() {
    currentPage = 0;
    total = 0;
    size = 0;
    pages = 0;
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      //视频信息
      currentPage = currentPage + 1;

      WatchLogModel model = await ProductApi.getWatchLog(page: currentPage, per_page: GlobalConfig.PageSize);
      if (model != null){
        setState(() {
          list = model.products;
          total = model.paged.total;
          pages = model.paged.more;
          size = model.paged.size;
          currentPage = model.paged.page;
          isLoading = false;
        });
      }


    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '觀看記錄',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: list.length + 1,
        itemBuilder: (_, index){
          if (index == list.length) {
            return _buildProgressIndicator();
          } else {
            return _buildItem(list[index], index);
          }
        },
      ),
    );
  }

  Widget _buildItem(Products model, int index){

      return ListTile(
        leading: Container(
            child: Image.network(model.goods.defaultPhoto.thumb, fit: BoxFit.cover),
            width: 60,
            height: 60,
            color: Colors.grey),
        title: Text(
            model.goods.name,
            style: TextStyle(
                fontSize: Dimens.font_sp16
            )
        ),
        subtitle: Text(
            model.breadcrumb,
            style: TextStyle(
                fontSize: Dimens.font_sp14
            )
        ),
        trailing: Text(
            model.addTime,
            style: TextStyle(
                fontSize: Dimens.font_sp14
            )
        ),
      );

  }

}
