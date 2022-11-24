import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_project/setting.dart';
import 'package:sample_project/util/data.dart';
import 'package:sample_project/util/system.dart';
import 'route.dart';

Data data = Data();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setting();
  data.initialize().then((val) async {
    // initializeService().then((value) {
    runApp(const MyApp());
    // });
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WillPopScope(
          onWillPop: () {
            return Future.value().then((value) {
              if (ModalRoute.of(System.data.navigatorKey.currentContext!)
                      ?.canPop ==
                  true) {
                return true;
              } else {
                ScaffoldMessenger.of(System.data.navigatorKey.currentContext!)
                    .showSnackBar(
                  SnackBar(
                    content: Container(
                      padding: const EdgeInsets.all(10),
                      color: System.data.color!.infoColor,
                      child: Text(
                        System.data.strings!.areYouSureToExit,
                        style: System.data.textStyles!.basicLabel
                            .copyWith(color: System.data.color!.lightTextColor),
                      ),
                    ),
                  ),
                );
                return false;
              }
            });
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Sample Project",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: data.route ?? <String, WidgetBuilder>{},
            initialRoute: initialRouteName,
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
