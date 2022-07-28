import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/home/home_cubit.dart';
import 'package:petology_test/bloc/home/home_states.dart';
import 'package:petology_test/data/models/pet.dart';
import 'package:petology_test/wedgits/category_select.dart';
import 'package:petology_test/wedgits/category_select_hover.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';
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

class HomePage extends StatelessWidget {
  List _isHovering = [false, false, false, false];

  CarouselController carouselController = CarouselController();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => HomeCubit()
        ..getHomeFirstSectionsData(context)
        ..getHomeSecondSectionsData(context)
        ..getHomePetsData(context)
        ..getDogsData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          HomeCubit myCubit = HomeCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: myCubit.firstSectionData != null &&
                    myCubit.secondSectionData != null,
                builder: (context) => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        myCubit.setShowHover(false);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenSize.height,
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
                              child: Column(
                                children: [
                                  CustomNavBar(
                                      isTransparent: true,
                                      shoeCategorySelectHover: (value) {
                                        myCubit.setShowHover(value);
                                      }),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            100, 150, 0, 0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 450,
                                              child: Text(
                                                myCubit.firstSectionData!
                                                    .titleFirstSection,
                                                style: TextStyle(
                                                  wordSpacing: 2,
                                                  letterSpacing: 3,
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
                                              child: Text(
                                                myCubit.firstSectionData!
                                                    .bodyFirstSection,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              color: Colors.white,
                                              child: SizedBox(
                                                width: 450,
                                                height: 60,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(),
                                                      Text(
                                                        "Help them",
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                                      ),
                                                      Icon(Icons
                                                          .arrow_forward_ios)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              100, 0, 0, 0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: screenSize.width / 2,
                                              ),
                                              Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Positioned(
                                                    bottom: -20,
                                                    child: SizedBox(
                                                        width: 700,
                                                        height: 400,
                                                        child: Image.asset(
                                                            "whitepack.png")),
                                                  ),
                                                  Positioned(
                                                    bottom: 55,
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      height: 75,
                                                      width: 220,
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(220),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 30),
                                                    child: SizedBox(
                                                        width: 500,
                                                        height: 500,
                                                        child: Image.asset(
                                                            "pop.png")),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey[300],
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
                                                child: Image.asset(
                                                    "whitepack.png")),
                                            Positioned(
                                              bottom: 115,
                                              child: Container(
                                                color: Colors.transparent,
                                                height: 70,
                                                width: 175,
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 10,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          250),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 50),
                                              child: SizedBox(
                                                  width: 600,
                                                  height: 600,
                                                  child:
                                                      Image.asset("dog.png")),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100, 150, 0, 0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 450,
                                        height: 100,
                                        child: Text(
                                          myCubit.secondSectionData!.title,
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
                                              child:
                                                  Image.asset("doghand.png")),
                                        ),
                                        SizedBox(
                                          width: 450,
                                          height: 350,
                                          child: Text(
                                            myCubit.secondSectionData!.body,
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
                          ),
                          Container(
                              color: Colors.white,
                              height: 500,
                              width: screenSize.width,
                              child: CategorySelect()),
                          Container(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            height: 600,
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
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              carouselController.previousPage();
                                            },
                                            child: Card(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: CarouselSlider.builder(
                                              itemBuilder:
                                                  (context, index, realIndex) {
                                                int first = index * 3;
                                                int second = first + 1;
                                                int third = second + 1;
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    first,
                                                    second,
                                                    third
                                                  ].map((e) {
                                                    return e >
                                                            myCubit.pets
                                                                    .length -
                                                                1
                                                        ? SizedBox()
                                                        : petCard(
                                                            myCubit.pets[e]);
                                                  }).toList(),
                                                );
                                              },
                                              itemCount:
                                                  (myCubit.pets.length / 3)
                                                      .ceil(),
                                              options: CarouselOptions(
                                                autoPlay: false,
                                                aspectRatio: 3,
                                              ),
                                              carouselController:
                                                  carouselController,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              carouselController.nextPage();
                                            },
                                            child: Card(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    color: Color(0xff492f24),
                                    child: SizedBox(
                                      width: 300,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(),
                                            Text(
                                              "Show more",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 650,
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
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return petsNeeds(
                                          myCubit.petsNeedsData[index].title,
                                          myCubit
                                              .petsNeedsData[index].imageUrl);
                                    },
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return petsNeeds(
                                          myCubit
                                              .petsNeedsData[index + 4].title,
                                          myCubit.petsNeedsData[index + 4]
                                              .imageUrl);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomFooter()
                        ],
                      ),
                    ),
                    myCubit.showHover
                        ? Center(child: CategorySelectHover())
                        : SizedBox(),
                  ],
                ),
                fallback: (context) => Center(child: Text('No Data')),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget petCard(Pet pet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2),
        ),
        height: 260,
        width: 200,
        child: Column(
          children: [
            pet.image! != null && pet.image!.isNotEmpty
                ? Image.memory(
                    Base64Decoder()
                        .convert(pet.image![0].toString().substring(22)),
                    height: 200,
                  )
                : Image.asset(
                    "dog.png",
                    height: 200,
                  ),
            Text(pet.name!),
            GestureDetector(
              onTap: () {},
              child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.yellow),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Read More")),
            ),
          ],
        ),
      ),
    );
  }

  Widget petsNeeds(String? name, String? url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75.0),
      child: SizedBox(
        height: 200,
        width: 150,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("BrownCircle.png"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      url!,
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        name!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
