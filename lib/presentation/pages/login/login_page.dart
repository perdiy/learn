import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/presentation/widgets/text_field.dart';
import 'package:learn/theme/app_colors.dart';

import '../../widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0.h,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                Center(
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: 71.h,
                    width: 119.w,
                  ),
                ),
                SizedBox(height: 104.h),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Login to your account',
                  style: GoogleFonts.hindGuntur(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  title: 'E-mail',
                  hintText: 'Enter Work E-mail',
                  controller: emailController,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  title: 'Password',
                  hintText: 'Enter Password',
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  title: 'Login',
                  onPressed: () {
                    // logic login
                  },
                  backgroundColor: AppColors.red,
                  borderColor: AppColors.red,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
