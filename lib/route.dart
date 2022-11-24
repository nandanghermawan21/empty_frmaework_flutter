import 'package:flutter/material.dart';
import 'package:sample_project/view/counter_view.dart';
import 'package:sample_project/view/home_view.dart';

String initialRouteName = Routename.home;

class Routename {
  static const String counter = "counter";
  static const String home = "home";
}

enum ParamName {
  title,
}

Map<String, WidgetBuilder> route = {
  Routename.counter: (context) {
    Map<dynamic, dynamic> arg =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    return CounterPresenter(
      title: arg[ParamName.title],
    );
  },
  Routename.home: (context) {
    return HomePresenter(
      onTapCounter: () {
        Navigator.of(context)
            .pushReplacementNamed(Routename.counter, arguments: {
          ParamName.title: "My Titile",
        });
      },
    );
  }
};
