import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  AddItemPage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

  int selectedValueSize;

  showPickerSize() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValueSize = value;
              });
            },
            itemExtent: 32.0,
            children: const [
              Text('Size 36 | EU'),
              Text('Size 36.5 | EU'),
              Text('Size 37 | EU'),
              Text('Size 37.5 | EU'),
              Text('Size 38 | EU'),
              Text('Size 38.5 | EU'),
              Text('Size 39 | EU'),
              Text('Size 39.5 | EU'),
              Text('Size 40 | EU'),
              Text('Size 40.5 | EU'),
              Text('Size 41 | EU'),
              Text('Size 41.5 | EU'),
              Text('Size 42 | EU'),
              Text('Size 42.5 | EU'),
              Text('Size 43 | EU'),
              Text('Size 43.5 | EU'),
              Text('Size 44 | EU'),
              Text('Size 44.5 | EU'),
              Text('Size 45 | EU'),
            ],
          );
        });
  }

  showPickerHeight() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValueSize = value;
              });
            },
            itemExtent: 32.0,
            children: const [
              Text('Height / cm 36'),
              Text('Height / cm 36.5'),
              Text('Height / cm 37'),
              Text('Height / cm 37.5'),
              Text('Height / cm 38'),
              Text('Height / cm 38.5'),
              Text('Height / cm 39'),
              Text('Height / cm 39.5'),
              Text('Height / cm 40'),
              Text('Height / cm 40.5'),
              Text('Height / cm 41'),
              Text('Height / cm 41.5'),
              Text('Height / cm 42'),
              Text('Height / cm 42.5'),
              Text('Height / cm 43'),
              Text('Height / cm 43.5'),
              Text('Height / cm 44'),
              Text('Height / cm 44.5'),
              Text('Height / cm 45'),
            ],
          );
        });
  }

  showPickerWidth() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValueSize = value;
              });
            },
            itemExtent: 32.0,
            children: const [
              Text('Width / cm 36'),
              Text('Width / cm 36.5'),
              Text('Width / cm 37'),
              Text('Width / cm 37.5'),
              Text('Width / cm 38'),
              Text('Width / cm 38.5'),
              Text('Width / cm 39'),
              Text('Width / cm 39.5'),
              Text('Width / cm 40'),
              Text('Width / cm 40.5'),
              Text('Width / cm 41'),
              Text('Width / cm 41.5'),
              Text('Width / cm 42'),
              Text('Width / cm 42.5'),
              Text('Width / cm 43'),
              Text('Width / cm 43.5'),
              Text('Width / cm 44'),
              Text('Width / cm 44.5'),
              Text('Width / cm 45'),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 229, 229, 229),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(1, 100, 100, 100),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Add photo',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 205,
                  padding: EdgeInsets.all(15),
                  color: Color.fromARGB(100, 100, 100, 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.lightBlueAccent),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                          Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Size',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    color: Color.fromARGB(100, 100, 100, 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/shoesSize.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Image(
                                image: AssetImage("assets/width.png"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 75),
                              child: Image(
                                image: AssetImage("assets/height.png"),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: GestureDetector(
                                  onTap: showPickerSize,
                                  child: Container(
                                    width: 100,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey
                                            )
                                        )
                                    ),
                                    child: Text("Size 39 | EU",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: GestureDetector(
                                  onTap: showPickerHeight,
                                  child: Container(
                                    width: 100,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey
                                            )
                                        )
                                    ),
                                    child: Text("Height / cm | 39",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: GestureDetector(
                                  onTap: showPickerWidth,
                                  child: Container(
                                    width: 100,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey
                                            )
                                        )
                                    ),
                                    child: Text("Width / cm | 39",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Model',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey
                          )
                      )
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Nike Air Max',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Material',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey
                          )
                      )
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Leather',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Details',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey
                          )
                      )
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'This shoes is ...',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    color: Color.fromARGB(100, 100, 100, 100),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Price',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 370,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey
                                )
                            ),
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '100',
                              hintStyle: TextStyle(color: Colors.white30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
