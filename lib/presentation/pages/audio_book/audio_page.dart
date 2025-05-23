// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share_plus/share_plus.dart';

import '../../../theme/app_colors.dart';
import '../../widgets/custome_appbar.dart';

class AudioPage extends StatefulWidget {
  final String artist;
  final String url;
  final String img;
  final String title;
  final String languange;
  final String premium;
  final String waktu;

  const AudioPage({
    super.key,
    required this.artist,
    required this.url,
    required this.img,
    required this.title,
    required this.languange,
    required this.premium,
    required this.waktu,
  });

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setSource(UrlSource(widget.url));

    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  String _formatDate(String rawDate) {
    try {
      DateTime date = DateTime.parse(rawDate);
      return DateFormat('MMM d').format(date);
    } catch (e) {
      return '-';
    }
  }

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
            SnackBar(content: Text(widget.url)),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.img,
                    width: 343.w,
                    height: 400.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  widget.artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.hindGuntur(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    if (widget.premium.toLowerCase() == 'yes')
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.grey,
                        ),
                        child: Text(
                          'Premium',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const Spacer(),
                    Text(
                      '${_formatDate(widget.waktu)} • ${widget.languange}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Slider progress
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      value: _position.inSeconds
                          .toDouble()
                          .clamp(0, _duration.inSeconds.toDouble()),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await _audioPlayer.seek(position);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(_position),
                              style: const TextStyle(color: Colors.white)),
                          Text(_formatDuration(_duration),
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Kontrol player
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () => Share.share(widget.url),
                          icon: const Icon(Icons.share, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () async {
                            final newPos =
                                _position - const Duration(seconds: 10);
                            await _audioPlayer.seek(newPos >= Duration.zero
                                ? newPos
                                : Duration.zero);
                          },
                          icon: const Icon(Icons.skip_previous,
                              color: Colors.white),
                        ),
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              if (_isPlaying) {
                                await _audioPlayer.pause();
                              } else {
                                await _audioPlayer.resume();
                              }
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final newPos =
                                _position + const Duration(seconds: 10);
                            if (newPos < _duration) {
                              await _audioPlayer.seek(newPos);
                            }
                          },
                          icon:
                              const Icon(Icons.skip_next, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Bookmark feature coming soon")),
                            );
                          },
                          icon: const Icon(Icons.bookmark_border,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
