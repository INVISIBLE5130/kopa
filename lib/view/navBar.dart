import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopa/view/addItemPage.dart';
import 'package:kopa/view/favouritePage.dart';
import 'package:kopa/view/settingsPage.dart';
import 'package:kopa/view/shoesPage.dart';

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

  List<Widget> _pages;
  Widget _page1;
  Widget _page2;
  Widget _page3;
  Widget _page4;
  Widget _page5;

  int _currentIndex;
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _page1 = HomePage();
    _page2 = ShoesPage();
    _page3 = AddItemPage();
    _page4 = FavouritePage();
    _page5 = SettingsPage();

    _pages = [_page1, _page2, _page3, _page4, _page5];

    _currentIndex = 0;
    _currentPage = _page1;
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: _currentPage,
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 80, 80, 81),
          type: BottomNavigationBarType.fixed,
          onTap: (index) => changeTab(index),
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/menu.png'),
                ),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/shoes.png')
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
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/settings.png')
                ),
                title: Text('')
            ),
          ],
        ),
      ),
    );
  }
}