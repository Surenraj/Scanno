import '/widget/text_recognition_widget.dart';
import 'package:flutter/material.dart';

class RecognitionHome extends StatefulWidget {
  @override
  _RecognitionHomeState createState() => _RecognitionHomeState();
}

class _RecognitionHomeState extends State<RecognitionHome> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Text Recognition"),
          backgroundColor: Colors.lightBlue[400],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextRecognitionWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
}
