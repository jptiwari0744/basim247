import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({required this.icon, required this.name});
  var icon, name;
  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(widget.icon),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Spacer(),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded)),
      ],
    );
  }
}
