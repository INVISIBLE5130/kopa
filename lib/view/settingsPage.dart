import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa/core/ui/mainViewStatefulWidget.dart';
import 'package:path/path.dart' as Path;

class SettingsPage extends StatefulWidget {

  SettingsPage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  File _image;
  Map userProfile;
  bool imageUploaded;
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
    print(_uploadedFileURL);
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });

    setState(() {
      imageUploaded = true;
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
                        child: _uploadedFileURL != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(_uploadedFileURL)
                              )
                              : Image(
                                image: AssetImage('assets/defaultUserImage.png')
                              ),
                          height: 100,
                          width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 50),
                        child: _image == null || imageUploaded == false
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
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 230, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Phone number",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "+380982285663",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                              )
                          ),
                        ),
                        width: 350,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "City",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Vinnytsia",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white
                            ),
                          ),
                        ),
                        width: 350,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterPage()));
                    },
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      width: 270,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.lightBlueAccent
                      ),
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