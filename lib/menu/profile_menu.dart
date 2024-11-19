import 'package:flutter/material.dart';

import 'package:pas1_mobile_11pplg2_33/widget/my_text.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4E5C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      const SizedBox(height: 20),
                      MyText(
                        text: 'Wisnu Ibrahimma F',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 18,
                ),
                const SizedBox(width: 5),
                MyText(
                  text: 'Kudus, Central Java, Indonesian',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 60),
            MyText(
              text: 'Achievement',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10.0,
              children: [
                Chip(
                  label: MyText(
                    text: 'Ahli Membaca',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Chip(
                  label: MyText(
                    text: 'Penjelajah Team',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Chip(
                  label: MyText(
                    text: 'Team Favorite',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Chip(
                  label: MyText(
                    text: 'Master Dokumen',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Chip(
                  label: MyText(
                    text: 'Penggila Team',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.local_fire_department_sharp,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Chip(
                  label: MyText(
                    text: 'Penggemar Bola',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF142C34),
                  avatar: const Icon(
                    Icons.sports_basketball,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
