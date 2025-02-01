import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'intro_page.dart';
import 'message_page.dart';
import 'answer_page.dart';

class GospelPage extends StatefulWidget {
  const GospelPage({super.key});

  @override
  GospelPageState createState() => GospelPageState();
}

class GospelPageState extends State<GospelPage> with TickerProviderStateMixin {
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
        title: const Text('Gospel'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          IntroPage(),
          MessagePage(),
          AnswerPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Intro",
        labels: const ["Intro", "Message", "Answer"],
        icons: const [Icons.info, Icons.message, Icons.book],
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController.index = value;
          });
        },
      ),
    );
  }
}