import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'contacts_page.dart';
import 'discipleship_page.dart';
import 'teams_page.dart';

class MissionsPage extends StatefulWidget {
  const MissionsPage({super.key});

  @override
  MissionsPageState createState() => MissionsPageState();
}

class MissionsPageState extends State<MissionsPage> with TickerProviderStateMixin {
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
        title: const Text('Missions'),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          ContactsPage(),
          DiscipleshipPage(),
          TeamsPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Contacts",
        labels:  ["Contacts", "Discipleship", "Teams"],
        icons:  [Icons.contacts, Icons.people, Icons.group],
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