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
  
  double _rate = 0.5; // स्पीड कंट्रोल
  double _pitch = 1.0; // आवाज़ पतली/मोटी करने के लिए

  speak() async {
    await flutterTts.setSpeechRate(_rate);
    await flutterTts.setPitch(_pitch);
    await flutterTts.setLanguage("hi-IN"); // हिंदी भाषा सेट करें
    await flutterTts.speak(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50], // हल्का रंगीन बैकग्राउंड
      appBar: AppBar(title: Text("TTS Pro App"), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(controller: controller, maxLines: 8, decoration: InputDecoration(hintText: "यहाँ अपना टेक्स्ट डालें...", border: OutlineInputBorder())),
            ),
            SizedBox(height: 20),
            Text("स्पीड (Speed): ${_rate.toStringAsFixed(1)}"),
            Slider(value: _rate, min: 0.1, max: 1.0, onChanged: (val) => setState(() => _rate = val)),
            Text("आवाज़ (Pitch): ${_pitch.toStringAsFixed(1)}"),
            Slider(value: _pitch, min: 0.5, max: 2.0, onChanged: (val) => setState(() => _pitch = val)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              onPressed: speak,
              child: Text("बोलें (Speak)", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
