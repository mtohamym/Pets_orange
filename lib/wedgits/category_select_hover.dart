import 'package:flutter/material.dart';
import 'package:petology_test/wedgits/category_select.dart';

class CategorySelectHover extends StatelessWidget {
  const CategorySelectHover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.only(top: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      color: Colors.white,
      child: Container(
        width: screenSize.width / 1.5,
        height: screenSize.height / 1.5,
        child: CategorySelect(),
      ),
    );
  }
}
