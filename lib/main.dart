import 'package:flutter/material.dart';
import 'package:piper_tts/piper_tts.dart';

void main() => runApp(MaterialApp(home: TTSPage()));

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final PiperTts _piperTts = PiperTts();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // यहाँ हम एसेट वाली उस नेचुरल फाइल को लोड कर रहे हैं
    _piperTts.loadModel(assetPath: 'assets/hindi_voice.onnx');
  }

  void _speak() {
    _piperTts.speak(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Natural Voice App")),
      body: Column(
        children: [
          TextField(controller: _controller, maxLines: 5),
          ElevatedButton(onPressed: _speak, child: Text("नेचुरल आवाज़ में सुनें")),
        ],
      ),
    );
  }
}
