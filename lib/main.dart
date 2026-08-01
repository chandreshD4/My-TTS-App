import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TTSPage());
  }
}

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController controller = TextEditingController();

  speak() async {
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My TTS App")),
      body: Column(
        children: [
          TextField(controller: controller, maxLines: 5, decoration: InputDecoration(hintText: "यहाँ टेक्स्ट लिखें...")),
          ElevatedButton(onPressed: speak, child: Text("बोलें (Speak)")),
        ],
      ),
    );
  }
}
