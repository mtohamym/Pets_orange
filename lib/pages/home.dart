
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petology_test/bloc/home/home_cubit.dart';
import '../data/models/category.dart';
import '../wedgits/custom_radio.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    List<Profile> Profiles = [];
    Profiles.add(new Profile("Dogs", "ic_cat.png", false));
    Profiles.add(new Profile("Cats", "ic_dog.png", false));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Petology',
                  style: TextStyle(
                      fontFamily: "showg",
                      fontSize: 20,
                      color: Color.fromRGBO(255, 227, 197, 1)),
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
                        onTap: () {


                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'About us',
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.white
                                    : Colors.white,
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
                                color: _isHovering[1]
                                    ? Colors.white
                                    : Colors.white,
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
                                color: _isHovering[2]
                                    ? Colors.white
                                    : Colors.white,
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
                                color: _isHovering[3]
                                    ? Colors.white
                                    : Colors.white,
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side:
                                            BorderSide(color: Colors.white))))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 700,
                  width: screenSize.width,
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
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 150, 0, 0),
                      child: Column(
                        children: const [
                          SizedBox(
                            width: 450,
                            height: 120,
                            child: Text(
                              "Not only people need a house",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 450,
                            height: 350,
                            child: Text(
                              "Name: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata .png",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenSize.width / 2,
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                  width: 700,
                                  height: 300,
                                  child: Image.asset("whitepack.png")),
                              Positioned(
                                bottom: 75,
                                child: Container(
                                  color: Colors.transparent,
                                  height: 75,
                                  width: 200,
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(250),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: SizedBox(
                                    width: 500,
                                    height: 500,
                                    child: Image.asset("pop.png")),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  height: 700,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: screenSize.width / 2,
                              ),
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  SizedBox(
                                      width: 700,
                                      height: 300,
                                      child: Image.asset("whitepack.png")),
                                  Positioned(
                                    bottom: 75,
                                    child: Container(
                                      color: Colors.transparent,
                                      height: 75,
                                      width: 200,
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 10,
                                        borderRadius:
                                            BorderRadius.circular(250),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 50),
                                    child: SizedBox(
                                        width: 500,
                                        height: 500,
                                        child: Image.asset("dog.png")),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 150, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 450,
                              height: 100,
                              child: Text(
                                "About Petology",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Stack(children: [
                              Positioned(
                                right: 50,
                                child: SizedBox(
                                    width: 350,
                                    height: 350,
                                    child: Image.asset("doghand.png")),
                              ),
                              SizedBox(
                                width: 450,
                                height: 350,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              height: 500,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Positioned(
                        right: 50,
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("doghand.png")),
                      ),
                      Text(
                        "Lets get this right ....",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "What kind of friend you looking for?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        InkWell(
                          splashColor: Color(0xff1d162f),
                          onTap: () {
                            setState(() {
                              Profiles.forEach(
                                  (profile) => profile.isSelected = false);
                              Profiles[1].isSelected = true;
                            });
                          },
                          child: SizedBox(
                              width: 180,
                              height: 200,
                              child: CustomRadio(Profiles[1])),
                        ),
                        const SizedBox(
                          width: 33,
                        ),
                        InkWell(
                          splashColor: Color(0xff1d162f),
                          onTap: () {
                            setState(() {
                              Profiles.forEach(
                                  (profile) => profile.isSelected = false);
                              Profiles[0].isSelected = true;
                            });
                          },
                          child: SizedBox(
                              width: 180,
                              height: 200,
                              child: CustomRadio(Profiles[0])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromRGBO(241, 241, 241, 1),
              height: 500,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Positioned(
                        right: 50,
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("doghand.png")),
                      ),
                      Text(
                        "Our friends who looking for a house",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 500,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Positioned(
                        right: 50,
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("doghand.png")),
                      ),
                      Text(
                        "How to take care of your friends? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2),
                    ),
                    height: 260,
                    width: 200,
                    child: Column(
                      children: [
                        Image.asset(
                          "dog.png",
                          height: 200,
                        ),
                        Text("Pet"),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.yellow),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("Read More")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }

}
