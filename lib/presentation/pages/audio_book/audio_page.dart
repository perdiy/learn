import 'package:flutter/material.dart';

import '../../widgets/custome_appbar.dart';

class AudioPage extends StatefulWidget {
  final String artist;
  final String url;
  final String img;
  final String title;
  final String languange;
  const AudioPage({
    super.key,
    required this.artist,
    required this.url,
    required this.img,
    required this.title,
    required this.languange,
  });

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'PLAY FORM SEARCH',
        onBack: () {
          Navigator.pop(context);
        },
        onMenuPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Audio Book")),
          );
        },
      ),
    );
  }
}
