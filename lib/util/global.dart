import 'dart:async';
import 'package:sample_project/services.dart';

class Global {
  String? token = "";
  String? messagingToken;
  Uri? currentDeepLinkUri;
  DownloadSpeedTestService testService = DownloadSpeedTestService();
  int downloadSpeed = 0;
  StreamController<int> downloadSpeedStream = StreamController<int>.broadcast();
}
