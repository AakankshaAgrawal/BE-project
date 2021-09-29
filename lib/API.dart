import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'register.dart';

class APIservice{

  Future<String> getProductList() async {
    var response = await http.post(
      ngrok + '/product',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Productlist = mapResponse["data"];
      print(Productlist);
    }
  }

  Future<String> registerFarmer() async {
    Map registerMap = {
      "Name": Name,
      "Email_id": Email,
      "Farmer_id": Farmerid,
      "Password": Password,
      "Location": "hello"
    };
    var response = await http.post(
      ngrok + '/farmerregister',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),
    );

  }


}