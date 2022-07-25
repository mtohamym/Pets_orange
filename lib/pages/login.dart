import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
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
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50, top: 25),
                width: 500,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 223),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text("Login",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 13),
                                        hintText: "E-Mail",
                                        border: InputBorder.none),
                                    controller: mailController,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 13),
                                        hintText: "Password",
                                        border: InputBorder.none),
                                    controller: passwordController,
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    logIn(mailController.text.trim(),
                                        passwordController.text.trim());
                                  },
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
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ],
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
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("OR"),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: Colors.blue,
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
                                              "Face",
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
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: Colors.yellow,
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
                                              "Google",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("LoginDog.png", width: 250, height: 250),
                      ],
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
                        children: [Text("Image")],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  void logIn(String mail, String password) {}
}
