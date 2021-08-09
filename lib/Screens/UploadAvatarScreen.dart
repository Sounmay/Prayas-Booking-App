import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelance_booking_app/Providers/FirestoreApi.dart';
import 'package:freelance_booking_app/Providers/database.dart';
import 'package:path/path.dart';

class UploadAvatar extends StatefulWidget {
  const UploadAvatar({Key key}) : super(key: key);

  @override
  _UploadAvatarState createState() => _UploadAvatarState();
}

class _UploadAvatarState extends State<UploadAvatar> {

  File _image;
  String imageUrl;

  Future _getImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    setState(() {
      _image = File(image.path);
      print('_image: $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5D5FEF),
        title: Text('Upload Profile Image'),
      ),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width*1,
            margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          iconSize: 100.0,
                          color: Color(0xFF5D5FEF),
                          icon: Icon(Icons.photo_library,),
                          onPressed: () => _getImage(ImageSource.gallery),
                        ),
                        Text('Gallery')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          iconSize: 100.0,
                          color: Color(0xFF5D5FEF),
                          icon: Icon(Icons.camera),
                          onPressed: () => _getImage(ImageSource.camera),
                        ),
                        Text('Camera')
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                (_image==null)? Text('Choose an option to select image'):
                TextButton(
                    child: Text('Upload Image', style: TextStyle(color: Colors.white),),
                    onPressed: () => uploadImage(),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5D5FEF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    )
                ),
                SizedBox(height: 20.0,),
                (imageUrl!=null) ? Image.network(imageUrl):Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity,),
              ],
            )
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    if(_image!=null){
      var snapshot = await _storage.ref().child('profilePicture/userPic').putFile(_image);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl=downloadUrl;
      });
    }
    else{
      print('No Path Received');
    }
  }
}


