import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:petology_test/data/models/category.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class AdaptionPage extends StatelessWidget {
  AdaptionPage({Key? key}) : super(key: key);

  String? dropdownvalue = '';

  var items = [
    'Pet',
    'Dog',
    'Cat',
    'Toto',
  ];

  List<Widget> pets = [];

  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    pets = [
      petCard(),
      petCard(),
      petCard(),
      petCard(),
      petCard(),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomNavBar(isTransparent: false),
            Stack(
              children: [
                Positioned(
                  left: 100,
                  top: 200,
                  child: Image.asset("doghand.png"),
                  width: 250,
                  height: 250,
                ),
                Positioned(
                    right: 100,
                    top: 350,
                    child: Image.asset("doghand.png"),
                    width: 250,
                    height: 250),
                Positioned(
                    top: 500,
                    child: Image.asset("doghand.png"),
                    width: 250,
                    height: 250),
                Positioned(
                    bottom: 50,
                    left: 100,
                    child: Image.asset("doghand.png"),
                    width: 250,
                    height: 250),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            filterSection("Breed", screenSize.width / 7),
                            filterSection("Age", screenSize.width / 7),
                            filterSection("Size", screenSize.width / 7),
                            filterSection("Good With", screenSize.width / 7)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            filterSection("Gender", screenSize.width / 7),
                            filterSection("Color", screenSize.width / 7),
                            filterSection("Hair Lenght", screenSize.width / 7),
                            filterSection(
                                "Care & Behavior", screenSize.width / 7)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 450,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: pets.length >= 3 ? 3 : pets.length,
                              itemBuilder: (context, index) {
                                return petCard();
                              },
                            ),
                          ),
                          Container(
                            height: pets.length - 3 > 0 ? 450 : 0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  pets.length - 3 > 0 ? pets.length - 3 : 0,
                              itemBuilder: (context, index) {
                                return petCard();
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          child: Text(
                            "Show More...",
                            style: TextStyle(
                                color: Color(0xff492f24),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomFooter()
          ],
        ),
      ),
    );
  }

  Widget petCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      width: 300,
      decoration: BoxDecoration(
          color: Color(0xffeaeaea), borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Image.asset("dog.png"),
            height: 200,
          ),
          Text(
            "Name",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff492f24),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Send",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
          Text(
            "By User",
            style: TextStyle(fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget filterSection(String name, double width) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            customDropDown(["1", "2"], context, "mapKey")
          ],
        ),
      ),
    );
  }

  Widget customDropDown(List<String> items, context, String mapKey) {
    String? dropDownValue;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: defaultDropDownMenu(
            onChanged: (String newValue) {
              dropDownValue = newValue;
              /*switch(mapKey) {
                case "categoryId":
                  RequestCubit.get(context).selections[mapKey] = newValue == "Dog" ? 1 : 2;
                  break;
                case "gender":
                  RequestCubit.get(context).selections[mapKey] = newValue != "Male" ;
                  break;
                case "houseTrained":
                  RequestCubit.get(context).selections[mapKey] = newValue == "True";
                  break;
                case "year":
                  RequestCubit.get(context).selections[mapKey] = int.parse(newValue);
                  break;
                case "month":
                  RequestCubit.get(context).selections[mapKey] = int.parse(newValue);
                  break;
                default:
                  RequestCubit.get(context).selections[mapKey] = dropDownValue;
              }

              if (hint == "Category") {
                dropDownValue = newValue;
                if (newValue == "Dog") {
                  RequestCubit.get(context)..getDataByCategory("1");
                } else {
                  RequestCubit.get(context)..getDataByCategory("2");
                }
              } else {
              }
                dropDownValue = newValue;
            */
            },
            items: items,
            selectedItem: dropDownValue,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.white,
            dropDownColor: Colors.white,
            borderColor: Colors.transparent,
            alignment: Alignment.center,
            itemTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
