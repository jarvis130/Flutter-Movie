
import 'dart:io';

import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {

  const SelectedImage({
    Key key,
    this.size : 80.0,
    this.onTap,
    this.image
  }): super(key: key);

  final double size;
  final GestureTapCallback onTap;
  final File image;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // 图片圆角展示
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: image == null ? AssetImage('images/empty.png') : FileImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
