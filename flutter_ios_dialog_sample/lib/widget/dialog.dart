import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  String _title = "";
  String _message = "";
  VoidCallback _okCallback;
  BuildContext _context;

  DialogMessage(String title, String message, VoidCallback okCallback) {
    _title = title;
    _message = message;
    _okCallback = okCallback;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Platform.isIOS ? _buildDialogiOS() : _buildDialogAndroid();
  }

  Widget _buildDialogAndroid() {
    return AlertDialog(
        title: Text(_title),
        content: Text(_message),
        actions: <Widget>[
          FlatButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(_context);
            },
          ),
          FlatButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(_context);
              _okCallback();
            },
          )
        ]);
  }

  Widget _buildDialogiOS() {
    return CupertinoAlertDialog(
        title: Text(_title),
        content: Text(_message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("Cancel"),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(_context);
            },
          ),
          CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(_context);
                _okCallback();
              }),
        ]);
  }
}

class DialogMessageCallback {}
