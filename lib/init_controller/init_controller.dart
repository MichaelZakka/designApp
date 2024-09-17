import 'package:get/get.dart';

class InitController extends GetxController {
  String token = '';

  Map<String, String> TOKEN_HEADER() {
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }
}
