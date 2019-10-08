import 'package:fish_redux/fish_redux.dart';

class GuideState implements Cloneable<GuideState> {

  List<String> guideList = [
    'images/guide1.png',
    'images/guide2.png',
    'images/guide3.png',
    'images/guide4.png',
  ];
  List<String> guideInfoList = [
    "陪你每一个夜晚",
    "同你去往每个地方",
    "懂你，更懂你所爱",
    "因为在意，所以用心",
  ];

  @override
  GuideState clone() {
    return GuideState()
    ..guideList = guideList
    ..guideInfoList = guideInfoList;
  }
}

GuideState initState(Map<String, dynamic> args) {
  return GuideState();
}
