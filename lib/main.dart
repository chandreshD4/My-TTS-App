import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MaterialApp(home: TTSPage()));

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initTts();
  }

  initTts() async {
    // यहाँ हम Google का सबसे अच्छा इंजन सेट करने की कोशिश कर रहे हैं
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setEngine("com.google.android.tts"); 
    await flutterTts.setSpeechRate(0.5);
  }

  speak() async {
    await flutterTts.speak(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Professional TTS")),
      body: Column(
        children: [
          TextField(controller: _controller, maxLines: 5),
          ElevatedButton(onPressed: speak, child: Text("सुनें")),
        ],
      ),
    );
  }
}
