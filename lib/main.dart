import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MuslimKidsApp());
}

class MuslimKidsApp extends StatelessWidget {
  const MuslimKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مسلم کڈز ایپ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Uthmanic',
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/jamia.html');
  }

  void _playAudio(String audioPath) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مسلم کڈز ایپ'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildAudioButton('الفاتحہ', 'audio/fatiha.mp3'),
                  _buildAudioButton('الناس', 'audio/nas.mp3'),
                  _buildAudioButton('الفلق', 'audio/falaq.mp3'),
                  _buildAudioButton('الاخلاص', 'audio/ikhlas.mp3'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: WebViewWidget(controller: _webViewController),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioButton(String title, String audioPath) {
    return ElevatedButton(
      onPressed: () => _playAudio(audioPath),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
