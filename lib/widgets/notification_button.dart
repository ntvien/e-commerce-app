// ignore: import_of_legacy_library_into_null_safe
import 'package:badges/badges.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  late ProductProvider productProvider;
  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            actions: [
              FlatButton(
                child: Text("Clear Notification"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    productProvider.notificationList.clear();
                  });
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(productProvider.notificationList.isNotEmpty
                      ? "Your Product On Way"
                      : "No Notification At Yet"),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Badge(
      position: BadgePosition(start: 25, top: 8),
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      badgeColor: Colors.red,
      child: IconButton(
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black,
        ),
        onPressed: () {
          myDialogBox(context);
        },
      ),
    );
  }
}
