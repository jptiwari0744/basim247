import 'package:flutter/material.dart';

import '../../../features/home/pages/home_page.dart';
import '../../../features/home/widgets/footer.dart';
import '../../../features/home/widgets/side-manu.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        // title: Image.asset('assets/logo1.png'),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_rounded))
        ],
      ),
      body: HomePage(),
      bottomNavigationBar: FooterHomePage(),
    );
  }
}
