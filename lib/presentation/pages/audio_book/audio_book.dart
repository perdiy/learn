import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioBook extends StatefulWidget {
  const AudioBook({super.key});

  @override
  State<AudioBook> createState() => _AudioBookState();
}

class _AudioBookState extends State<AudioBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0.h,
      ),
    );
  }
}
