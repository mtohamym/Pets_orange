import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petology_test/data/models/category.dart';

class Request extends StatefulWidget {
  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Colors.brown),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Request",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Image.asset(""),
                    customTextField("Name"),
                    Container(
                      width: 400,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        hint: Text("$dropdownvalue"),
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue ;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            hint: Text("$dropdownvalue"),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue ;
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
                    Text(
                      "Detect your current location",
                      textAlign: TextAlign.start,
                    ),
                    customTextField("Location"),
                    customTextField("Phone number"),
                    SizedBox(height: 100,child: customTextField("Description")),
                    Text("Vaccinated (up to date)"),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Send",style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            footer(screenSize)
            ],
          ),
        ),
      ),
    ));
  }


  Widget customTextField(String hint) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 13),
                hintText: hint,
                border: InputBorder.none),
               // controller: controller,
          ),
        ));
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
  Widget footer(Size screenSize) {
    return Container(
      height: 300,
      width: screenSize.width,
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
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("doghand.png")),
                    ),
                    Text(
                      "For any questions",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 227, 197, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Tohamydev@gmail.com',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '(+2)0123456789',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("doghand.png")),
                    ),
                    Text(
                      "For any questions",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 227, 197, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Tohamydev@gmail.com',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '(+2)0123456789',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [Text("Image")],
            ),
          ],
        ),
      ),
    );
  }
}
