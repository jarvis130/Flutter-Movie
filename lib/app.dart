import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart' hide Action;

import 'package:fish_redux/fish_redux.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/user_api.dart';
import 'package:movie/utils/SharedPreferencesUtil.dart';
import 'package:movie/views/discover_page/page.dart';
import 'package:movie/views/douyin_page/page.dart';
import 'package:movie/views/favorites_page/page.dart';
import 'package:movie/views/gallery_page/page.dart';
import 'package:movie/views/guide_page/page.dart';
import 'package:movie/views/listdetail_page/page.dart';
import 'package:movie/views/login_page/page.dart';
import 'package:movie/views/main_page/page.dart';
import 'package:movie/views/moviedetail_page/page.dart';
import 'package:movie/views/my_page/page.dart';
import 'package:movie/views/mylists_page/page.dart';
import 'package:movie/views/pay_page/page.dart';
import 'package:movie/views/review_page/page.dart';
import 'package:movie/views/search_page/page.dart';
import 'package:movie/views/splash_page/page.dart';
import 'package:movie/views/classify_page/page.dart';
import 'package:movie/views/user_page/page.dart';
import 'package:movie/views/webview_page/page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'actions/timeline.dart';
import 'generated/i18n.dart';
import 'globalbasestate/state.dart';
import 'globalbasestate/store.dart';
import 'views/moremedia_page/page.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:movie/views/detail_page/page.dart' as detail;
import 'package:device_info/device_info.dart';

//启动标识
String startFlag = '0';

Future _init() async {

  if (Platform.isAndroid)
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);

  String os = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SharedPreferencesUtil.initPrefsInstance(prefs);
  String token = SharedPreferencesUtil.prefsInstance.getString('token');
  if (token == null) {
    //获取设备信息
    String uuid;
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if(Platform.isIOS){
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      uuid = iosDeviceInfo.identifierForVendor;
      os = '2';
    }else if(Platform.isAndroid){
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      uuid = androidDeviceInfo.id;
      os = '1';
    }
    prefs.setString('client', os);
    // 设备码登录
    UserApi.loginByMobileDevice(uuid, os);
  }

//  if (accessToken != null) ApiHelper.accessTokenV4 = accessToken;

  startFlag = prefs.getString('tip') == null ? '0' : '1';
  if(startFlag == '0'){
    prefs.setString('tip', '1');
  }

  setLocaleInfo('zh', TimelineInfoCN());
  setLocaleInfo('en', TimelineInfoEN());
  setLocaleInfo('Ja', TimelineInfoJA());
}

Future<Widget> createApp() async {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'mainpage': MainPage(),
      'loginpage': LoginPage(),
      'moviedetailpage': MovieDetailPage(),
      'searchpage': SearchPage(),
      'MoreMediaPage': MoreMediaPage(),
      'MyListsPage': MyListsPage(),
      'ListDetailPage': ListDetailPage(),
      'FavoritesPage': FavoritesPage(),
      'detailpage': detail.MovieDetailPage(),
      'classifypage': ClassifyPage(),
      'GalleryPage': GalleryPage(),
      'DiscoverPage': DiscoverPage(),
      'GuidePage': GuidePage(),
      'SplashPage': SplashPage(),
      'UserPage': UserPage(),
      'WebPage': WebPage(),
      'reviewPage': ReviewPage(),
      'PayPage': PayPage(),
      'MyPage': MyPage(),
      'Douyin': DouyinPage()
    },
    visitor: (String path, Page<Object, dynamic> page) {
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(
          GlobalStore.store,
          (Object pagestate, GlobalState appState) {
            final GlobalBaseState p = pagestate;
            if (p.themeColor != appState.themeColor) {
              if (pagestate is Cloneable) {
                final Object copy = pagestate.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pagestate;
          },
        );
      }
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: [
//          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );

  await _init();

  return MaterialApp(
    title: 'Movie',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    localizationsDelegates: [
      I18n.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: I18n.delegate.supportedLocales,
    localeResolutionCallback:
        I18n.delegate.resolution(fallback: new Locale("zh", "CN")),
    home: startFlag == '1' ? routes.buildPage('SplashPage', null) : routes.buildPage('GuidePage', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
