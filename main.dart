import 'package:flutter/material.dart';
import 'package:piper_dart/piper_dart.dart'; // नया इंजन

void main() => runApp(MaterialApp(home: TTSPage()));

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  final PiperEngine _engine = PiperEngine(); // यहाँ इंजन बनेगा

  @override
  void initState() {
    super.initState();
    // यह सीधे फाइल को लोड करेगा
    _engine.loadModel(modelPath: 'assets/hindi_voice.onnx');
  }

  void _play(String text) {
    _engine.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Natural Voice")),
      body: Center(child: ElevatedButton(onPressed: () => _play("नमस्ते, यह नेचुरल आवाज़ है"), child: Text("सुनें"))),
    );
  }
}
