import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopa/view/addItemPage.dart';
import 'package:kopa/view/favouritePage.dart';
import 'package:kopa/view/homePage.dart';
import 'package:kopa/view/settingsPage.dart';
import 'package:kopa/view/shoesPage.dart';

class Navigation extends StatefulWidget {

  Navigation({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

  int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(HomePage());
    pageList.add(ShoesPage());
    pageList.add(AddItemPage());
    pageList.add(FavouritePage());
    pageList.add(SettingsPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: IndexedStack(
        index: _selectedPage,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/menu.png')
                ),
                activeIcon: Image(
                    image: AssetImage('assets/menu.png'),
                  color: Colors.lightBlueAccent,
                ),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/shoes.png')
                ),
                activeIcon: Image(
                  image: AssetImage('assets/shoes.png'),
                  color: Colors.lightBlueAccent,
                ),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/heart.png')
                ),
                activeIcon: Image(
                  image: AssetImage('assets/heart.png'),
                  color: Colors.lightBlueAccent,
                ),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/settings.png')
                ),
                activeIcon: Image(
                  image: AssetImage('assets/settings.png'),
                  color: Colors.lightBlueAccent,
                ),
                title: Text('')
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedPage,
          backgroundColor: Color.fromARGB(255, 80, 80, 81),
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
