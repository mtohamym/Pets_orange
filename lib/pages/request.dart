import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:petology_test/bloc/request/request_cubit.dart';
import 'package:petology_test/bloc/request/request_states.dart';
import 'package:petology_test/data/models/home_model.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key? key}) : super(key: key);
  String? dropdownvalue;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController colorTextController = TextEditingController();
  TextEditingController loactionTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  List _isHovering = [false, false, false, false];
  List<String> items = ["item1", "item2"];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            RequestCubit myCubit = RequestCubit.get(context);

            return MaterialApp(
                home: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomNavBar(isTransparent: true),
                    SizedBox(
                      width: screenSize.width,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Image.asset("doghand.png",
                                width: 300, height: 300),
                            right: 200,
                            top: 100,
                          ),
                          Positioned(
                            child: Image.asset("doghand.png",
                                width: 300, height: 300),
                            left: 200,
                            bottom: 100,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(50),
                              width: 600,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(width: 3, color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Request",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        myCubit.pickImage();
                                      },
                                      child: myCubit.base64string == null
                                          ? Image.asset(
                                              "cam.png",
                                              height: 300,
                                              width: 300,
                                            )
                                          : Image.memory(
                                              myCubit.bytesFromPicker!,
                                              height: 300,
                                              width: 300,
                                            ),
                                    ),
                                    customTextField("Name", nameTextController),
                                    //TODO Dropdown

                                    customDropDown("Category",
                                        myCubit.categoryDropItems, context),
                                    ConditionalBuilder(
                                      condition: myCubit.filtersData != null,
                                      fallback: (BuildContext context) {
                                        return Text("Choose Category to Fill");
                                      },
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: customDropDown(
                                                        "Year",
                                                        myCubit
                                                            .categoryDropItems,
                                                        context)),
                                                Expanded(
                                                    child: customDropDown(
                                                        "Month",
                                                        myCubit
                                                            .categoryDropItems,
                                                        context)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: customDropDown(
                                                        "Size",
                                                        myCubit.genderDropItems,
                                                        context)),
                                                Expanded(
                                                    child: customDropDown(
                                                        "Breed",
                                                        myCubit.genderDropItems,
                                                        context)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: customDropDown(
                                                        "Gender",
                                                        myCubit.genderDropItems,
                                                        context)),
                                                Expanded(
                                                    child: customDropDown(
                                                        "Breed",
                                                        myCubit
                                                            .categoryDropItems,
                                                        context)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: customDropDown(
                                                        "Hair Lenght",
                                                        myCubit.genderDropItems,
                                                        context)),
                                                Expanded(
                                                    child: customDropDown(
                                                        "Care & Behavior",
                                                        myCubit.genderDropItems,
                                                        context)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: customDropDown(
                                                        "House Trained",
                                                        myCubit.genderDropItems,
                                                        context)),
                                                Expanded(
                                                    child: customDropDown(
                                                        "Color",
                                                        myCubit.genderDropItems,
                                                        context)),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  top: 20,
                                                  bottom: 5),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Detect your current location",
                                                  ),
                                                ],
                                              ),
                                            ),
                                            customTextField("Location",
                                                loactionTextController,
                                                icon: Icon(Icons.location_on),
                                                useIcon: true),
                                            customTextField("Phone number",
                                                phoneTextController),
                                            SizedBox(
                                                height: 100,
                                                child: customTextField(
                                                    "Description",
                                                    descriptionTextController)),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Vaccinated (up to date)"),
                                                  Checkbox(
                                                      value: false,
                                                      onChanged: (value) {})
                                                  //Todo: check box
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    width: 400,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff492f24),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Text(
                                                      "Send",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomFooter()
                  ],
                ),
              ),
            ));
          }),
    );
  }

  Widget customDropDown(String hint, List<String> items, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: defaultDropDownMenu(
            onChanged: (String newValue) {
              dropdownvalue = newValue;
              if (hint == "Category") {
                hint = newValue;
                if (newValue == "Dog") {
                  RequestCubit.get(context)..getDataByCategory("1");
                } else {
                  RequestCubit.get(context)..getDataByCategory("2");
                }
              } else {
                hint = newValue;
              }
            },
            items: items,
            selectedItem: dropdownvalue,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.white,
            dropDownColor: Colors.white,
            borderColor: Colors.transparent,
            labelText: hint,
            alignment: Alignment.center,
            itemTextStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(String hint, TextEditingController controller,
      {Icon icon = const Icon(Icons.location_on), bool useIcon = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  suffixIcon: useIcon ? icon : null,
                  hintStyle: TextStyle(fontSize: 13),
                  hintText: hint,
                  border: InputBorder.none),
              controller: controller,
            ),
          )),
    );
  }
}
