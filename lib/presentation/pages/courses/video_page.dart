// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String title;
  final String url;

  const VideoPage({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer() {
    if (_controller.value.isInitialized) {
      final duration = _controller.value.duration;
      final position = _controller.value.position;
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(_controller),
            if (!_isPlaying)
              GestureDetector(
                onTap: () => _controller.play(),
                child: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 64,
                ),
              )
            else
              GestureDetector(
                onTap: () => _controller.pause(),
                child: const Icon(
                  Icons.pause_circle_filled,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                "${_controller.value.position.inMinutes}:${(_controller.value.position.inSeconds % 60).toString().padLeft(2, '0')} / ${_controller.value.duration.inMinutes}:${(_controller.value.duration.inSeconds % 60).toString().padLeft(2, '0')}",
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
                value:
                    position.inSeconds.clamp(0, duration.inSeconds).toDouble(),
                onChanged: (value) {
                  _controller.seekTo(Duration(seconds: value.toInt()));
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideoPlayer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
