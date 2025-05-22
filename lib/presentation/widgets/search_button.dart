import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconColor;
  final String text;

  const SearchButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.red,
    this.iconColor = Colors.red,
    this.text = 'Search',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.search,
            color: iconColor,
            size: 25.r,
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
