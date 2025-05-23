import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/pages/courses/video_page.dart';
import '../../../bloc/course_detail/course_detail_bloc.dart';
import '../../../bloc/lesson/lesson_bloc.dart';

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
  int? expandedIndex;

  @override
  void initState() {
    super.initState();
    context
        .read<CourseDetailBloc>()
        .add(CourseDetailEvent.get(widget.idCourses));
    context.read<LessonBloc>().add(const LessonEvent.get());
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
                        final isExpanded = expandedIndex == index;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: Colors.grey[900],
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              child: ListTile(
                                title: Text(
                                  chapter['title'] ?? '',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                trailing: Icon(
                                  isExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : index;
                                  });
                                },
                              ),
                            ),

                            // Subchapter tampil saat expanded
                            if (isExpanded)
                              BlocBuilder<LessonBloc, LessonState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => const Center(
                                      child: SizedBox(),
                                    ),
                                    loaded: (model) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: model.map<Widget>((item) {
                                          return Card(
                                            color: Colors.grey,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: ListTile(
                                              title: Text(
                                                item.title,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              trailing: const Icon(
                                                Icons.play_circle_fill,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VideoPage(
                                                              title: item.title,
                                                              url: item.path[0]
                                                                  .url)),
                                                );
                                              },
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                },
                              )
                          ],
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
