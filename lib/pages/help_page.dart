import 'package:flutter/material.dart';
import 'package:petology_test/wedgits/footer.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  String? dropdownvalue = '';

  TextEditingController phoneTextController = TextEditingController();
  TextEditingController loactionTextController = TextEditingController();

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
    return MaterialApp(
        home: Scaffold(
      appBar: navBar(screenSize),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset("doghand.png", width: 300, height: 300),
                    right: 200,
                    top: 100,
                  ),
                  Positioned(
                    child: Image.asset("doghand.png", width: 300, height: 300),
                    left: 200,
                    bottom: 100,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(50),
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 3, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Help your friend",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              "loginDog.png",
                              height: 300,
                              width: 300,
                            ),
                            customDropDown("Category"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 20, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "Detect your current location",
                                  ),
                                ],
                              ),
                            ),
                            customTextField("Location", loactionTextController,
                                icon: Icon(Icons.location_on), useIcon: true),
                            customTextField(
                                "Phone number", phoneTextController),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: Color(0xff492f24),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "Send",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: Color(0xffffe3c5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "Call",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 8),
                                  child:
                                      InkWell(child: Text("Forget password ?")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomFooter()
          ],
        ),
      ),
    ));
  }

  Widget customTextField(String hint, TextEditingController controller,
      {Icon icon = const Icon(Icons.location_on), bool useIcon = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  suffixIcon: useIcon ? icon : null,
                  hintStyle: TextStyle(fontSize: 13),
                  hintText: hint,
                  border: InputBorder.none),
              controller: controller,
            ),
          )),
    );
  }

  Widget customDropDown(String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DropdownButton(
            underline: SizedBox(),
            hint: Text(
              hint,
              style: TextStyle(fontSize: 13),
            ),
            isExpanded: true,
            onChanged: (String? newValue) {
              dropdownvalue = newValue;
            },
            items: items.map((items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
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
                        _isHovering[0] = value;
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
                        _isHovering[1] = value;
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
                        _isHovering[2] = value;
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
                        _isHovering[3] = value;
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
