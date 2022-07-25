import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class CustomRadio extends StatelessWidget {
  Profile _profile;

  CustomRadio(this._profile);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromRGBO(255, 227, 197, 1),
        child: Container(
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
            ))
            ],
          ),
        ));
  }
}

