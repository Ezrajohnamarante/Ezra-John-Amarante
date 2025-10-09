import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:audioplayers/audioplayers.dart';

class MediaPlayerPage extends StatefulWidget {
  const MediaPlayerPage({Key? key}) : super(key: key);

  @override
  State<MediaPlayerPage> createState() => _MediaPlayerPageState();
}

class _MediaPlayerPageState extends State<MediaPlayerPage> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isVideoInitialized = false;
  bool _isAudioPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      ),
    );

    await _videoController.initialize();
    
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: false,
      looping: false,
      aspectRatio: _videoController.value.aspectRatio,
    );

    setState(() {
      _isVideoInitialized = true;
    });
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(
      UrlSource(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      ),
    );
    setState(() {
      _isAudioPlaying = true;
    });
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      _isAudioPlaying = false;
    });
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isAudioPlaying = false;
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Player'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Video Player',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (_isVideoInitialized && _chewieController != null)
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: Chewie(controller: _chewieController!),
            )
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
          const SizedBox(height: 32),
          const Text(
            'Audio Player',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    _isAudioPlaying ? Icons.music_note : Icons.music_off,
                    size: 64,
                    color: _isAudioPlaying
                        ? const Color(0xFF8B5CF6)
                        : Colors.grey,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Sample Audio Track',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _playAudio,
                        icon: const Icon(Icons.play_circle_filled),
                        iconSize: 48,
                        color: const Color(0xFF8B5CF6),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: _pauseAudio,
                        icon: const Icon(Icons.pause_circle_filled),
                        iconSize: 48,
                        color: const Color(0xFF8B5CF6),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: _stopAudio,
                        icon: const Icon(Icons.stop_circle),
                        iconSize: 48,
                        color: const Color(0xFF8B5CF6),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
