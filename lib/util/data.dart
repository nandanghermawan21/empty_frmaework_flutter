import 'package:flutter/material.dart';
import 'package:sample_project/util/api_end_point.dart';
import 'package:sample_project/util/colour.dart';
import 'package:sample_project/util/font.dart';
import 'package:sample_project/util/global.dart';
import 'package:sample_project/util/strings.dart';
import 'package:sample_project/util/text_style.dart';

class Data extends ChangeNotifier {
  String versionName = "";
  int versionCode = 0;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool sendToBackGround = true;
  ApiEndPoint? apiEndPoint;

  Map<String, WidgetBuilder>? route;
  bool resizeToAvoidBottomInset = false;

  VoidCallback? onUnAuthorized;
  BuildContext get context => navigatorKey.currentContext!;
  Global global = Global();

  ValueChanged<Uri?>? deepLinkingHandler;
  Strings? strings;
  Colour? color;
  Font? font;
  TextStyles? textStyles;

  ValueChanged<Map<String, dynamic>?>? onServiceDataReceived;
  Map<String, String> directories = {};

  Data();

  Future<void> initialize() async {}

  void commit() {
    notifyListeners();
  }
}
