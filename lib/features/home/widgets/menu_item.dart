import 'package:flutter/material.dart';

class MenuItemModel {
  MenuItemModel(
      {this.id,
      this.title = "",
      required this.riveIcon,
      this.children = const []});

  UniqueKey? id = UniqueKey();
  String title;
  Icon riveIcon;
  List<MenuItemModel> children;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Home",
      riveIcon: const Icon(Icons.home, color: Colors.black),
    ),
    MenuItemModel(
      title: "My Orders",
      riveIcon: const Icon(Icons.shopping_bag,
          color: Color.fromARGB(255, 95, 112, 192)),
      children: menuItems2,
    ),
    MenuItemModel(
      title: "My Wishlist",
      riveIcon:
          const Icon(Icons.favorite, color: Color.fromARGB(255, 95, 112, 192)),
      children: menuItems2,
    ),
  ];

  static List<MenuItemModel> menuItems2 = [
    MenuItemModel(
      title: "History",
      riveIcon:
          const Icon(Icons.history, color: Color.fromARGB(255, 95, 112, 192)),
    ),
    MenuItemModel(
      title: "Notification",
      riveIcon: const Icon(Icons.notifications_active,
          color: Color.fromARGB(255, 95, 112, 192)),
    ),
  ];

  static List<MenuItemModel> menuItems3 = [
    MenuItemModel(
      title: "Help",
      riveIcon:
          const Icon(Icons.chat, color: Color.fromARGB(255, 95, 112, 192)),
    ),
  ];

  static List<MenuItemModel> menuItems4 = [
    MenuItemModel(
      title: "Logout",
      riveIcon:
          const Icon(Icons.logout, color: Color.fromARGB(255, 95, 112, 192)),
    ),
  ];
}
