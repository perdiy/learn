import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/presentation/pages/login/login_page.dart';
import 'package:learn/theme/app_colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/slide 1.png",
      "title": "Upgrade skills,\nShow off credentials!",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis accumsan.",
    },
    {
      "image": "assets/images/slide 2.png",
      "title": "Learn at your\nown pace",
      "desc":
          "Fusce sed tristique metus. Integer tincidunt, urna non congue viverra.",
    },
    {
      "image": "assets/images/slide 3.png",
      "title": "Get certified\nand hired!",
      "desc":
          "Aliquam erat volutpat. Aenean luctus, augue ac placerat gravida.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: onboardingData.length,
                      options: CarouselOptions(
                        height: 600.h,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIdx) {
                        final item = onboardingData[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50.h),
                            Center(
                              child: Image.asset(
                                item["image"]!,
                                height: 260.h,
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Text(
                              item["title"]!,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 28.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              item["desc"]!,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.hindGuntur(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: _currentIndex == index ? 16.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.red
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
