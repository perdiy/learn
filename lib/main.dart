import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn/presentation/pages/Home/home_page.dart';
import 'package:learn/presentation/pages/on_boarding/on_boarding.dart';

import 'bloc/audio/audio_bloc.dart';
import 'bloc/course/course_bloc.dart';
import 'bloc/course_detail/course_detail_bloc.dart';
import 'bloc/lesson/lesson_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'data/datasource/audio_datasource.dart';
import 'data/datasource/auth_datasource.dart';
import 'data/datasource/course_datasource.dart';
import 'data/datasource/lesson_datasource.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(AuthDataSource())),
        BlocProvider(create: (context) => CourseBloc(CourseDataSource())),
        BlocProvider(create: (context) => CourseDetailBloc(CourseDataSource())),
        BlocProvider(create: (context) => AudioBloc(AudioDataSource())),
        BlocProvider(create: (context) => LessonBloc(LessonDataSource())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: ValueListenableBuilder(
          valueListenable: box.listenable(keys: ['token']),
          builder: (context, Box box, _) {
            final String? token = box.get('token');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: token == null ? const OnBoarding() : const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
