import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/actions/imageurl.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/widgets/share_card.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/enums/imagesize.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MenuState state, Dispatch dispatch, ViewService viewService) {

  ProductModel model = state.model;

  Widget _buildListTitel(IconData icon, String title, void onTap(),
      {Color iconColor = const Color.fromRGBO(50, 50, 50, 1)}) {

    TextStyle titleStyle =
        TextStyle(color: Color.fromRGBO(50, 50, 50, 1), fontSize: Dimens.font_sp18);

    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(title, style: titleStyle),
      onTap: onTap,
    );
  }

  void _addToList() {
//    Navigator.of(viewService.context).pop();
//    showDialog(
//        context: viewService.context,
//        builder: (ctx) {
//          var width = (Adapt.screenW() - Adapt.px(60)).floorToDouble();
//          return MediaListCardDialog(
//            type: MediaType.movie,
//            mediaId: state.id,
//          );
//        });
  }

  void _rateIt() {
//    Navigator.of(viewService.context).pop();
//    showDialog(
//        context: viewService.context,
//        builder: (ctx) {
//          double rate = state.accountState.rated?.value ?? 0;
//          return DialogRatingBar(
//            rating: rate,
//            submit: (d) => dispatch(MenuActionCreator.setRating(d)),
//          );
//        });
  }

  void _share() {
    Navigator.of(viewService.context).pop();
    showDialog(
        context: viewService.context,
        builder: (ctx) {
          var width = (Adapt.screenW() - Adapt.px(60)).floorToDouble();
          var height = ((width - Adapt.px(40)) / 2).floorToDouble();
          return ShareCard(
            backgroundImage: ImageUrl.getUrl(model.product.defaultPhoto.thumb, ImageSize.w300),
            qrValue:
                'https://www.themoviedb.org/movie/${model.product.id}?language=${ui.window.locale.languageCode}',
            headerHeight: height,
            header: Column(children: <Widget>[
              SizedBox(
                height: Adapt.px(20),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  Container(
                    width: Adapt.px(120),
                    height: Adapt.px(120),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white, width: Adapt.px(5)),
                        borderRadius: BorderRadius.circular(Adapt.px(60)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                model.product.defaultPhoto.thumb
                            )
                        )
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  Container(
                    width: width - Adapt.px(310),
                    child: Text(model.product.name,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.font_sp14,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(Adapt.px(1), Adapt.px(1)))
                            ])),
                  ),
                ],
              ),
              SizedBox(
                height: Adapt.px(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
                width: width - Adapt.px(40),
                height: height - Adapt.px(170),
                child: Text(model.product.goodsDesc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.font_sp14,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(Adapt.px(1), Adapt.px(1)),
                              blurRadius: 3)
                        ])),
              )
            ]),
          );
        });
  }

  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(Adapt.px(50))),
    //padding: EdgeInsets.only(top:Adapt.px(30)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(Adapt.px(20)),
          height: Adapt.px(100),
          child: Row(
            children: <Widget>[
              Container(
                height: Adapt.px(100),
                width: Adapt.px(100),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(Adapt.px(50)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            ImageUrl.getUrl(model.product.defaultPhoto.thumb, ImageSize.w300)))),
              ),
              SizedBox(
                width: Adapt.px(30),
              ),
              SizedBox(
                  width: Adapt.screenW() - Adapt.px(170),
                  child: Text(
                    model.product.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimens.font_sp18,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
//        _buildListTitel(Icons.format_list_bulleted, '加入播放清单', _addToList),
//        Divider(
//          height: Adapt.px(10),
//        ),
        _buildListTitel(
            model.product.isCollect == 1
                ? Icons.favorite
                : Icons.favorite_border,
            '收藏', () {
          Navigator.of(viewService.context).pop();
          dispatch(MenuActionCreator.setFavorite(model.product.isCollect));
        },
        iconColor: model.product.isCollect == 1
            ? Colors.pink[400]
            : Color.fromRGBO(50, 50, 50, 1)),
       Divider(
         height: Adapt.px(10),
       ),
       _buildListTitel(
         model.product.isAttention == 1
             ? Icons.flag
             : Icons.outlined_flag,
         '关注',
         () {
           Navigator.of(viewService.context).pop();
           dispatch(
               MenuActionCreator.setAttention(model.product.pubId));
         },
         iconColor: model.product.isAttention == 1 ? Colors.pink[400] : Color.fromRGBO(50, 50, 50, 1),
       ),
        // Divider(
        //   height: Adapt.px(10),
        // ),
        // _buildListTitel(
        //     state.accountState.isRated == true ? Icons.star : Icons.star_border,
        //     '评分',
        //     _rateIt,
        //     iconColor: state.accountState.isRated == true
        //         ? Colors.amber
        //         : Color.fromRGBO(50, 50, 50, 1)),
        Divider(
          height: Adapt.px(10),
        ),
        _buildListTitel(Icons.share, '分享', _share),
        Divider(
          height: Adapt.px(10),
        ),
      ],
    ),
  );
}
