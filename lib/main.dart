import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/audio/audio_bloc.dart';
import 'bloc/course/course_bloc.dart';
import 'bloc/course_detail/course_detail_bloc.dart';
import 'bloc/lesson/lesson_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'data/datasource/audio_datasource.dart';
import 'data/datasource/auth_datasource.dart';
import 'data/datasource/course_datasource.dart';
import 'data/datasource/lesson_datasource.dart';
import 'data/datasource/local_datasource.dart';
import 'presentation/pages/Home/home_page.dart';
import 'presentation/pages/on_boarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLogin() async {
    return await LocalDataSource().isLogin();
  }

  @override
  Widget build(BuildContext context) {
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: _checkLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasData && snapshot.data == true) {
                return const HomePage();
              } else {
                return const OnBoarding();
              }
            },
          ),
        ),
      ),
    );
  }
}
