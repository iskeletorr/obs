import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraAccess extends StatefulWidget {
  const CameraAccess({super.key});

  @override
  State<CameraAccess> createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> imgFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera,imageQuality: 50);
    setState(() {
      _image = image;
    });
    return _image;
  }

  Future<XFile?> imgFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
    return _image;
  }

  showPicker(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(shape: BoxShape.rectangle),
      child: GestureDetector(
        onTap: () {
          showPicker(context);
        },
        child: _image == null
            ? const Center(
                child: Icon(
                Icons.camera_alt_rounded,
                size: 30,
              ))
            : Center(
                child: Image.file(File(_image!.path))),
      ),
    );
  }
}
