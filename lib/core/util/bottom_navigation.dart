import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teenaii/core/util/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.home, Icons.home_outlined),
        _buildItem(TabItem.job, Icons.health_and_safety_rounded),
        _buildItem(TabItem.post, Icons.hdr_plus),
        _buildItem(TabItem.profile, Icons.verified_user_outlined),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Colors.blue,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? Colors.blue : Colors.grey;
  }
}
