import 'package:flutter/material.dart';
import 'package:flutter_app/screens/account.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/screens/demo.dart';
import 'package:flutter_app/tabs/four.dart';
import '../tabs/first.dart';
import '../tabs/second.dart';
import '../tabs/third.dart';
import '../tabs/six.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  // Create a tab controller
  TabController controller;
  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }
  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("无限流"));
    var aboutChild = AboutListTile(
        child: Text("关于"),
        applicationName: "无限流",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      getNavItem(Icons.add, "Demo", DemoScreen.routeName), // 左侧菜单
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }
  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          icon: Icon(Icons.favorite),
        ),
        Tab(
          icon: Icon(Icons.adb),
        ),
        Tab(
          icon: Icon(Icons.airport_shuttle),
        ),
        Tab(
          icon: Icon(Icons.add),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("清单"),
        backgroundColor: Colors.blue,
      ),
      body: getTabBarView(<Widget>[Six(), First(), Third(), Four()]),
      // Set the nav drawer
      drawer: getNavDrawer(context),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: getTabBar(),
      ),
    );
  }
}
