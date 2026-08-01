import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: TTSPage()));

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final TextEditingController _controller = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  // अपनी API Key यहाँ डालें
  final String apiKey = "076cc458f8e570a6d12d5acb3e5c95aedbc230ef";

  Future<void> speak() async {
    final url = Uri.parse('https://api.deepgram.com/v1/speak?model=aura-asteria-en'); // आप यहाँ हिंदी मॉडल नाम बदल सकते हैं
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Token $apiKey',
        'Content-Type': 'application/json',
      },
      body: '{"text": "${_controller.text}"}',
    );

    if (response.statusCode == 200) {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/speech.mp3');
      await file.writeAsBytes(response.bodyBytes);
      await _audioPlayer.play(DeviceFileSource(file.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deepgram AI Voice")),
      body: Column(
        children: [
          TextField(controller: _controller, maxLines: 5),
          ElevatedButton(onPressed: speak, child: Text("नेचुरल आवाज़ सुनें")),
        ],
      ),
    );
  }
}
