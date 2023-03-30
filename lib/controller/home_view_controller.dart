import 'package:api_fetch_own/model/user_data.dart';
import 'package:api_fetch_own/services/api_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeViewControll extends GetxController {
  var isloading = true.obs;
  Getuser? result;

  @override
  void onInit() {
    // TODO: implement onInit
    apicall();
    super.onInit();
  }

  apicall() async {
    isloading(true);
    result = await ApiServices.getapi();
    isloading(false);
  }
}
