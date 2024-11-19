
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/bindings/bindings.dart';
import 'package:pas1_mobile_11pplg2_33/controller/responsif_controller.dart';
import 'package:pas1_mobile_11pplg2_33/login_page.dart';
import 'package:pas1_mobile_11pplg2_33/responsif_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsifController controller = Get.put(ResponsifController());

    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        // List all pages here
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(
            name: '/dashboard',
            page: () => LayoutBuilder(builder: (context, constraints) {
                  controller.updateScreenWidth(constraints.maxWidth);
                  return ResponsifLayout();
                }),
            binding: MyBindings()),
      ],
    );
  }
}
