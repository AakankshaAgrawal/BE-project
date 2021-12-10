import 'package:flutter/material.dart';
import 'package:be_project/info_card.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/ngos.dart';




const location = 'Mumbai';

class Profile extends StatefulWidget {
  static String route = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text("AVSHESH"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/farmer_profile_photo.jpg'),
              ),
              Text(
                'Farmer',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OldStandard',
                ),
              ),

              InfoCard(
                text: Name,
                icon: Icons.perm_identity,
              ),
              InfoCard(
                text: Farmer_id,
                icon: Icons.phone,
              ),
              InfoCard(
                text: Email,
                icon: Icons.email,
              ),
              InfoCard(
                text: location,
                icon: Icons.location_city,

              ),
            ],
          ),
        ),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),

          selectedIndex: selectedIndex,

          onSelectTab: (index){
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 0) {
                Navigator.pushNamed(context, Home.route);
              } else if (selectedIndex == 1) {
                Navigator.pushNamed(context, Addproduct.route);
              } else if (selectedIndex == 2) {
                Navigator.pushNamed(context, Ngos.route);
              } else if (selectedIndex == 3) {
                Navigator.pushNamed(context, Profile.route);
              }
            });
          },

          items: items,
        )
    );
  }
}
