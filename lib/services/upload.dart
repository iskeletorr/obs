import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/model/student.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://student-bf5bc.appspot.com");
  AuthService aut = AuthService();
  UploadTask _uploadTask;
  String filePath = 'images/my_image';

  String imageUrl;
  File _image;
  bool loading = false;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  imageUpload() async {
    _uploadTask = _storage.ref().child(filePath).putFile(_image);
    var downloadUrl = await _uploadTask.snapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
      /* if (aut.compareNames().toString() == "true") {
        print("success");
      } */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 400,
          child: GestureDetector(
            onTap: () {
              _imgFromCamera();
            },
            child: _image == null
                ? Center(
                    child: new Icon(
                    Icons.add,
                    size: 100,
                  ))
                : Center(
                    child: ClipRRect(
                    child: new Image.file(_image),
                  )),
          ),
        ),
        Container(
          child: RoundedButton(
            press: () => imageUpload(),
            text: "Upload",
          ),
        ),
      ],
    );
  }
}
