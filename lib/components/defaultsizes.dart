import 'package:fluent_ui/fluent_ui.dart';

bool lightMode = false;

mediaSize(BuildContext context) => MediaQuery.of(context).size;
double defaultPadding = 16.0;


class TextFormat {
  static mainTextStyle(String title) => Text(
        title,
        style: const TextStyle(),
      );
  static titleHeader(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.4),
      );
  static productHeader(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.w600,),
      );
  static subproductHeader(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 19, fontWeight: FontWeight.w600,),
      );
}
