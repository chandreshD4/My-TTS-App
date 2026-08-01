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
    // यह लाइन सीधे Google के 'Neural' इंजन को कॉल करती है
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setVoice({"name": "hi-in-x-hcm-network", "locale": "hi-IN"});
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Natural AI Voice")),
      body: Column(
        children: [
          TextField(controller: controller, maxLines: 5),
          ElevatedButton(onPressed: speak, child: Text("नेचुरल सुनें")),
        ],
      ),
    );
  }
}

