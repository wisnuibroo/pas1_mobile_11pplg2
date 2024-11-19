import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/controller/task_controller.dart';
import 'package:pas1_mobile_11pplg2_33/model/favorite_model.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final double elevation;
  final Color color;
  final double borderRadius;

  final String name;
  final String image;
  final String stadium;
  final String description;
  final VoidCallback? onTap;

  MyCard({
    required this.child,
    required this.margin,
    required this.elevation,
    required this.color,
    required this.borderRadius,
    required this.name,
    required this.image,
    required this.stadium,
    required this.description,
    this.onTap,
  });

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFavorite = taskController.isFavorite(name);

      return InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          margin: margin,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
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
        ),
      );
    });
  }
}
