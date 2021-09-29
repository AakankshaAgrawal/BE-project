import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

List<FFNavigationBarItem> items = [
  FFNavigationBarItem(
    iconData: Icons.home,
    label: 'Home',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.add,
    label: 'Add Product',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.people,
    label: 'Assistance',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.person,
    label: 'Profile',
    selectedBackgroundColor: Colors.orange[700],
  ),
];

List Productlist;
String Farmerid;
String Name;
String Email;
String Password;
String ngrok="https://5cfb-27-106-11-47.ngrok.io";
