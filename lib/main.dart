import 'dart:io';

import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
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

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    System.data.global.testService.startService();
    WidgetsBinding.instance.addObserver(this);
  }

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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("app state resumed");
        break;
      case AppLifecycleState.inactive:
        debugPrint("app state inactive");
        break;
      case AppLifecycleState.paused:
        debugPrint("app state paused");
        if (data.sendToBackGround == false) {
          data.sendToBackGround = true;
        } else {
          MoveToBackground.moveTaskToBack();
        }
        break;
      case AppLifecycleState.detached:
        debugPrint("app state detached");
        MoveToBackground.moveTaskToBack();
        break;
    }
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
