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
    initTts();
  }

  initTts() async {
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
  }

  speak() async {
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Natural TTS App")),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10), child: TextField(controller: controller, maxLines: 5, decoration: InputDecoration(border: OutlineInputBorder()))),
          ElevatedButton(onPressed: speak, child: Text("सुनें (Listen)"))
        ],
      ),
    );
  }
}
