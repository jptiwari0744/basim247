import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magento_ecom/features/home/widgets/menu_item.dart';
import 'package:magento_ecom/features/home/widgets/menu_row.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItems;
  final List<MenuItemModel> _historyMenuIcons = MenuItemModel.menuItems2;
  final List<MenuItemModel> _helpMenuIcon = MenuItemModel.menuItems3;
  final List<MenuItemModel> _themeMenuIcon = MenuItemModel.menuItems4;
  String _selectedMenu = MenuItemModel.menuItems[0].title;
  bool _isDarkMode = false;

  void onThemeRiveIconInit(artboard) {}

  void onMenuPress(MenuItemModel menu) {
    setState(() {
      _selectedMenu = menu.title;
    });
  }

  void onThemeToggle(value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      constraints: const BoxConstraints(maxWidth: 288),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/back.png'),
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      const Color.fromARGB(255, 37, 43, 78).withOpacity(0.2),
                  foregroundColor: const Color.fromARGB(255, 29, 33, 56),
                  child: const Icon(Icons.person_outline),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Karuna",
                      style: TextStyle(
                          color: Color.fromARGB(255, 29, 33, 56),
                          fontSize: 17,
                          fontFamily: "Inter"),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Software Engineer",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 36, 42, 78)
                              .withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: "Inter"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuButtonSection(
                      title: "Manu",
                      selectedMenu: _selectedMenu,
                      menuIcons: _browseMenuIcons,
                      onMenuPress: onMenuPress),
                  MenuButtonSection(
                      title: "History",
                      selectedMenu: _selectedMenu,
                      menuIcons: _historyMenuIcons,
                      onMenuPress: onMenuPress),
                  MenuButtonSection(
                      title: "Help",
                      selectedMenu: _selectedMenu,
                      menuIcons: _helpMenuIcon,
                      onMenuPress: onMenuPress),
                ],
              ),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Opacity(
                  opacity: 0.6,
                  child: _themeMenuIcon[0].riveIcon,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  _themeMenuIcon[0].title,
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 17,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection(
      {Key? key,
      required this.title,
      required this.menuIcons,
      this.selectedMenu = "Home",
      this.onMenuPress})
      : super(key: key);

  final String title;
  final String selectedMenu;
  final List<MenuItemModel> menuIcons;
  final Function(MenuItemModel menu)? onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
                color: const Color.fromARGB(255, 29, 33, 56).withOpacity(0.7),
                fontSize: 15,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var menu in menuIcons) ...[
                Divider(
                    color:
                        const Color.fromARGB(255, 29, 33, 56).withOpacity(0.1),
                    thickness: 1,
                    height: 1,
                    indent: 16,
                    endIndent: 16),
                MenuRow(
                  menu: menu,
                  selectedMenu: selectedMenu,
                  onMenuPress: () => onMenuPress!(menu),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
