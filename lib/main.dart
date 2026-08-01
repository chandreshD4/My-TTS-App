import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MaterialApp(home: TTSPage()));

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setupVoice();
  }

  setupVoice() async {
    // यह कमांड फोन के सबसे नेचुरल वॉइस इंजन को ढूंढकर उसे सेट करेगा
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    // यह लाइन सबसे जरूरी है:
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, IosTextToSpeechAudioMode.voicePrompt);
  }

  speak() async {
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Natural TTS")),
      body: Column(
        children: [
          TextField(controller: controller, maxLines: 5),
          ElevatedButton(onPressed: speak, child: Text("नेचुरल आवाज़ में सुनें"))
        ],
      ),
    );
  }
}
