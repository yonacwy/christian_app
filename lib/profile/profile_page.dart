import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'info_page.dart';
import 'bio_page.dart';
import 'photo_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _motionTabBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          InfoPage(),
          BioPage(),
          PhotoPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Info",
        labels:  ["Info", "Bio", "Photo"],
        icons:  [Icons.info, Icons.text_snippet, Icons.photo],
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController.index = value;
            _tabController.index = value;
          });
        },
      ),
    );
  }
}