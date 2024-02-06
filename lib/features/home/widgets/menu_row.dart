import 'package:magento_ecom/features/home/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({
    Key? key,
    required this.menu,
    this.selectedMenu = "Home",
    this.onMenuPress,
  }) : super(key: key);

  final MenuItemModel menu;
  final String selectedMenu;
  final Function? onMenuPress;

  void onMenuPressed() {
    if (selectedMenu != menu.title) {
      onMenuPress?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget menuRowWidget(menu) {
      return Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: Opacity(
              opacity: 0.6,
              child: menu.riveIcon,
            ),
          ),
          const SizedBox(width: 14),
          Text(
            menu.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 95, 112, 192),
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ],
      );
    }

    return Stack(
      children: [
        // The menu button background that animates as we click on it
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: selectedMenu == menu.title ? 288 - 16 : 0,
          height: 56,
          curve: const Cubic(0.2, 0.8, 0.2, 1),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 43, 50, 87),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        CupertinoButton(
          padding: menu.children.isNotEmpty
              ? const EdgeInsets.symmetric(vertical: 0, horizontal: 16)
              : const EdgeInsets.all(12),
          pressedOpacity: 1, // disable touch effect
          onPressed: onMenuPressed,
          child: menu.children.isNotEmpty
              ? ExpansionTile(
                  title: menuRowWidget(menu),
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  onExpansionChanged: (bool isExpanded) {
                    onMenuPressed();
                  },
                  children: [
                    for (var subMenu in menu.children) ...[
                      ListTile(
                        title: menuRowWidget(subMenu),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 42),
                        onTap: onMenuPressed,
                      ),
                    ],
                  ],
                )
              : menuRowWidget(menu),
        ),
      ],
    );
  }
}
