
import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts.dart';
import './found/found.dart';
import './personal/personal.dart';

class App extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<App> {
  var _currentIndex = 0;
  MessagePage message;
  Contacts contacts;
  Found found;
  Personal personal;

  final _defaultColor = Color(0xff999999);
  final _activeColor = Color(0xff46c01b);
  final PageController _controller = PageController(initialPage: 0);

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
        break;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
        break;
      case 2:
        if (found == null) {
          found = new Found();
        }
        return found;
        break;
      case 3:
        if (personal == null) {
          personal = new Personal();
        }
        return personal;
        break;
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32.0,
                height: 32.0,
              )
            : SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(icon, color: Colors.white),
              ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wx"),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'search');
                // Navigator.of(context).pushNamed("search");
              },
              child: Icon(
                Icons.search,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起群聊',
                          imagePath: 'assets/images/lake.jpg'),
                      _popupMenuItem('添加朋友',
                          imagePath: 'assets/images/found.png'),
                      _popupMenuItem('扫一扫', icon: Icons.crop_free)
                    ],
                  );
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: ((index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          }),
          items: [
            new BottomNavigationBarItem(
              title: new Text(
                '微信',
                style: TextStyle(
                    color: _currentIndex == 0 ? _activeColor : _defaultColor),
              ),
              activeIcon: Icon(Icons.home, color: _activeColor,),
              icon: Icon(Icons.home, color: _defaultColor,),
            ),
            new BottomNavigationBarItem(
              title: new Text(
                '通讯录',
                style: TextStyle(
                    color: _currentIndex == 1 ? _activeColor : _defaultColor),
              ),
              activeIcon: Icon(Icons.contacts, color: _activeColor,),
              icon: Icon(Icons.contacts, color: _defaultColor,),
            ),
            new BottomNavigationBarItem(
              title: new Text(
                '发现',
                style: TextStyle(
                    color: _currentIndex == 2 ? _activeColor : _defaultColor),
              ),
              activeIcon: Icon(Icons.search, color: _activeColor,),
              icon: Icon(Icons.search, color: _defaultColor,),
            ),
            new BottomNavigationBarItem(
              title: new Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex == 3 ? _activeColor : _defaultColor),
              ),
              activeIcon: Icon(Icons.message, color: _activeColor,),
              icon: Icon(Icons.message, color: _defaultColor,),
            ),
          ],
        ),
        body: PageView(
          controller: _controller,
          children: [MessagePage(), Contacts(), Found(), Personal()],
          physics: NeverScrollableScrollPhysics(),
        ) // currentPage(),

        );
  }
}
