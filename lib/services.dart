import 'package:sample_project/util/network.dart';
import 'package:sample_project/util/system.dart';

class DownloadSpeedTestService {
  String status = "IDLE";
  void startService() {
    if (status == "IDLE") {
      status = "RUNNING";
      process();
    }
  }

  void process() {
    testDownload().then((time) {
      //
      System.data.global.downloadSpeed = ((100 / time) * 1000).ceil();
      System.data.global.downloadSpeedStream
          .add(System.data.global.downloadSpeed);
      Future.delayed(const Duration(seconds: 5)).then((value) {
        process();
      });
    }).catchError(
      (onError) {
        System.data.global.downloadSpeed = 0;
        System.data.global.downloadSpeedStream
            .add(System.data.global.downloadSpeed);
        Future.delayed(const Duration(seconds: 5)).then((value) {
          process();
        });
      },
    );
  }

  Future<int> testDownload() {
    int speed = 0;
    DateTime startDate = DateTime.now(); //a

    return Network.get(
      url: Uri.parse(
          System.data.apiEndPoint!.url + System.data.apiEndPoint!.downloadTest),
      printResolt: false,
      rawResult: true,
    ).then((value) {
      speed = startDate.difference(DateTime.now()).inMilliseconds * -1;
      return speed;
    }).catchError((onError) {
      throw onError;
    });
  }
}
