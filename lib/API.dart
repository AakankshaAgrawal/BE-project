import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'register.dart';

class APIservice{

  Future<String> getProductList() async {
    Map homeMap = {
      "Farmer_id": Farmer_id,
    };
    var response = await http.post(
      ngrok + '/product',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(homeMap),
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
      "Farmer_id": Farmer_id,
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
  Future<String> getNGOList() async {
    var response = await http.post(
      ngrok + '/displayngo',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Productlist = mapResponse["data"];
      print(NGOlist);
    }
  }

  Future<String> addProduct() async {
    Map productMap = {
      "Farmer_id": Farmer_id,
      "Type": Type,
      "Quantity": Quantity,
      "Price": Price,

    };
    var response = await http.post(
      ngrok + '/addproduct',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(productMap),
    );

  }

  Future<String> DeleteProduct() async {
    Map delproductMap = {
      "Product_id": Product_id,

    };
    var response = await http.post(
      ngrok + '/delete',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(delproductMap),
    );

  }

}