import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var email = ''.obs;
  var fullName = ''.obs;
  var phone = ''.obs;

  void updateEmail(String value) {
    email.value = value;
  }

  void updateFullName(String value) {
    fullName.value = value;
  }

  void updatePhone(String value) {
    phone.value = value;
  }
}
