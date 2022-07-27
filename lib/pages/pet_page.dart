import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String petName = "Elsa";
    String userName = "Rawan Khaled";
    String description =
        "Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa Elsa";
    CarouselController carouselController = CarouselController();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height,
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
              child: Column(
                children: [
                  CustomNavBar(isTransparent: true),
                  Stack(
                    children: [
                      Positioned(
                        top: 75,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "whitepack.png",
                                  height: 350,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(200)),
                                  color: Colors.transparent,
                                  child: Container(
                                    width: 250,
                                    height: 75,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                carouselController.previousPage();
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                color: Color(0xffffe3c5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  CarouselSlider(
                                      carouselController: carouselController,
                                      items: [
                                        Image.asset("LoginDog.png",
                                            width: 300, height: 300),
                                        Image.asset("LoginDog.png",
                                            width: 300, height: 300),
                                        Image.asset("LoginDog.png",
                                            width: 300, height: 300)
                                      ],
                                      options: CarouselOptions(
                                          autoPlay: false,
                                          height: screenSize.height - 150)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        color: Color(0xffffe3c5),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        color: Colors.grey[800],
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        color: Colors.grey[800],
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                carouselController.nextPage();
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                color: Color(0xffffe3c5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(petName,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff492f24))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Shared by : ",
                                style: TextStyle(
                                    fontSize: 020, color: Color(0xff492f24))),
                            Column(
                              children: [
                                Text(userName,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff492f24))),
                                Container(
                                  height: 2,
                                  width: 150,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text("Short hair . Fr",
                            style: TextStyle(
                                fontSize: 28, color: Color(0xff492f24))),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "whatsApp.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              "phone.png",
                              height: 40,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              color: Color(0xfff1f1f1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70),
                child: Text(userName,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff492f24))),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff492f24))),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 28)),
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 22))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 28)),
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 22))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 28)),
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 22))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 28)),
                        Text("test",
                            style: TextStyle(
                                color: Color(0xff492f24), fontSize: 22))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              color: Color(0xfff1f1f1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70),
                child: Row(
                  children: [
                    Image.asset(
                      "Bell.png",
                      width: 45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                        "Petfinder recommends that you should always take reasonable security\nsteps before making adabtion.",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff492f24))),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(petName,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff492f24))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(description,
                        style:
                            TextStyle(color: Color(0xff492f24), fontSize: 22))
                  ],
                ),
              ),
            ),
            CustomFooter()
          ],
        ),
      ),
    );
  }
}
