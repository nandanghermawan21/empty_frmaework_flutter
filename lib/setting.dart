import 'package:sample_project/resource/color_default.dart';
import 'package:sample_project/resource/font_default.dart';
import 'package:sample_project/resource/string_id_id.dart';
import 'package:sample_project/util/api_end_point.dart';
import 'package:sample_project/util/system.dart';
import 'package:sample_project/util/text_style.dart';
import 'route.dart';

void setting() {
  System.data.versionName = "1.1.55";
  System.data.strings = StringsIdId();
  System.data.color = ColorDefault();
  System.data.font = FontDefault();
  System.data.route = route;
  System.data.textStyles = TextStyles();
  System.data.apiEndPoint = ApiEndPoint();
}
