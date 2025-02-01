import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'create_page.dart';
import 'events_page.dart';
import 'calendar_page.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  JournalPageState createState() => JournalPageState();
}

class JournalPageState extends State<JournalPage> with TickerProviderStateMixin {
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
        title: const Text('Journal'),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          CreatePage(),
          EventsPage(),
          CalendarPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Create",
        labels:  ["Create", "Events", "Calendar"],
        icons:  [Icons.list, Icons.assignment, Icons.calendar_today],
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