
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/model/home_model.dart';
import 'package:pas1_mobile_11pplg2_33/service/api_service_page.dart';


class HomeController extends GetxController {
  var teams = <HomeModel>[].obs; 
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories(); 
    super.onInit();
  }

  void fetchCategories() async { 
    try {
      isLoading(true);
      var teamsList = await ApiServicePage().fetchCategory();
      if (teamsList != null) {
        teams.assignAll(teamsList); 
      }
    } finally {
      isLoading(false);
    }
  }
}
