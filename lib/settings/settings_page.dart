import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'account_page.dart';
import 'privacy_page.dart';
import 'system_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> with TickerProviderStateMixin {
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
        title: const Text('Settings'),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          AccountPage(),
          PrivacyPage(),
          SystemPage(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Account",
        labels:  ["Account", "Privacy", "System"],
        icons:  [Icons.account_circle, Icons.privacy_tip, Icons.settings_applications],
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