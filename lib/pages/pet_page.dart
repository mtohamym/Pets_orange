import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/pet/pet_cubit.dart';
import 'package:petology_test/bloc/pet/pet_states.dart';
import 'package:petology_test/data/models/pet.dart';
import 'package:petology_test/wedgits/category_select_hover.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class PetPage extends StatelessWidget {
  PetPage({Key? key, required this.petId}) : super(key: key);

  int petId;

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => PetCubit()..getPetData("$petId"),
        child: BlocConsumer<PetCubit, PetStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              PetCubit myCubit = PetCubit.get(context);

              return Scaffold(
                  body: ConditionalBuilder(
                condition: myCubit.pet != null,
                builder: (context) {
                  List<Image> images = [
                    Image.asset("Logo.png", width: 300, height: 300),
                    Image.asset("Logo.png", width: 300, height: 300),
                    Image.asset("Logo.png", width: 300, height: 300)
                  ];

                  if (myCubit.pet!.image! != null) {
                    for (int i = 0; i < myCubit.pet!.image!.length; i++) {
                      images[i] = Image.memory(Base64Decoder().convert(
                          myCubit.pet!.image![i].toString().substring(22)));
                    }
                  }
                  return SingleChildScrollView(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            myCubit.setShowHover(false);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: screenSize.width,
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
                                      CustomNavBar(
                                          isTransparent: true,
                                          shoeCategorySelectHover: (value) {
                                            myCubit.setShowHover(value);
                                          }),
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Material(
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          200)),
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    myCubit
                                                        .changeImageIndex(-1);
                                                    carouselController
                                                        .previousPage();
                                                  },
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                    color: Color(0xffffe3c5),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                          Icons.arrow_back),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      CarouselSlider(
                                                          carouselController:
                                                              carouselController,
                                                          items: images,
                                                          options: CarouselOptions(
                                                              autoPlay: false,
                                                              height: screenSize
                                                                      .height -
                                                                  150)),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            color: myCubit
                                                                        .imageIndex ==
                                                                    0
                                                                ? Color(
                                                                    0xffffe3c5)
                                                                : Colors
                                                                    .grey[800],
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            color: myCubit
                                                                        .imageIndex ==
                                                                    1
                                                                ? Color(
                                                                    0xffffe3c5)
                                                                : Colors
                                                                    .grey[800],
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            color: myCubit
                                                                        .imageIndex ==
                                                                    2
                                                                ? Color(
                                                                    0xffffe3c5)
                                                                : Colors
                                                                    .grey[800],
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
                                                    myCubit.changeImageIndex(1);
                                                    carouselController
                                                        .nextPage();
                                                  },
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                    color: Color(0xffffe3c5),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                          Icons.arrow_forward),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70.0, vertical: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(myCubit.pet!.name!,
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
                                                        fontSize: 020,
                                                        color:
                                                            Color(0xff492f24))),
                                                Column(
                                                  children: [
                                                    Text(
                                                        '${myCubit.pet!.user!.firstName!} ${myCubit.pet!.user!.lastName!}',
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff492f24))),
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
                                            Text(
                                                '${myCubit.pet!.hairLength!} hair . ${myCubit.pet!.location!}',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color: Color(0xff492f24))),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 70),
                                    child: Text(
                                        '${myCubit.pet!.year!}Year - ${myCubit.pet!.month!}Month . ' +
                                            (myCubit.pet!.gender!
                                                ? "Male"
                                                : "Female") +
                                            ' . ${myCubit.pet!.color!} color',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff492f24))),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70.0, vertical: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("About",
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff492f24))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("HOUSE-TRAINED",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 28)),
                                            Text(
                                                myCubit.pet!.houseTrained!
                                                    ? "Yes"
                                                    : "No",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 22))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("HEALTH",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 28)),
                                            Text(
                                                "Vaccinations is " +
                                                    (myCubit.pet!.vaccinated!
                                                        ? ""
                                                        : "not ") +
                                                    "up to date",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 22))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("HOUSE TRAINED",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 28)),
                                            Text(
                                                myCubit.pet!.houseTrained!
                                                    ? "Yes"
                                                    : "No",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 22))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("CAR & BEHAVIOR",
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 28)),
                                            Text(myCubit.pet!.careBehavior!,
                                                style: TextStyle(
                                                    color: Color(0xff492f24),
                                                    fontSize: 22))
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 70),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "Bell.png",
                                          width: 45,
                                        ),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        SizedBox(
                                          width: 1000,
                                          child: Text(
                                              "Petfinder recommends that you should always take reasonable security steps before making adabtion.",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Color(0xff492f24))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70.0, vertical: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Meet " + myCubit.pet!.name!,
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff492f24))),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Hi,",
                                            style: TextStyle(
                                                color: Color(0xff492f24),
                                                fontSize: 22)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(myCubit.pet!.description!,
                                            style: TextStyle(
                                                color: Color(0xff492f24),
                                                fontSize: 22))
                                      ],
                                    ),
                                  ),
                                ),
                                CustomFooter()
                              ],
                            ),
                          ),
                        ),
                        myCubit.showHover
                            ? Center(child: CategorySelectHover())
                            : SizedBox(),
                      ],
                    ),
                  );
                },
                fallback: (BuildContext context) => Text("No Data"),
              ));
            }));
  }
}

/**
 * 
  
 */