import 'package:flutter/material.dart';
import 'package:magento_ecom/app/provider/myprofile_provider.dart';
import 'package:magento_ecom/features/profile/widget/profile_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/profile_setting.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyProfileProvider>(context, listen: false)
          .myProfileApi(context);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Profile'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<MyProfileProvider>(builder: (context, key, child) {
                return key.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(key.res['user']['avatar']),
                            minRadius: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  key.res['user']['name'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(key.res['user']['id'],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/edit');
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.purple.shade200,
                          )
                        ],
                      );
              }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileContainer(icon: Icons.gite, title: 'Order'),
                  ProfileContainer(
                      icon: Icons.favorite_border, title: 'Wishlist')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileContainer(icon: Icons.card_giftcard, title: 'Coupons'),
                  ProfileContainer(icon: Icons.headphones, title: 'Help Center')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              Text(
                'Account Settings',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileSetting(
                icon: Icons.person_outline,
                name: 'Edit Profile',
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              ProfileSetting(
                icon: Icons.location_on_outlined,
                name: 'Saved Addresses',
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              ProfileSetting(
                icon: Icons.text_fields,
                name: 'Select Language',
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              ProfileSetting(
                icon: Icons.notifications_none_rounded,
                name: 'Notification',
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              InkWell(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // final token = await prefs.getString('auth_token');
                  await prefs.remove('auth_token');
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (Route<dynamic> route) => false);
                },
                child: ProfileSetting(
                  icon: Icons.logout_sharp,
                  name: 'Log Out',
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
