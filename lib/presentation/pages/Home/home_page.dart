import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/widgets/menu_home.dart';
import 'package:learn/theme/app_colors.dart';

import '../../widgets/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColors.red,
                  height: 130.h,
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(
                      'assets/images/IT.png',
                      height: 150.h,
                      width: 150.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 24.w,
                  right: 24.w,
                  bottom: -24.h,
                  child: SearchButton(
                    onPressed: () {},
                    backgroundColor: AppColors.grey,
                    foregroundColor: Colors.grey,
                    iconColor: Colors.grey,
                    text: 'Courses, Insight or Events',
                  ),
                ),
              ],
            ),
            const MenuHome(),
          ],
        ),
      ),
    );
  }
}
