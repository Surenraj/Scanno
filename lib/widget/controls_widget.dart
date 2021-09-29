import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedCamImage;
  final VoidCallback onClickedScanText;
  // final VoidCallback onClickedClear;
  final VoidCallback onClickedGalleryImage;

  const ControlsWidget({
    @required this.onClickedCamImage,
    @required this.onClickedScanText,
    // @required this.onClickedClear,
    @required this.onClickedGalleryImage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton.icon(
              onPressed: onClickedCamImage,
              icon: Icon(Icons.camera),
              label: Text('Camera')),
          const SizedBox(width: 12),
          FlatButton.icon(
            onPressed: onClickedScanText,
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: Text('Scan'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(width: 12),
          FlatButton.icon(
              onPressed: onClickedGalleryImage,
              icon: Icon(Icons.photo_library),
              label: Text('Gallery')),
          // RaisedButton(
          //   onPressed: onClickedClear,
          //   child: Text('Clear'),
          // )
        ],
      );
}
