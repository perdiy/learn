import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/course/course_bloc.dart';
import 'bloc/course_detail/course_detail_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'data/datasource/auth_datasource.dart';
import 'data/datasource/course_datasource.dart';
import 'presentation/pages/courses/courses_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('authBox');
    String? token = box.get('token');

    return MultiBlocProvider(
      providers: [
        // LOGIN
        BlocProvider(create: (context) => LoginBloc(AuthDataSource())),
        // GET ALL COURSES
        BlocProvider(create: (context) => CourseBloc(CourseDataSource())),
        // GET DETAIL COURSES
        BlocProvider(create: (context) => CourseDetailBloc(CourseDataSource())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: token == null ? const CoursesPage() : const CoursesPage(),
        ),
      ),
    );
  }
}
