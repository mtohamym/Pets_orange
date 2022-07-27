import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/footer/footer_cubit.dart';
import 'package:petology_test/bloc/footer/footer_states.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

/*



*/

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => FooterCubit()..getFooterData(context),
      child: BlocConsumer<FooterCubit, FooterStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            FooterCubit myCubit = FooterCubit.get(context);
            return Container(
              height: 250,
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
              child: ConditionalBuilder(
                condition: myCubit.footerData != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 37,
                              right: 10,
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset("doghand.png")),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "For any questions",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 227, 197, 1),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Color(0xffae957b),
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        myCubit.footerData!.email,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 227, 197, 1),
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
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xffae957b),
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        myCubit.footerData!.phone,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 227, 197, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 37,
                              right: 10,
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset("doghand.png")),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "We are waiting for you",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 227, 197, 1),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xffae957b),
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        myCubit.footerData!.location,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 227, 197, 1),
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
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xffae957b),
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        myCubit.footerData!.location2,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 227, 197, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "FooterDog.png",
                            height: 225,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(child: Text('No Data')),
              ),
            );
          }),
    );
  }
}


/*


  #ae957b
 */
