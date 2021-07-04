import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/FirestoreApi.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:path/path.dart';

class UploadAvatar extends StatefulWidget {
  const UploadAvatar({Key key}) : super(key: key);

  @override
  _UploadAvatarState createState() => _UploadAvatarState();
}

class _UploadAvatarState extends State<UploadAvatar> {
  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(onPressed: selectFile, child: Text('Select Image')),
              Text(fileName),
              TextButton(onPressed: uploadFile, child: Text('Select Image'))
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    final path = result.files.single.path;
    setState(() => file = new File(path));
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file.path);
    final destination = 'userImage/$fileName';

    task = FirebaseApi.uploadFile(destination, file);

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    DatabaseService().changeUserAvatar(urlDownload);
  }
}
