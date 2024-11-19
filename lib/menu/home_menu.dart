
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/controller/home_controller.dart';
import 'package:pas1_mobile_11pplg2_33/detail_view_page.dart';
import 'package:pas1_mobile_11pplg2_33/widget/my_card.dart';
import 'package:pas1_mobile_11pplg2_33/widget/my_text.dart';

class HomeMenu extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          text: 'Team List',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E4E5C),
        automaticallyImplyLeading: false, // Menghilangkan back arrow
      ),
      backgroundColor: const Color(0xFF1E4E5C),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.teams.isEmpty) {
          return const Center(
            child: MyText(
              text: 'Tidak ada list team',
              fontSize: 16,
              color: Colors.white70,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.teams.length,
            itemBuilder: (context, index) {
              final team = controller.teams[index];

              return MyCard(
                onTap: () {
                  Get.to(() => DetailViewPage(
                        name: team.name,
                        description: team.deskripsi,
                        image: team.badge,
                        stadium: team.stadium,
                      ));
                },
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                color: const Color(0xFF355A64),
                borderRadius: 15,
                name: team.name,
                image: team.badge,
                stadium: team.stadium,
                description: team.deskripsi,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        team.badge.isNotEmpty
                            ? team.badge
                            : 'https://via.placeholder.com/50',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: team.id,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const MyText(
                                text: "Name: ",
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: team.name,
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
