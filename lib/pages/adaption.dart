import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petology_test/data/models/category.dart';
import 'package:petology_test/wedgits/footer.dart';

class Adaption extends StatefulWidget {
  const Adaption({Key? key}) : super(key: key);

  @override
  _AdaptionState createState() => _AdaptionState();
}

class _AdaptionState extends State<Adaption> {
  String? dropdownvalue = '';

  var items = [
    'Pet',
    'Dog',
    'Cat',
    'Toto',
  ];

  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Profile> Profiles = [];
    Profiles.add(new Profile("Dogs", "ic_cat.png", false));
    Profiles.add(new Profile("Cats", "ic_dog.png", false));

    return MaterialApp(
      home: Scaffold(
        appBar: navBar(screenSize),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Breed"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Gender"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Color"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Size"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Hair Length"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good With"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                        Text("Care & Behavior"),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  "Send",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                          Text(
                            "By User",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Show More...",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                CustomFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize navBar(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(103, 71, 57, 1),
            Color.fromRGBO(24, 7, 1, 1),
          ],
        )),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                "Logo.png",
                height: 35,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About us',
                            style: TextStyle(
                              color:
                                  _isHovering[0] ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: Color.fromRGBO(255, 227, 197, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color:
                                  _isHovering[1] ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: Color.fromRGBO(255, 227, 197, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Services',
                            style: TextStyle(
                              color:
                                  _isHovering[2] ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: Color.fromRGBO(255, 227, 197, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Request',
                            style: TextStyle(
                              color:
                                  _isHovering[3] ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 50,
                              color: Color.fromRGBO(255, 227, 197, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 5),
                    Container(
                      width: 100,
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 225, 225, 0.5),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.white))))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
