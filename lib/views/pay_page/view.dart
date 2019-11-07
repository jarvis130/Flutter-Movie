import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/topupmodel.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PayState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildListCell(TopupGoodsListResult d){
    return RadioListTile(
      title: Text(d.name),
      value: d.id,
      onChanged: (v){
        dispatch(PayActionCreator.onSetGoodsValue(v));
      },
      groupValue: state.goodsVal,
//            subtitle: Text('二级标题'),
      secondary: Text('￥' + d.amount),
    );
  }

  Widget _buildPaymentListCell(PaymentMethodListResult d){
    return RadioListTile(
      title: Text(d.name),
      value: d.id,
      onChanged: (v){
        dispatch(PayActionCreator.onSetPaymentValue(v));
      },
      groupValue: state.paymentVal,
//            subtitle: Text('二级标题'),
//      secondary: Text('￥' + d.amount),
    );
  }

  Widget _topupLayout(){
    return state.topupGoodsListModel != null ? Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Column(
            children: state.topupGoodsListModel.results.map(_buildListCell).toList(),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              child: Text("提交"),
              onPressed: () {
                dispatch(PayActionCreator.onSubmit());
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    ) : Container();
  }

  Widget _paymentLayout(){
    return state.paymentMethodListModel != null ? Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Column(
            children: state.paymentMethodListModel.results.map(_buildPaymentListCell).toList(),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              child: Text("确认付款"),
              onPressed: () {
                dispatch(PayActionCreator.onSumitTopup());
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    ) : Container();
  }

  return Scaffold(

    appBar:AppBar(
      title: Text('充值'),
      backgroundColor: Color.fromRGBO(50, 50, 50, 1),
    ),
    body: state.step != 1 ?  _paymentLayout() : _topupLayout()
  );
}
