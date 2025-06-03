import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/course/course_bloc.dart';
import 'bloc/course_detail/course_detail_bloc.dart';
import 'bloc/audio/audio_bloc.dart';
import 'bloc/lesson/lesson_bloc.dart';
import 'data/datasource/auth_datasource.dart';
import 'data/datasource/course_datasource.dart';
import 'data/datasource/audio_datasource.dart';
import 'data/datasource/lesson_datasource.dart';
import 'data/datasource/local_datasource.dart';
import 'presentation/pages/Home/home_page.dart';
import 'presentation/pages/on_boarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Inisialisasi LocalDataSource dan buka box sekali saja
  final localDataSource = LocalDataSource();
  await localDataSource.init();

  String? token = await localDataSource.getToken();

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

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
          home: token == null ? const OnBoarding() : const HomePage(),
        ),
      ),
    );
  }
}
