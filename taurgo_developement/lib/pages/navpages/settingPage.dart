import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

import '../../controllers/authController.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;
  bool locationEnabled = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: bWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('General Settings',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SwitchListTile(
                title: Text('Sound', style: TextStyle(fontSize: 12)),
                value: soundEnabled,
                onChanged: (bool value) {
                  setState(() {
                    soundEnabled = value;
                  });
                },
                activeColor: kPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
              SwitchListTile(
                title: Text('Notifications', style: TextStyle(fontSize: 12)),
                value: notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                activeColor: kPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),

              Divider(),
              ListTile(
                title: Text('About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Version', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('License',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Terms of Service', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 15),
                      Text('Privacy Policy', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 30.0),
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.deleteAccount();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        'Delete Account',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: bWhite, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(50), // Button corner radius
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
