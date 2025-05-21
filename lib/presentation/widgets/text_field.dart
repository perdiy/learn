import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          style: GoogleFonts.hindGuntur(
            fontSize: 16.sp,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.hindGuntur(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            contentPadding:
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
