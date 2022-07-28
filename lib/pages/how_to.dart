import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/how_to_feed/how_to_feed_cubit.dart';
import 'package:petology_test/bloc/how_to_feed/how_to_feed_states.dart';
import 'package:petology_test/wedgits/category_select_hover.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/nav_bar.dart';

class HowToPage extends StatelessWidget {
  HowToPage({Key? key}) : super(key: key);

  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocProvider(
        lazy: false,
        create: (BuildContext context) =>
            HowToFeedCubit()..getHowToFeedData('1'),
        child: BlocConsumer<HowToFeedCubit, HowToFeedStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              HowToFeedCubit myCubit = HowToFeedCubit.get(context);
              return Scaffold(
                  body: ConditionalBuilder(
                condition: myCubit.howToFeedData != null,
                builder: (context) => SingleChildScrollView(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          myCubit.setShowHover(false);
                        },
                        child: Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomNavBar(
                                        isTransparent: true,
                                        shoeCategorySelectHover: (value) {
                                          myCubit.setShowHover(value);
                                        }),
                                    Image.asset(
                                      "doghand.png",
                                      width: 500,
                                      height: 500,
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                width: screenSize.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myCubit.howToFeedData!.title,
                                      style: TextStyle(
                                          color: Color(0xff492f24),
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(myCubit.howToFeedData!.body,
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontSize: 20)),
                                    )
                                  ],
                                ),
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
                ),
                fallback: (BuildContext context) => Text("No Data"),
              ));
            }));
  }
}
/**
 *
 */