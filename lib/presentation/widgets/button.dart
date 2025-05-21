import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
