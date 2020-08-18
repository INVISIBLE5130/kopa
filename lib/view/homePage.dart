import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16, // Choose the nav bar style with this property.
    );
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 30),
                child: Image(
                  image: AssetImage("assets/filter.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Card(
                        color: Color.fromARGB(100, 100, 100, 100),
                        child: InkWell(
                          splashColor: Colors.yellow.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 150.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/item.png'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 2.0, color: Colors.black)
                                  ]
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 310, bottom: 80),
                                  child: Chip(
                                    label: Text(
                                      "100" + new String.fromCharCodes(new Runes('\u0024')),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                      ),
                                    ),
                                    shadowColor: Colors.black,
                                    backgroundColor: Colors.yellow,
                                    elevation: 10,
                                    autofocus: true,
                                  )
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  setState(() => { pressed = !pressed });
                                  widget.onPressed();
                                },
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.favorite,
                                    color: pressed ? Colors.red : Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 170, top: 10),
                                child: Text(
                                  "Nike 992K",
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 170, top: 35),
                                child: Text(
                                  "Розміри стопи: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 170, top: 60),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "40",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 22
                                          ),
                                        ),
                                        Text(
                                          "EU",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 3),
                                            child: Text(
                                              "28.5",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Довжина / см",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 3),
                                            child: Text(
                                              "10",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Ширина / см",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 170, top: 105),
                                child: Text(
                                  "Матеріал: Шкіра",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.apps),
      title: ("Home"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.pets),
      title: ("My items"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.add),
      title: ("Add item"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite),
      title: ("Liked"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: ("Settings"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
  ];
}