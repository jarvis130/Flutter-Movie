import 'package:extended_text_field/extended_text_field.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/customwidgets/screen.dart';
import '../../style/styles.dart';
import '../../customwidgets/text_field_item.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(ReviewState state, Dispatch dispatch, ViewService viewService) {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            TextFormField(
              // maxLength: 100,
              // maxLengthEnforced: true,
              maxLines: 10,
              decoration: InputDecoration(
//                labelText: "密码",
                  hintText: "内容",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
//                prefixIcon: Icon(Icons.lock)
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              onSaved: (value) {
                state.content = value;
              },
            ),
          ],
        ),
      )
    );
  }

  return Scaffold(
    //resizeToAvoidBottomPadding: false,
    backgroundColor: Color.fromRGBO(45, 45, 48, 1),
    appBar: new AppBar(
        backgroundColor: Color.fromRGBO(45, 45, 48, 1),
        brightness: Brightness.dark,
        elevation: 0.0,
        title: new Text('评论'),
        leading: new IconButton(
          icon: new Icon(Icons.close),
          onPressed: () => Navigator.of(viewService.context).pop(),
        ),
        actions: [
          Container(
            width: 100,
            height: 10,
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text(
                  '发布',
                  style: TextStyle(
                    fontSize: 12.0
                  )
              ),
              onPressed: () {
                var _form = _formKey.currentState;
                if (_form.validate()) {
                  _form.save();
//                  print(state.content);
                }
                dispatch(ReviewActionCreator.onSetComment(state.videoid));
                Navigator.of(viewService.context).pop();
              },
            ),
          )
        ]
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
              child: _buildBody()
          ),
        ],
      ),
    ),
  );
}
