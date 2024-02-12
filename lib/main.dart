import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:magento_ecom/app/provider/authProvider.dart';
import 'package:magento_ecom/app/provider/login_provider.dart';
import 'package:magento_ecom/app/provider/myprofile_provider.dart';
import 'package:magento_ecom/app/provider/personal_info.provider.dart';
import 'package:magento_ecom/app/provider/product_details_provider.dart';
import 'package:magento_ecom/app/provider/product_provider.dart';
import 'package:magento_ecom/app/provider/products_by_id_provider.dart';
import 'package:magento_ecom/app/util/routes.dart';
import 'package:magento_ecom/features/authentication/pages/login_page.dart';
import 'package:magento_ecom/ui/responsive/layouts/main_layout.dart';
import 'package:provider/provider.dart';

import 'app/provider/category_provider.dart';

void main() async {
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductByIdProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MyProfileProvider()),
        ChangeNotifierProvider(create: (_) => PersonalInfoProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routes: routes,
          home: AppRoot()),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  var token;
  @override
  void initState() {
    getToken();
    print('main');

    // TODO: implement initState
    super.initState();
  }

  getToken() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    token = Provider.of<AuthProvider>(context, listen: false).authToken;
    // token = await prefs.getString('auth_token');
    print('main$token');
  }

  @override
  Widget build(BuildContext context) {
    Widget content = LoginPage();
    if (token != null) {
      content = MainLayout();
    }
    return content;
  }
}
