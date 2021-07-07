import 'package:flutter/material.dart';
import 'package:bunkie/services/services.dart';
import 'package:bunkie/utils/utils.dart';
import 'shared/responsive_widget.dart';

class EmptyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        onWillPop: () => locator<NavigationService>().goBack(),
        builder: (context, size) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.green[800],
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    locator<NavigationService>().goBack();
                  },
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/NotBell.png'),
                )),
              ));
        });
  }
}
