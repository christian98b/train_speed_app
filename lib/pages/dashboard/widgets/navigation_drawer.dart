import 'package:auto_route/auto_route.dart';
import 'package:deutschebahn/router/router.gr.dart';
import 'package:flutter/material.dart';

class DashboardNavigationDrawer extends StatefulWidget {
  const DashboardNavigationDrawer({super.key});

  @override
  State<DashboardNavigationDrawer> createState() =>
      _DashboardNavigationDrawerState();
}

class _DashboardNavigationDrawerState extends State<DashboardNavigationDrawer> {
  final List<String> routeList = [
    "Train Speed Page",
    "Internet Speed Page",
    "Settings Page"
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: Text(routeList[tabsRouter.activeIndex]),
        );
      },
      routes: const [
        TrainSpeedRoute(),
        InternetStateRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: Colors.red,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.train), label: "Zuggeschwindigkeit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wifi_rounded),
                label: "Netzwerkgeschwindigkeit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Einstellungen")
          ],
        );
      },
    );
  }
}
