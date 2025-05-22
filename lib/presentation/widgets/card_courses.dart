import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/theme/app_colors.dart';

class CardCourses extends StatefulWidget {
  final String id;

  final String imgCourse;
  final String tile;
  final String date;
  final String jumlahCapter;
  final String author;
  final List<Map<String, dynamic>> chapter;
  final VoidCallback? onTap;

  const CardCourses({
    super.key,
    required this.imgCourse,
    required this.tile,
    required this.id,
    required this.date,
    required this.jumlahCapter,
    required this.author,
    required this.chapter,
    required this.onTap,
  });

  @override
  State<CardCourses> createState() => _CardCoursesState();
}

class _CardCoursesState extends State<CardCourses> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(0.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imgCourse,
                    fit: BoxFit.cover,
                    height: 98.h,
                    width: 88.w,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        widget.tile,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(4),
                          //   child: Image.network(
                          //     widget.imgCourse,
                          //     fit: BoxFit.cover,
                          //     height: 20.h,
                          //     width: 20.w,
                          //   ),
                          // ),
                          // SizedBox(width: 5.h),
                          Text(
                            widget.author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.greenAccent),
                            ),
                            child: Text(
                              'Beginner',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // SizedBox(width: 8.w),
                          // ClipOval(
                          //   child: Container(
                          //     height: 16.h,
                          //     width: 16.w,
                          //     color: Colors.amberAccent,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 3.w),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.grey),
                            child: Row(
                              children: [
                                Text(
                                  'Design',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                widget.jumlahCapter,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              const Icon(
                                Icons.book,
                                color: Colors.white,
                                size: 14,
                              ),
                              // SizedBox(width: 6.w),
                              // Text(
                              //   '30:15',
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: TextStyle(
                              //     fontFamily: 'Poppins',
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 12.sp,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Image.asset('assets/images/line.png'),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
