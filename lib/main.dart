import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(RadioStreamerApp());
}

class RadioStreamerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
      ],
      child: MaterialApp(
        title: 'Radio Streamer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RadioStreamerScreen(),
      ),
    );
  }
}

class RadioStreamerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerModel = Provider.of<AudioPlayerModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Streamer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Streaming FM Radio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: IconButton(
                iconSize: 60,
                icon: Icon(
                  playerModel.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  playerModel.togglePlayPause();
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              playerModel.isPlaying ? 'Playing' : 'Paused',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioPlayerModel extends ChangeNotifier {
  final _player = AudioPlayer();
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  AudioPlayerModel() {
    _player.setUrl('http://your-streaming-link'); // Replace with your actual streaming link
  }

  void togglePlayPause() {
    if (_isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
