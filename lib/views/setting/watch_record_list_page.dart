
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/WatchLogModel.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/resources.dart';
import 'package:movie/api/product_api.dart';

class WatchRecordListPage extends StatefulWidget {
  @override
  _WatchRecordListPageState createState() => _WatchRecordListPageState();
}

class _WatchRecordListPageState extends State<WatchRecordListPage> {

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List<Products> _list = new List();

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

//    var position = _scrollController.position;
//    // 小于50px时，触发上拉加载；
//    if (position.maxScrollExtent - position.pixels < 50) {
//      _getMoreData();
//    }

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getMoreData() async {
    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
      isLoading = true;
      //视频信息
      currentPage = currentPage + 1;

      WatchLogModel model = await ProductApi.getWatchLog(page: currentPage, per_page: GlobalConfig.PageSize);
      if (model != null){
        setState(() {
          _list.addAll(model.products);
          total = model.paged.total;
          pages = model.paged.more;
          size = model.paged.size;
          currentPage = model.paged.page;
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
      //视频信息
      currentPage = 1;

      WatchLogModel model = await ProductApi.getWatchLog(page: currentPage, per_page: GlobalConfig.PageSize);
      if (model != null){
        setState(() {
          _list.clear();
          _list.addAll(model.products);
          total = model.paged.total;
          pages = model.paged.more;
          size = model.paged.size;
          currentPage = model.paged.page;
        });
      }
      isLoading = false;
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

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
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
      body: RefreshIndicator(
        color: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount:  _list.length + 1,
          itemBuilder: (_, index){
            if (index == _list.length) {
              return _buildProgressIndicator();
            } else {
              return _buildItem(_list[index], index);
            }
          },
        ),
        onRefresh: _refresh,
      )
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
        onTap: () {
//          NavigatorUtils.push(context, '/moviedetail_page/moviedetailpage?movieid=${model.goods.id}');
           Navigator.of(context).pushNamed('moviedetailpage', arguments: {
            'movieid': model.goods.id.toString(),
            'bgpic': model.goods.defaultPhoto.thumb,
             'posterpic': model.goods.defaultPhoto.thumb,
             'title': model.goods.name
          });
        },
      );

  }

}
