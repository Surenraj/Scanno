import 'dart:io';

import 'package:clipboard/clipboard.dart';

import '/api/firebase_ml_api.dart';
import 'text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'controls_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File image;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Expanded(child: buildImage()),
            const SizedBox(height: 16),
            ControlsWidget(
                onClickedCamImage: camerImage,
                onClickedScanText: scanText,
                onClickedGalleryImage: galleryImage),
            const SizedBox(height: 16),
            TextAreaWidget(
              text: text,
              onClickedCopy: copyToClipboard,
              onClickedClear: clear,
            ),
          ],
        ),
      );

  Widget buildImage() => Container(
        child: image != null
            ? Image.file(image)
            : Icon(Icons.photo, size: 80, color: Colors.black),
      );

  Future galleryImage() async {
    var selectedimage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    File croppedFile =
        await ImageCropper.cropImage(sourcePath: selectedimage.path);

    setState(() {
      image = croppedFile;
      setImage(File(image.path));
    });
  }

  Future camerImage() async {
    var selectedimage = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    File croppedFile =
        await ImageCropper.cropImage(sourcePath: selectedimage.path);

    setState(() {
      image = croppedFile;
      setImage(File(image.path));
    });
  }

  Future scanText() async {
    Fluttertoast.showToast(
      msg: "Scanning...",
      gravity: ToastGravity.CENTER,
    );
    CircularProgressIndicator();
    final text = await FirebaseMLApi.recogniseText(image);
    setText(text);
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
      Fluttertoast.showToast(
        msg: "Copied to Clipboard",
        gravity: ToastGravity.CENTER,
      );
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
