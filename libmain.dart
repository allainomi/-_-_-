import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MuslimKidsApp());

class MuslimKidsApp extends StatelessWidget {
  const MuslimKidsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '???? ???',
      theme: ThemeData(primarySwatch: Colors.green),
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
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playAudio(String file) async {
    await player.play(AssetSource('audio/$file.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('???? ??? - ?????? ?????', textDirection: TextDirection.rtl),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('??? ?????!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildCard('??? ??????', 'wudu', Icons.clean_hands),
            _buildCard('???? ?????', 'namaz', Icons.mosque),
            _buildCard('?????? ????', 'dua', Icons.record_voice_over),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String audioFile, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, textDirection: TextDirection.rtl),
        trailing: IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () => playAudio(audioFile),
        ),
      ),
    );
  }
}