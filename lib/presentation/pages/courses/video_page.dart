// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPage extends StatefulWidget {
  final String id;
  final String title;
  final String url;
  final List<String> titles;
  final List<String> urls;
  final int initialIndex;

  const VideoPage({
    super.key,
    required this.title,
    required this.url,
    required this.id,
    required this.titles,
    required this.urls,
    required this.initialIndex,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late int currentIndex;
  bool _isPlaying = false;
  bool _showControls = true;
  Timer? _hideTimer;

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideTimer();
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _initializeVideo(widget.urls[currentIndex]);
  }

  void _initializeVideo(String url) {
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _startHideTimer();
      });

    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
      });
    });
  }

  void _changeVideo(int newIndex) {
    if (newIndex < 0 || newIndex >= widget.urls.length) return;
    setState(() {
      currentIndex = newIndex;
    });
    _controller.pause();
    _controller.dispose();
    _initializeVideo(widget.urls[newIndex]);
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _goToFullScreen() {
    _hideTimer?.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => FullscreenVideoPage(
        controller: _controller,
        title: widget.titles[currentIndex],
      ),
    ))
        .then((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      _startHideTimer();
    });
  }

  Widget _buildVideoPlayer() {
    if (_controller.value.isInitialized) {
      final duration = _controller.value.duration;
      final position = _controller.value.position;

      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: GestureDetector(
          onTap: _toggleControls,
          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(_controller),
              if (_showControls) ...[
                Positioned(
                  left: 30,
                  child: GestureDetector(
                    onTap: currentIndex > 0
                        ? () => _changeVideo(currentIndex - 1)
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.skip_previous,
                          color: Colors.white, size: 36),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _isPlaying ? _controller.pause() : _controller.play();
                    _startHideTimer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  child: GestureDetector(
                    onTap: currentIndex < widget.urls.length - 1
                        ? () => _changeVideo(currentIndex + 1)
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.skip_next,
                          color: Colors.white, size: 36),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / "
                    "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: -12,
                  child: Slider(
                    activeColor: Colors.red,
                    inactiveColor: Colors.white30,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds
                        .clamp(0, duration.inSeconds)
                        .toDouble(),
                    onChanged: (value) {
                      _controller.seekTo(Duration(seconds: value.toInt()));
                      _startHideTimer();
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: _goToFullScreen,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.fullscreen,
                          color: Colors.white, size: 30),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 90.h),
          const Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 90.h),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideoPlayer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.titles[currentIndex],
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'List Lesson',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.titles.length,
              itemBuilder: (context, index) {
                final isSelected = index == currentIndex;
                return Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.grey : Colors.transparent,
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.white54,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.titles[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      if (index != currentIndex) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideoPage(
                              id: widget.id,
                              title: widget.titles[index],
                              url: widget.urls[index],
                              titles: widget.titles,
                              urls: widget.urls,
                              initialIndex: index,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FullscreenVideoPage extends StatelessWidget {
  final VideoPlayerController controller;
  final String title;

  const FullscreenVideoPage({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.fullscreen_exit,
                    color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
