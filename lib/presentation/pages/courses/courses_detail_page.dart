import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/course_detail/course_detail_bloc.dart';

class CoursesDetailPage extends StatefulWidget {
  final String idCourses;
  final List<Map<String, dynamic>> chapterList;
  const CoursesDetailPage({
    super.key,
    required this.idCourses,
    required this.chapterList,
  });

  @override
  State<CoursesDetailPage> createState() => _CoursesDetailPageState();
}

class _CoursesDetailPageState extends State<CoursesDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CourseDetailBloc>()
        .add(CourseDetailEvent.get(widget.idCourses));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: CircularProgressIndicator()),
          laoded: (model) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Course
                  Image.network(
                    model.path[0].url,
                    height: 198.h,
                    width: 375.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5.h),

                  // Judul
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      model.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // Judul Section Chapter
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      'Chapters:',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 5.h),

                  // List Chapter
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      itemCount: widget.chapterList.length,
                      itemBuilder: (context, index) {
                        final chapter = widget.chapterList[index];
                        return Card(
                          color: Colors.grey[900],
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          child: ListTile(
                            title: Text(
                              chapter['title'] ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                            // subtitle: Text(
                            //   chapter['_id'] ?? '',
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white10,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
