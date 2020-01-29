
import 'package:flutter/material.dart';
import 'package:movie/style/colors.dart';
import 'package:movie/style/dimens.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    Key key,
    this.text: "",
    @required this.onPressed,
  }): super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Color.fromRGBO(50, 50, 50, 1),
      disabledTextColor: Colours.text_dark,
      disabledColor: Colours.text_gray,
      //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: Dimens.font_sp18
              ),
            ),
          ),
        ],
      ),
    );
  }
}
