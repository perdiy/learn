import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/widgets/card_audio.dart';
import '../../../bloc/audio/audio_bloc.dart';
import '../../widgets/custome_appbar.dart';
import 'audio_page.dart';

class AudioBook extends StatefulWidget {
  const AudioBook({super.key});

  @override
  State<AudioBook> createState() => _AudioBookState();
}

class _AudioBookState extends State<AudioBook> {
  @override
  void initState() {
    super.initState();

    context.read<AudioBloc>().add(const AudioEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'Audio Book',
        onBack: () {
          Navigator.pop(context);
        },
        onMenuPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Audio Book")),
          );
        },
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            BlocBuilder<AudioBloc, AudioState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const Center(
                    child: SizedBox(),
                  ),
                  loaded: (model) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          final item = model[index];
                          return CardAudio(
                              id: item.id,
                              title: item.title,
                              artist: item.artist,
                              img: item.thumbnail[0].url,
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const AudioPage(
                                      artist: 'Nama Artist',
                                      url: 'https://example.com/audio.mp3',
                                      img: 'https://example.com/image.jpg',
                                      title: 'Judul Audio',
                                      languange: 'ID',
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin =
                                          Offset(0.0, 1.0); // dari bawah
                                      const end =
                                          Offset.zero; // ke posisi normal
                                      const curve = Curves.ease;

                                      var tween =
                                          Tween(begin: begin, end: end).chain(
                                        CurveTween(curve: curve),
                                      );

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                  ),
                                );
                              });
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
