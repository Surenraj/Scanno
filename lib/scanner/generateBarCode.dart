import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';

class GenerateBarCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateBarCodeState();
}

class GenerateBarCodeState extends State<GenerateBarCode> {
  String qrData = "Scanno";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Code Generator'),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: qrData,
              drawText: false,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Generate your new Bar code :",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: " Enter your data or link",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  if (qrdataFeed.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please enter data or link!!");
                    print("Please enter data or link!!");
                    return;
                  } else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                },
                child: Text(
                  "Generate Bar code",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
