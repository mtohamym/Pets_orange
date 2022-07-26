import 'package:flutter/material.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key? key}) : super(key: key);
  String? dropdownvalue = '';

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController colorTextController = TextEditingController();
  TextEditingController loactionTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

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
            Stack(
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
                Container(
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
                          "Request",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          "loginDog.png",
                          height: 300,
                          width: 300,
                        ),
                        customTextField("Name", nameTextController),
                        customDropDown("Category"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customDropDown("Year")),
                            Expanded(child: customDropDown("Month")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customDropDown("Size")),
                            Expanded(child: customDropDown("Breed")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customDropDown("Gender")),
                            Expanded(child: customDropDown("Breed")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customDropDown("Hair Lenght")),
                            Expanded(child: customDropDown("Care & Behavior")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customDropDown("House Trained")),
                            Expanded(
                                child: customTextField(
                                    "Color", colorTextController)),
                          ],
                        ),
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
                        customTextField("Location", loactionTextController),
                        customTextField("Phone number", phoneTextController),
                        SizedBox(
                            height: 100,
                            child: customTextField(
                                "Description", descriptionTextController)),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Vaccinated (up to date)"),
                              Checkbox(value: false, onChanged: (value) {})
                              //Todo: check box
                            ],
                          ),
                        ),
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
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            footer(screenSize)
          ],
        ),
      ),
    ));
  }

  Widget customTextField(String hint, TextEditingController controller) {
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
