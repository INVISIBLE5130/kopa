import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

class SettingsPage extends StatefulWidget {

  SettingsPage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map userProfile;
  File _image;
  String _uploadedFileURL;

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('userImages/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('Image Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: Container(
        alignment: Alignment.topRight,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image(
                image: AssetImage("assets/header.png"),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 30),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: _uploadedFileURL != null
                              ? Image.network(_uploadedFileURL)
                              : AssetImage('assets/defaultUserImage.png'),
                          height: 100,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 50),
                        child: _image == null
                            ? FloatingActionButton(
                                onPressed: chooseFile,
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 35,
                                    ),
                                    backgroundColor: Colors.lightBlueAccent,
                                ),
                                backgroundColor: Colors.lightBlueAccent,
                            )
                            : FloatingActionButton(
                                onPressed: uploadFile,
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                                backgroundColor: Colors.lightBlueAccent,
                            ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 20),
                  child: Text(
                    'Guest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}