import 'package:flutter/material.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomNavBar(isTransparent: false),
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
                              "cam.png",
                              height: 300,
                              width: 300,
                            ),
                            customDropDown("Category", ["Cat", "Dog"], context),
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

  Widget customDropDown(String hint, List<String> items, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: defaultDropDownMenu(
            onChanged: (String newValue) {
              dropdownvalue = newValue;
            },
            items: items,
            selectedItem: dropdownvalue,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.white,
            dropDownColor: Colors.white,
            borderColor: Colors.transparent,
            labelText: hint,
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
