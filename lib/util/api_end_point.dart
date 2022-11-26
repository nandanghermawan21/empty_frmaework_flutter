import 'package:sample_project/util/mode_util.dart';

class ApiEndPoint {
  String baseUrl = "https://sfimos.sfi.co.id/survey/api/";
  String baseUrlDebug = "https://sfimos.sfi.co.id/survey/api/";

  //speedTest
  String downloadTest = "assets/100_kb_file.jpg";

  String get url {
    if (ModeUtil.debugMode == true) {
      return baseUrlDebug;
    } else {
      return baseUrl;
    }
  }
}
