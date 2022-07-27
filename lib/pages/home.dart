import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/home/home_cubit.dart';
import 'package:petology_test/bloc/home/home_states.dart';
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
  List pets = [0, 1, 2, 3, 4, 5, 6, 7];

  CarouselController carouselController = CarouselController();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Profile> Profiles = [];
    Profiles.add(new Profile("Dogs", "ic_cat.png", false));
    Profiles.add(new Profile("Cats", "ic_dog.png", false));
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => HomeCubit()
        ..getHomeFirstSectionsData(context)
        ..getHomeSecondSectionsData(context)
        ..getHomePetsData(context)
        ..getHomeFooterData(context),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          HomeCubit myCubit = HomeCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: myCubit.firstSectionData != null &&
                    myCubit.secondSectionData != null &&
                    myCubit.footerData != null,
                builder: (context) => Column(
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
                            CustomNavBar(isTransparent: true),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100, 150, 0, 0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 450,
                                        height: 120,
                                        child: Text(
                                          myCubit.firstSectionData!
                                              .titleFirstSection,
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
                                        child: SizedBox(
                                          width: 300,
                                          height: 75,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100, 0, 0, 0),
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
                                              child:
                                                  Image.asset("whitepack.png")),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 30),
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
                      ),
                    ),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 50),
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
                                        child: Image.asset("doghand.png")),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: SizedBox(
                                    height: 10,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Color(0xff1d162f),
                                  onTap: () {
                                    Profiles.forEach((profile) =>
                                        profile.isSelected = false);
                                    Profiles[1].isSelected = true;
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
                                    Profiles.forEach((profile) =>
                                        profile.isSelected = false);
                                    Profiles[0].isSelected = true;
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
                                                BorderRadius.circular(100)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                            children:
                                                [first, second, third].map((e) {
                                              return e > pets.length - 1
                                                  ? SizedBox()
                                                  : petCard(pets[e]);
                                            }).toList(),
                                          );
                                        },
                                        itemCount: (pets.length / 3).ceil(),
                                        options: CarouselOptions(
                                          autoPlay: false,
                                          aspectRatio: 3,
                                        ),
                                        carouselController: carouselController,
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
                                                BorderRadius.circular(100)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                          Container(height: 75, child: Card())
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
                        ],
                      ),
                    ),
                    CustomFooter()
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

  Widget petCard(int index) {
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
            Image.asset(
              "dog.png",
              height: 200,
            ),
            Text("Pet $index"),
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

  Widget categoryCard(String categoryName, String imageName) {
    return SizedBox(
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
                  Image.asset(
                    imageName,
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Text(
                      categoryName,
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
    );
  }
}
