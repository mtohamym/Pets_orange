import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/nav_bar/nav_bar_cubit.dart';
import 'package:petology_test/bloc/nav_bar/nav_bar_status.dart';
import 'package:petology_test/pages/request.dart';
import 'package:petology_test/pages/signup.dart';

import '../pages/login.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar(
      {Key? key,
      required this.isTransparent,
      required this.shoeCategorySelectHover})
      : super(key: key);

  Function shoeCategorySelectHover;
  bool isTransparent;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
        lazy: false,
        create: (BuildContext context) => NavBarCubit(),
        child: BlocConsumer<NavBarCubit, NavBarStatus>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              NavBarCubit myCubit = NavBarCubit.get(context);
              return Stack(
                children: [
                  Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                          ),
                          child: Image.asset(
                            "Logo.png",
                            height: 50,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            navBarMenuitem(0, "About us", myCubit , context),
                            SizedBox(width: screenSize.width / 20,),
                            navBarMenuitem(1, "Categories", myCubit,context),
                            SizedBox(width: screenSize.width / 20),
                            navBarMenuitem(2, "Services", myCubit,context),
                            SizedBox(width: screenSize.width / 20),
                            navBarMenuitem(3, "Request", myCubit,context),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => SignUp()));
                                  },
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
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) => LoginPage()));
                                    },
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
                                                side: BorderSide(
                                                    color: Colors.white))))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  Widget navBarMenuitem(int index, String lable, NavBarCubit myCubit , context) {
    return InkWell(
      onHover: (value) {
        if (index == 1 && value) {
          shoeCategorySelectHover(value);
          myCubit.setHoverFor(index, value);
          return;
        }
        myCubit.setHoverFor(index, value);
      },
      onTap: (){
        if(index==3){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => RequestPage()));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            lable,
            style: TextStyle(
              color: myCubit.isHovering[index] ? Colors.white : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: myCubit.isHovering[index],
            child: Container(
              height: 2,
              width: 50,
              color: Color.fromRGBO(255, 227, 197, 1),
            ),
          )
        ],
      ),
    );
  }
}
