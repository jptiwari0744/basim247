import 'package:flutter/material.dart';
import 'package:magento_ecom/features/product_details/pages/category.dart';
import 'package:magento_ecom/ui/responsive/layouts/main_layout.dart';

import '../../features/authentication/pages/login_page.dart';
import '../../features/product_details/pages/product_details_page.dart';
import '../../features/product_details/pages/product_page.dart';
import '../../features/product_details/pages/search_page.dart';
import '../../features/profile/pages/edit_page.dart';

var routes = {
  '/home': (BuildContext context) => MainLayout(),
  '/login': (BuildContext context) => LoginPage(),
  '/edit': (BuildContext context) => EditPage(),
  '/product': (BuildContext context) => ProductPage(),
  '/search': (BuildContext context) => SearchPage(),
  '/productDetail': (BuildContext context) => ProductDetailsPage()
};
