import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_starter/routes/app_routes_file.dart';
import 'features/home/home_screen.dart';
void main() {
  runApp(const MainEntryApp());
}
class MainEntryApp extends StatelessWidget {
  const MainEntryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const HomeScreen(),
          getPages: appRootRoutesFile,
        );
      },
    );
  }
}
