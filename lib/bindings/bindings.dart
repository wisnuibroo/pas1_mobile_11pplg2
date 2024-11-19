

import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/controller/dashboard_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardController());
  }
}