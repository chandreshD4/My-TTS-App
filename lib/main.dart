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

  speak() async {
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TTS App")),
      body: Column(
        children: [
          TextField(controller: controller),
          ElevatedButton(onPressed: speak, child: Text("सुनें"))
        ],
      ),
    );
  }
}
