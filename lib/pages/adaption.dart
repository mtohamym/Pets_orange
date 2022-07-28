import 'dart:convert';
import 'dart:js';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:petology_test/bloc/adaption/adaption_cubit.dart';
import 'package:petology_test/wedgits/category_select_hover.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

import '../bloc/adaption/adaption_states.dart';
import '../data/models/pet.dart';

class AdaptionPage extends StatelessWidget {
  String categoryId = "";

  AdaptionPage(this.categoryId, {Key? key}) : super(key: key);

  String? dropdownvalue = '';

  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => AdaptionCubit()
        ..getFiltersByCategory(categoryId)
        ..getPetsData(categoryId),
      child: BlocConsumer<AdaptionCubit, AdaptionStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            AdaptionCubit myCubit = AdaptionCubit.get(context);

            return Scaffold(
              backgroundColor: Color.fromARGB(255, 250, 250, 250),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        myCubit.setShowHover(false);
                      },
                      child: Container(
                        width: screenSize.width,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            CustomNavBar(
                                isTransparent: false,
                                shoeCategorySelectHover: (value) {
                                  myCubit.setShowHover(value);
                                }),
                            Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 50,
                                      right: 250,
                                      child: Image.asset("doghand.png"),
                                      width: 250,
                                      height: 250),
                                  Positioned(
                                    left: 100,
                                    top: 100,
                                    child: Image.asset("doghand.png"),
                                    width: 250,
                                    height: 250,
                                  ),
                                  Positioned(
                                      right: 100,
                                      top: 200,
                                      child: Image.asset("doghand.png"),
                                      width: 250,
                                      height: 250),
                                  Positioned(
                                      bottom: 50,
                                      child: Image.asset("doghand.png"),
                                      width: 250,
                                      height: 250),
                                  Positioned(
                                      bottom: 50,
                                      right: 250,
                                      child: Image.asset("doghand.png"),
                                      width: 250,
                                      height: 250),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              filterSection("Breed",
                                                  screenSize.width / 7),
                                              filterSection(
                                                  "Age", screenSize.width / 7),
                                              filterSection(
                                                  "Size", screenSize.width / 7),
                                              filterSection("Good With",
                                                  screenSize.width / 7)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              filterSection("Gender",
                                                  screenSize.width / 7),
                                              filterSection("Color",
                                                  screenSize.width / 7),
                                              filterSection("Hair Lenght",
                                                  screenSize.width / 7),
                                              filterSection("Care & Behavior",
                                                  screenSize.width / 7)
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 450,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3),
                                                shrinkWrap: true,
                                                itemCount:
                                                    myCubit.listOfData.length,
                                                itemBuilder: (context, index) {
                                                  return petCard(myCubit
                                                      .listOfData[index]);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: InkWell(
                                            child: Text(
                                              "Show More...",
                                              style: TextStyle(
                                                  color: Color(0xff492f24),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
              ),
            );
          }),
    );
  }

  Widget petCard(Pet pet) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      width: 300,
      decoration: BoxDecoration(
          color: Color(0xffeaeaea), borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: pet.image!.isNotEmpty
                ? Image.memory(Base64Decoder()
                    .convert(pet.image![0].toString().substring(22)))
                : Image.asset("Logo.png"),
            height: 200,
          ),
          Text(
            pet.name.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff492f24),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Send",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
          Text(
            "${pet.user!.firstName.toString()}",
            style: TextStyle(fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget filterSection(String name, double width) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            customDropDown(["1", "2"], context, "mapKey", categoryId)
          ],
        ),
      ),
    );
  }

  Widget customDropDown(
      List<String> items, context, String mapKey, String categoryId) {
    String? dropDownValue;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: defaultDropDownMenu(
            onChanged: (String newValue) {
              dropDownValue = newValue;
              AdaptionCubit.get(context).selections[mapKey] = "newValue";
              AdaptionCubit.get(context)..getPetsData(categoryId);
            },
            items: items,
            selectedItem: dropDownValue,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.white,
            dropDownColor: Colors.white,
            borderColor: Colors.transparent,
            alignment: Alignment.center,
            itemTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
