import 'package:flutter/material.dart';
import 'package:movie/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '頁面不存在',
        ),
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: "頁面不存在",
      ),
    );
  }
}
