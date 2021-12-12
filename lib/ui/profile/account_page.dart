// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:dicoding_capstone_pos/ui/profile/settings_page.dart';
import 'package:dicoding_capstone_pos/widgets/row_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';
  static const pageTitle = 'Account';

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthProvider>(context).user;
    var name = user.displayName != null && user.displayName != ''
        ? user.displayName
        : 'Anonymous';

    var padding = EdgeInsets.only(
      top: 12.5,
      bottom: 12.5,
      left: 4.0,
      right: 18.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Account'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pp.jpg'),
                  maxRadius: 40,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                    Text(user.email!)
                  ],
                )
              ],
            ),
            SizedBox(height: 22.0),
            RowMenu(
              title: 'Setting Account',
              padding: padding,
              onClick: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            ),
            Divider(
              height: 1,
            ),
            RowMenu(
                title: 'Business Information',
                padding: padding,
                onClick: () {}),
            Divider(
              height: 1,
            ),
            RowMenu(title: 'User Help', padding: padding, onClick: () {}),
            Divider(
              height: 1,
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemRed),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 60.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, OnboardingPage.routeName, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: CupertinoColors.systemRed,
                  elevation: 0,
                ),
                child: Text(
                  'Log out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
