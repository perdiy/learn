import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'presentation/pages/Home/home_page.dart';
import 'presentation/pages/on_boarding/on_boarding.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    final token = await LocalDataSource().getToken();
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final isLoggedIn = snapshot.data ?? false;

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LoginBloc(AuthDataSource())),
            BlocProvider(create: (_) => CourseBloc(CourseDataSource())),
            BlocProvider(create: (_) => CourseDetailBloc(CourseDataSource())),
            BlocProvider(create: (_) => AudioBloc(AudioDataSource())),
            BlocProvider(create: (_) => LessonBloc(LessonDataSource())),
          ],
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.blue,
                ),
                home: isLoggedIn ? const HomePage() : const OnBoarding(),
              );
            },
          ),
        );
      },
    );
  }
}
