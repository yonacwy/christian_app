import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'read_page.dart';
import 'study_page.dart';
import 'notes_page.dart';

class BiblePage extends StatefulWidget {
  const BiblePage({super.key});

  @override
  BiblePageState createState() => BiblePageState();
}

class BiblePageState extends State<BiblePage> with TickerProviderStateMixin {
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
        title: const Text('Bible'),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          ReadPage(),
          StudyPage(),
          NotesPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Read",
        labels:  ["Read", "Study", "Notes"],
        icons:  [Icons.book, Icons.menu_book, Icons.edit_note],
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