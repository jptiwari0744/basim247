import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FooterHomePage extends StatefulWidget {
  const FooterHomePage({super.key});

  @override
  State<FooterHomePage> createState() => _FooterHomePageState();
}

class _FooterHomePageState extends State<FooterHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var selectedTab = 0;

  void onBottomTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (selectedTab == 1) {
      // content = ProductPage();
    }
    if (selectedTab == 2) {
      // content = NewArrivalPage();
    }

    if (selectedTab == 3) {
      // content = MyProfilePage();
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 6, 20, 92).withOpacity(0.15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: GNav(
          padding: const EdgeInsets.all(10),
          activeColor: Colors.white,
          color: const Color.fromARGB(255, 6, 20, 92),
          selectedIndex: selectedTab, // Pass the selected index
          onTabChange: onBottomTab,

          tabBackgroundColor:
          const Color.fromARGB(255, 6, 20, 92).withOpacity(0.8),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            GButton(
              icon: Icons.local_offer_outlined,
              text: "Offer",
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            GButton(
              icon: Icons.person_outline,
              text: "Account",
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
