import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[200],
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14.sp,
      unselectedFontSize: 14.sp,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                locator<NavigationService>().pushNamed(SelectionViewRoute);
              },
              child: Icon(Icons.house)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                locator<NavigationService>()
                    .pushNamed(UserProfileViewRoute);
              },
              child: Icon(Icons.person)),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(onTap: () {
            locator<NavigationService>()
                .pushNamed(UserMessagesViewRoute);
          }, child: Icon(Icons.mail)),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {}, child: Icon(Icons.notifications)),
          label: 'Notifications',
        ),
      ],
    );
  }
}