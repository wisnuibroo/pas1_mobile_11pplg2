
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/controller/task_controller.dart';
import 'package:pas1_mobile_11pplg2_33/model/favorite_model.dart';
import 'package:pas1_mobile_11pplg2_33/widget/my_text.dart';

class DetailViewPage extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final String stadium;

   DetailViewPage({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.stadium,
  }) : super(key: key);

final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFavorite = taskController.isFavorite(name);
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: name,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E4E5C),
      ),
      
      backgroundColor: const Color(0xFF1E4E5C),
      body: Padding(
        child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image.isNotEmpty
                      ? image
                      : 'https://via.placeholder.com/150', 
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 150,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              
            ),
            
            const SizedBox(height: 16),
            MyText(
              text: "Stadium",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            MyText(
              text: stadium.isNotEmpty ? stadium : "Tidak ada stadium",
              fontSize: 14,
              color: Colors.white70,
            ),
            const SizedBox(height: 8),
            MyText(
              text: "Description",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            MyText(
              text:
                  description.isNotEmpty ? description : "Tidak ada deskripsi",
              fontSize: 14,
              color: Colors.white70,
            ),
            
          ],
        ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: GestureDetector(
                  onTap: () async {
                    if (isFavorite) {
                      await taskController.deleteTaskByName(name);
                      Get.snackbar(
                        "Removed from Favorites",
                        "$name telah dihapus dari favorit!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      await taskController.addTask(
                        FavoriteModel(
                          id: null,
                          strTeam: name,
                          strBadge: image,
                          strStadium: stadium,
                          strDescriptionEN: description,
                          isCompleted: false,
                        ),
                      );
                      Get.snackbar(
                        "Added to Favorites",
                        "$name telah ditambahkan ke favorit!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        padding: const EdgeInsets.all(16.0),
        
      ),
    );
    });
  }
}
