
import 'package:flutter/material.dart';
import 'package:movie/style/resources.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:movie/api/order_api.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/OrderListModel.dart';
import 'package:common_utils/common_utils.dart';

class OrderRecordListPage extends StatefulWidget {
  @override
  _OrderRecordListPageState createState() => _OrderRecordListPageState();
}

class _OrderRecordListPageState extends State<OrderRecordListPage> {

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List<Orders> _list = new List();

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

      OrderListModel model = await OrderApi.orderList(page: currentPage, per_page: GlobalConfig.PageSize);
      if (model != null){
        setState(() {
          _list.addAll(model.orders);
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

      OrderListModel model = await OrderApi.orderList(page: currentPage, per_page: GlobalConfig.PageSize);
      if (model != null){
        setState(() {
          _list.clear();
          _list.addAll(model.orders);
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
          '我的訂單',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        onRefresh: _refresh,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount:  _list.length + 1,
          itemBuilder: (_, index){
            if (index == _list.length) {
              return _buildProgressIndicator();
            } else {
              Orders order = _list[index];

              return StickyHeader(
                header: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  color: Color(0xFFFAFAFA),
                  padding: const EdgeInsets.only(left: 16.0),
                  height: 34.0,
                  child: Text('订单编号: '+order.sn),
                ),
                content: _buildItem(order, index),
              );
            }

          },
        ),
      )
    );
  }

  Widget _buildItem(Orders order, int index){

    Goods goods = order.goods[0];
    Product product = goods.product;
    String createTime = order.createdAt.toString() + '000';
    DateTime createDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createTime));
    createTime = DateUtil.formatDate(createDateTime);

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
            Text(
                product.name,
                style: TextStyles.textDark14
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Text(product.price, style: TextStyle(
                    color: Colours.text_red,
                    fontWeight: FontWeight.bold
                ))
            ),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Text(createTime, style: TextStyles.textGray12)
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

//    return Column(
//        children: list
//    );
  }
}
