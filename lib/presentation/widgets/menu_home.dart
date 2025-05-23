// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/theme/app_colors.dart';
import '../../data/datasource/local_datasource.dart';
import '../pages/audio_book/audio_book.dart';
import '../pages/courses/courses_page.dart';
import '../pages/login/login_page.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  final LocalDataSource _localDataSource = LocalDataSource();

  Future<void> _logout() async {
    await _localDataSource.clearToken();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  void _showLogoutDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Konfirmasi Logout',
      desc: 'Apakah Anda yakin ingin keluar?',
      btnCancelOnPress: () {},
      btnOkOnPress: _logout,
    ).show();
  }

  late final List<_MenuItem> menuItems = [
    _MenuItem(
      title: 'Courses',
      icon: Icons.play_circle,
      page: const CoursesPage(),
    ),
    _MenuItem(
      title: 'Audio Book',
      icon: Icons.book,
      page: const AudioBook(),
    ),
    _MenuItem(
      title: 'Logout',
      icon: Icons.logout,
      onTap: _showLogoutDialog,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return GestureDetector(
            onTap: () {
              if (item.onTap != null) {
                item.onTap!();
              } else if (item.page != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.page!),
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final Widget? page;
  final VoidCallback? onTap;

  _MenuItem({
    required this.title,
    required this.icon,
    this.page,
    this.onTap,
  });
}
