import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:zoom_drawer_without_getx/pages/model/menu_item.dart';
import 'package:zoom_drawer_without_getx/pages/views/payment_page.dart';

import 'menu_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MyMenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {

    return ZoomDrawer(
      // style: DrawerStyle.style1,
      borderRadius: 40,
      angle: -10,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      mainScreen: getSelectedScreen(),
      menuScreen: MenuPage(
        currentItem: currentItem,
        onSelectedItem: (item){
          setState(() {
            currentItem = item;
            ZoomDrawer.of(context)!.close();
          });
        }
      ),

    );
  }

  Widget getSelectedScreen() {
    switch (currentItem){
      case MenuItems.payment:
        return PaymentPage();
      case MenuItems.promos:
        return PaymentPage();
      case MenuItems.notifications:
        return PaymentPage();
      case MenuItems.help:
        return PaymentPage();
      case MenuItems.aboutUs:
        return PaymentPage();
      case MenuItems.rateUs:
        return PaymentPage();
    }
  }
}