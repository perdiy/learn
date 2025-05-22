import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/pages/courses/courses_detail_page.dart';

import '../../../bloc/course/course_bloc.dart';
import '../../widgets/card_courses.dart';
import '../../widgets/custome_appbar.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    super.initState();

    context.read<CourseBloc>().add(const CourseEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'Courses',
        onBack: () {
          Navigator.pop(context);
        },
        onMenuPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Courses")),
          );
        },
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (model) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          final item = model[index];
                          return CardCourses(
                            author: item.author ?? '',
                            imgCourse: item.path?[0].url ?? '',
                            tile: item.title ?? '',
                            id: item.id ?? '',
                            date: '',
                            jumlahCapter:
                                (item.chapter?.length ?? 0).toString(),
                            chapter: item.chapter
                                    ?.map((e) => {
                                          '_id': e.id,
                                          'title': e.title,
                                        })
                                    .toList() ??
                                [],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoursesDetailPage(
                                    idCourses: item.id ?? '',
                                    chapterList: item.chapter
                                            ?.map((e) => {
                                                  '_id': e.id,
                                                  'title': e.title,
                                                })
                                            .toList() ??
                                        [],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
