import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({Key? key, required this.isTransparent}) : super(key: key);

  bool isTransparent;
  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 70,
      decoration: !isTransparent
          ? BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(103, 71, 57, 1),
                Color.fromRGBO(24, 7, 1, 1),
              ],
            ))
          : null,
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
                            color: _isHovering[0] ? Colors.white : Colors.white,
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
                      onHover:
                      (value) {
                        _isHovering[1] = value;
                      };
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: _isHovering[1] ? Colors.white : Colors.white,
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
                      onHover:
                      (value) {
                        _isHovering[2] = value;
                      };
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: _isHovering[2] ? Colors.white : Colors.white,
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
                      onHover:
                      (value) {
                        _isHovering[3] = value;
                      };
                    },
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Request',
                          style: TextStyle(
                            color: _isHovering[3] ? Colors.white : Colors.white,
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
    );
  }
}
