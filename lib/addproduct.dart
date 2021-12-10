import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dropdown_data.dart';
import 'package:be_project/constants.dart';
import 'API.dart';
import 'package:be_project/home.dart';
import 'package:be_project/ngos.dart';
import 'package:be_project/profile.dart';

class Addproduct extends StatefulWidget {
  static String route = 'addproduct';
  @override
  _AddproductState createState() => _AddproductState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddproductState extends State<Addproduct> {
  APIservice apIservice = APIservice();

  sendProduct() async {
    await apIservice.addProduct();
  }

  final TypeController = new TextEditingController();
  final QuantityController = new TextEditingController();
  final PriceController = new TextEditingController();
  int selectedIndex = 1;

  String selectedStubble = 'TYPE OF STUBBLE';
  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < stubbleList.length; i++) {
      String stubble = stubbleList[i];

      var newItem = DropdownMenuItem(
        child: Text(stubble),
        value: stubble,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  String selectedWeight = 'WEIGHT';
  List<DropdownMenuItem> getWeightItems() {
    List<DropdownMenuItem<String>> weightItems = [];

    for (int i = 0; i < weightList.length; i++) {
      String weight = weightList[i];

      var newItem2 = DropdownMenuItem(
        child: Text(weight),
        value: weight,
      );
      weightItems.add(newItem2);
    }
    return weightItems;
  }

  String selectedPrice = 'PER UNIT';
  List<DropdownMenuItem> getPriceItems() {
    List<DropdownMenuItem<String>> priceItems = [];

    for (int i = 0; i < priceList.length; i++) {
      String price = priceList[i];

      var newItem3 = DropdownMenuItem(
        child: Text(price),
        value: price,
      );
      priceItems.add(newItem3);
    }
    return priceItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange[700],
              title: Text("AVSHESH"),
            ),

            body:  Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  //stubble type dropdown
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      child: DropdownButton<String>(
                          value: selectedStubble,
                          items: getDropdownItems(),
                          isExpanded: true,
                          style: TextStyle(
                              color: Colors.orange[700], fontSize: 20.0),
                          onChanged: (value) {
                            setState(() {
                              selectedStubble = value;
                            });
                          }),
                    ),
                  ),
                  //quantity, price, add button

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: QuantityController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'QUANTITY',
                            ),
                          ),
                          flex: 2,
                        ),

                        SizedBox(
                            width: 20
                        ),

                        Expanded(
                          child: Container(
                            width: 100,
                            child: DropdownButton<String>(
                                value: selectedWeight,
                                items: getWeightItems(),
                                isExpanded: true,
                                style:
                                TextStyle(color: Colors.orange[700], fontSize: 18.0),
                                onChanged: (value) {
                                  setState(() {
                                    selectedWeight = value;
                                  });
                                }),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  ),



                  Container(
                    padding: EdgeInsets.all(10),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: PriceController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'PRICE',
                            ),
                          ),
                        ),

                        SizedBox(
                            width: 20
                        ),

                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 100,
                            child: DropdownButton<String>(
                                value: selectedPrice,
                                items: getPriceItems(),
                                isExpanded: true,
                                style:
                                TextStyle(color: Colors.orange[700], fontSize: 18.0),
                                onChanged: (value) {
                                  setState(() {
                                    selectedPrice = value;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Center(
                    child: Container(
                      child: ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.orange[700],
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Type= selectedStubble;
                            Quantity=QuantityController.text;
                            Price=PriceController.text;
                            sendProduct();
                            Navigator.pushNamed(context, Home.route);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.orange[700],
                                width: 5.0,
                              )),
                        ),
                      ),
                    ),
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
        )
    );
  }
}