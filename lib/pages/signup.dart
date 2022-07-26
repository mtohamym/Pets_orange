import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/sign_up/sign_up_cubit.dart';
import 'package:petology_test/bloc/sign_up/sign_up_states.dart';
import 'package:petology_test/data/constant.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  List _isHovering = [false, false, false, false];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassowrdController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          SignUpCubit myCubit = SignUpCubit.get(context);

          return Scaffold(
            appBar: navBar(screenSize),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: screenSize.width,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Image.asset("doghand.png",
                              width: 300, height: 300),
                          left: 300,
                          top: 100,
                        ),
                        Positioned(
                          child: Image.asset("doghand.png",
                              width: 300, height: 300),
                          right: 300,
                          bottom: 100,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(50),
                            width: 500,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  children: [
                                    const Text("Sign Up",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    socialLoginButtons(),
                                    or(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(
                                        firstNameController, "First Name"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(
                                        secondNameController, "Second Name"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(emailController, "Email"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(
                                        passwordController, "Password"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customTextField(confirmPassowrdController,
                                        "Re-Enter Password"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // drop down menu
                                    customTextField(
                                        countryController, "Country"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (countryController.text
                                                .isNotEmpty &&
                                                confirmPassowrdController.text
                                                    .isNotEmpty &&
                                                passwordController.text
                                                    .isNotEmpty &&
                                                emailController.text
                                                    .isNotEmpty &&
                                                secondNameController.text
                                                    .isNotEmpty &&
                                                firstNameController.text
                                                    .isNotEmpty){
                                            var json = {
                                                "email": emailController.text,
                                                "password": passwordController.text,
                                                "firstName": firstNameController.text,
                                                "lastName": secondNameController.text,
                                                "phoneNumber": confirmPassowrdController.text,
                                                "country": countryController.text
                                              };
                                              myCubit.registerUser(json,SIGNUP_ENDPOINT,context);
                                            }

                                          },
                                          child: Card(
                                            color: Color(0xff492f24),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(25)),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(20.0),
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
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text("Already have an account? "),
                                              InkWell(
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset("dogHand2.png",
                              width: 75, height: 75),
                          left: 400,
                          top: 25,
                        ),
                        Positioned(
                          child: Image.asset("dogHand2.png",
                              width: 75, height: 75),
                          right: 400,
                          bottom: 25,
                        ),
                      ],
                    ),
                  ),
                  footer(screenSize)
                ],
              ),
            ),
          );
        },
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

  Widget customTextField(TextEditingController controller, String hint) {
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
            controller: controller,
          ),
        ));
  }

  Widget logInButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Card(
            color: Color(0xff492f24),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 8),
          child: InkWell(child: Text("Forget password ?")),
        )
      ],
    );
  }

  Widget socialLoginButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Face",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Google",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget or() {
    return Padding(
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
