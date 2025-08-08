import 'package:flutter/material.dart';
import 'package:project_starter/features/home/home_view.dart';
import '../../../core/constants/app_assert_image.dart';
import '../../core/widget/bottom_navigation/bottom_navigation.dart';
import '../favorite/views/favorite_screen.dart';
import '../notification/views/notification_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  void onTabSelected(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {

    final screens = [
      // HomeScreen(),
      HomeView(),
      NotificationScreen(),
      FavoriteScreen(),
      Scaffold(),
    ];


    return Scaffold(
      backgroundColor: Colors.grey,
      extendBody: true, // Allows background to extend beh
      // ind nav bar if translucent
      body: Stack(
        children: [
          // 🔹 Background image
          Positioned.fill(
            child: Image.asset(
              AppAssertImage.instance.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Main screen content
          Positioned.fill(
            child: screens[currentIndex],
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );

  }
}
