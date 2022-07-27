import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/login/login_cubit.dart';
import 'package:petology_test/bloc/login/login_states.dart';
import 'package:petology_test/data/constant.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          LoginCubit myCubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomNavBar(isTransparent: false),
                    Container(
                      margin: EdgeInsets.only(bottom: 50, top: 25),
                      width: 500,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 223),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  const Text("Login",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField("Email", mailController),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                      "Password", passwordController),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (mailController.text.isNotEmpty &&
                                              passwordController
                                                  .text.isNotEmpty) {
                                            var json = {
                                              "email": mailController.text
                                                  .trim()
                                                  .toString(),
                                              "password": passwordController
                                                  .text
                                                  .toString()
                                                  .trim(),
                                            };
                                            myCubit.loginUser(
                                                json, LOGIN_ENDPOINT, context);
                                          }
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
                                        child: InkWell(
                                            child: Text("Forget password ?")),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
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
                                  socialLoginButtons()
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("LoginDog.png",
                                  width: 250, height: 250),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomFooter()
                  ]),
            ),
          );
        },
      ),
    );
  }

  Widget customTextField(String hint, TextEditingController controller) {
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
}
