import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/category.dart';

class CustomRadio extends StatelessWidget {
  Profile _profile;
  Color _color;

  CustomRadio(this._profile, this._color);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: _color,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20)),
        height: 80,
        width: 80,
        alignment: Alignment.center,
        margin: new EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                _profile.icon,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _profile.name,
              style: TextStyle(
                color: Color.fromARGB(73, 47, 36, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
