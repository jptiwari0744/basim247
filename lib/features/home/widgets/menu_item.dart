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
      riveIcon: Icon(Icons.home, color: Colors.purple),
    ),
    MenuItemModel(
      title: "My Orders",
      riveIcon: Icon(Icons.shopping_bag, color: Colors.purple),
      children: menuItems2,
    ),
    MenuItemModel(
      title: "My Wishlist",
      riveIcon: const Icon(Icons.favorite, color: Colors.purple),
      children: menuItems2,
    ),
  ];

  static List<MenuItemModel> menuItems2 = [
    MenuItemModel(
      title: "History",
      riveIcon: const Icon(Icons.history, color: Colors.purple),
    ),
    MenuItemModel(
      title: "Notification",
      riveIcon: const Icon(Icons.notifications_active, color: Colors.purple),
    ),
  ];

  static List<MenuItemModel> menuItems3 = [
    MenuItemModel(
      title: "Help",
      riveIcon: const Icon(Icons.chat, color: Colors.purple),
    ),
  ];

  static List<MenuItemModel> menuItems4 = [
    MenuItemModel(
      title: "Logout",
      riveIcon: Icon(Icons.logout, color: Colors.purple),
    ),
  ];
}
