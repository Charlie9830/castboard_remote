import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUploadDialog extends StatefulWidget {
  final Uint8List byteData;
  final Uri uri;

  const FileUploadDialog({Key? key, required this.uri, required this.byteData})
      : super(key: key);

  @override
  _FileUploadDialogState createState() => _FileUploadDialogState();
}

class _FileUploadDialogState extends State<FileUploadDialog> {
  @override
  void initState() {
    super.initState();
    _startFileTransfer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 16),
          Text('Uploading file..', style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  void _startFileTransfer() async {
    try {
      final response = await http.put(widget.uri, body: widget.byteData);
      Navigator.of(context).pop(FileUploadDialogResult(
        response: response,
      ));
    } catch (e) {
      Navigator.of(context).pop(FileUploadDialogResult(
        exceptionMessage: e.toString(),
      ));
    }
  }
}

class FileUploadDialogResult {
  final http.Response? response;
  final String exceptionMessage;

  FileUploadDialogResult({
    this.response,
    this.exceptionMessage = '',
  });
}